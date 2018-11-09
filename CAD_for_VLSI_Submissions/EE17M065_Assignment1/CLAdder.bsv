//
//  CLAdder.bsv
//  Created by Raghavendra Goli on 29/09/18.
//  Copyright © 2018 Raghavendra Goli and Siva Adike. All rights reserved.
//
package CLAdder;

// Defining parameters for CLAdder

// typedef 8 InBusSize;  // For input of size 16 bit , keep 16
// typedef 9 OutBusSize; // Output width will be +1
// typedef 3 Stages; // Define the number of stages before hand

typedef 16 InBusSize;  // For input of size 16 bit , keep 16
typedef 17 OutBusSize; // Output width will be +1
typedef 4 Stages; // Define the number of stages before hand


import Vector::*;

// Interface for our CLAdder
interface Adder_IFC;
	method Action put(Bit#(InBusSize) x, Bit#(InBusSize) y);
	method Action ack();
	method Bit#(OutBusSize) get();
endinterface

(* synthesize *)
module mkCLAdder (Adder_IFC);
	// defining registers for inputs and outputs
   	Reg#(Bit#(InBusSize)) x <- mkReg(0);
    Reg#(Bit#(InBusSize)) y <- mkReg(0);
   	Reg#(Bit#(OutBusSize)) sum <- mkReg(0);

   	// flags for checking if level is completed, ex. carry status generator
   	Reg#(bit) finishFlag <- mkReg(0);
   	Reg#(Bool) available <- mkReg(True);  // set it to True when running from Tb
    Reg#(Bool) carryfinishFlag <- mkReg(False);
    Vector#(Stages, Reg#(Bool)) stageStatus <- replicateM(mkReg(False));
    Reg#(Bool) sumFinishFlag <- mkReg(False);

    // storing carry status in two bits, 1 is MSB and other is LSB
    Vector#(InBusSize, Reg#(bit)) carryStatusLsb <- replicateM(mkReg(0));
    Vector#(InBusSize, Reg#(bit)) carryStatusMsb <- replicateM(mkReg(0));

    // storing intermediate outputs at each level in recursive doubling
    Vector#(InBusSize, Reg#(Bit#(1))) stagesMsb[valueOf(Stages)]; 
    Vector#(InBusSize, Reg#(Bit#(1))) stagesLsb[valueOf(Stages)];

    // initializing default value 0 at intermediate levels in recursive doubling
    for(Integer i=0; i<valueOf(Stages); i=i+1) begin
      stagesMsb[i] <- replicateM(mkReg(0));
      stagesLsb[i] <- replicateM(mkReg(0));
    end

    // rule for carry status generator 
    rule carryStatusGenerator(carryfinishFlag == False && !available && finishFlag == 0);
      let temp1 = x;
      let temp2 = y;
      for(Integer i=0; i<valueOf(InBusSize); i=i+1) begin
        carryStatusLsb[i] <= temp1[i] & temp2[i];
        carryStatusMsb[i] <= temp1[i] | temp2[i];
      end
      carryfinishFlag <= True;
    endrule: carryStatusGenerator

    // static rule for first stage
    rule stage1(stageStatus[0] == False && carryfinishFlag == True && !available && finishFlag == 0);
      let stage0StatusMsb = carryStatusMsb;
      let stage0StatusLsb = carryStatusLsb;
      for(Integer i=0; i<1; i=i+1) begin
        stagesMsb[0][i] <= stage0StatusLsb[i];
        stagesLsb[0][i] <= stage0StatusLsb[i];
      end
      for(Integer i=1; i<valueOf(InBusSize); i=i+1) begin
        stagesLsb[0][i] <= stage0StatusLsb[i] | (stage0StatusLsb[i-1] & stage0StatusMsb[i]);
        stagesMsb[0][i] <= stage0StatusLsb[i] | (stage0StatusMsb[i-1] & stage0StatusMsb[i]);
      end
      stageStatus[0] <= True;
    endrule: stage1

    // dynamic rules for remining number of stages
    for(Integer j=1; j<valueOf(Stages); j=j+1) begin
      rule stage(stageStatus[j] == False && stageStatus[j-1] == True && !available && finishFlag == 0);
        let prevMsb = stagesMsb[j-1];
        let prevLsb = stagesLsb[j-1];

        for(int i=0; i<(1 << j); i=i+1) begin
          stagesMsb[j][i] <= prevLsb[i];
          stagesLsb[j][i] <= prevLsb[i];
        end
        for(int i=(1 << j); i<fromInteger(valueOf(InBusSize)); i=i+1) begin
          stagesLsb[j][i] <= prevLsb[i] | (prevLsb[i-1] & prevMsb[i]);
          stagesMsb[j][i] <= prevLsb[i] | (prevMsb[i-1] & prevMsb[i]);
        end
        stageStatus[j] <= True;
      endrule
    end

    // sumRule generates sum outputs and makes finishFlag to 1
    rule sumRule(stageStatus[valueOf(Stages)-1] == True && sumFinishFlag == False && !available && finishFlag == 0);
      let temp = stagesLsb[valueOf(Stages)-1];
      let value1 = x;
      let value2 = y;
      Bit#(OutBusSize) tempSum= 0;
      tempSum[0] = value1[0] ^ value2[0];
      for(Integer i=1; i<valueOf(InBusSize); i=i+1) begin
        tempSum[i] = value1[i] ^ value2[i] ^ temp[i-1];
      end
      tempSum[valueOf(OutBusSize)-1] = temp[valueOf(InBusSize)-1];
      sum <= tempSum;
      sumFinishFlag <= True;
      finishFlag <= 1;
    endrule: sumRule

    // For debugging purpose
   	// rule Debug(finishFlag == 1);
    //   for(Integer i=0; i<valueOf(InBusSize); i=i+1) begin
    //     $display("%0d %0d", carryStatusMsb[i], carryStatusLsb[i]);
    //   end
    //   $display("BREAK");
    //   for(Integer i=0; i<valueOf(InBusSize); i=i+1) begin
    //     $display("%0d %0d", stagesMsb[0][i], stagesLsb[0][i]);
    //   end
    //   $display("BREAK");
    //   for(Integer i=0; i<valueOf(InBusSize); i=i+1) begin
    //     $display("%0d %0d", stagesMsb[1][i], stagesLsb[1][i]);
    //   end
    //   $display("BREAK");
    //   for(Integer i=0; i<valueOf(InBusSize); i=i+1) begin
    //     $display("%0d %0d", stagesMsb[2][i], stagesLsb[1][i]);
    //   end
    //   $display("  Sum : %0d",sum);
    //   $finish (0);
   	// endrule

   	method Action put(Bit#(InBusSize) m1, Bit#(InBusSize) m2) if(available);
   		x <= m1;
      	y <= m2;
      	available <= False;
   	endmethod

   	method Action ack() if(!available && finishFlag == 1);
 		available <= True;
      	sumFinishFlag <= False;
      	for(Integer i=0; i<valueOf(Stages); i=i+1) begin
        	stageStatus[i] <= False;
      	end
      	carryfinishFlag <= False;
      	finishFlag <= 0;
   	endmethod

    method Bit#(OutBusSize) get() if(!available && finishFlag == 1);
      	return sum;
    endmethod
endmodule: mkCLAdder

endpackage: CLAdder