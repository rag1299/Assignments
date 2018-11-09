//
//  WMultiplier.bsv
//  Created by Raghavendra Goli on 29/09/18.
//  Copyright © 2018 Raghavendra Goli and Siva Adike. All rights reserved.
//

package WMultiplier;

// Un-comment this for 4-bit multiplier & change the CLAdder size accordingly
// typedef 4 InBusSize;
// typedef 8 OutBusSize;
// typedef 3 Stages;
// typedef 9 NoOfRegRequired;

// Un-comment this for 8-bit multiplier & change the CLAdder size accordingly
typedef 8 InBusSize;  // inputs bus size
typedef 16 OutBusSize;  // output bus size 
typedef 5 Stages; // number of stages in the W-Multiplier
typedef 23 NoOfRegRequired;  // number of registers required for carry save adder to store partial products

import Vector::*;
import CLAdder::*;

// interface for our WMultiplier
interface Multiplier_IFC;
	method Action put(Bit#(InBusSize) x, Bit#(InBusSize) y);
	method ActionValue#(Bit#(OutBusSize)) get() ;
endinterface

(* synthesize *)
module mkWMultiplier (Multiplier_IFC);
    // defining registers for x, y and inputs for CLAdder and product 
   	Reg#(Bit#(InBusSize)) x <- mkReg(0);
    Reg#(Bit#(InBusSize)) y <- mkReg(0);
    Reg#(Bit#(CLAdder::InBusSize)) cla_x <- mkReg(0);
    Reg#(Bit#(CLAdder::InBusSize)) cla_y <- mkReg(0);
   	Reg#(Bit#(OutBusSize)) product <- mkReg(0);

    // definitions of flags for intermedicate stage controlling for rules
   	Reg#(bit) finishFlag <- mkReg(0);
   	Reg#(Bool) available <- mkReg(True);  // set it to False when running from module itself
    Reg#(Bool) stage0Flag <- mkReg(False);
    Reg#(Bool) stage1Flag <- mkReg(False);
    Reg#(Bool) stage2Flag <- mkReg(False);
    Reg#(Bool) stage3Flag <- mkReg(False);
    Reg#(Bool) finalStageFlag <- mkReg(False);
    Reg#(Bool) claFlag <- mkReg(False);
    Vector#(Stages, Reg#(Bool)) stageFlag <- replicateM(mkReg(False));

    // register bank for storing partial products
    Vector#(OutBusSize, Reg#(Bit#(1))) stageReg[valueOf(NoOfRegRequired)]; 

    // initializing to zero
    for(Integer i=0; i<valueOf(NoOfRegRequired); i=i+1) begin
      stageReg[i] <- replicateM(mkReg(0));
    end

    // Making instance of CLAdder
    Adder_IFC adder1 <- mkCLAdder;

    //static stage0 for storing paritial products
    rule stage0(stageFlag[0] == False && !available && finishFlag == 0);
      int noRegs = fromInteger(valueOf(InBusSize));
      let mlpr = y;
      Bit#(OutBusSize) mlpnd = zeroExtend(x);

      int csAdders = noRegs/3;
      for(int i=0; i<csAdders; i=i+1) begin
        let index = 3*i;
        if(mlpr[3*i] == 1) begin
          let t1 = mlpnd << index;
          for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[3*i][j] <= t1[j];
          end
        end
        if(mlpr[3*i+1] == 1) begin
          let t2 = mlpnd << index+1;
          for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[3*i+1][j] <= t2[j];
          end
        end
        if(mlpr[3*i+2] == 1) begin
          let t3 = mlpnd << index+2;
          for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[3*i+2][j] <= t3[j];
          end
        end
      end
      for(int i=0; i<noRegs%3; i=i+1) begin
        if(mlpr[(3 * (csAdders) + i)] == 1) begin
          let t7 = mlpnd << (3 * (csAdders) + i);
          for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[(3 * (csAdders) + i)][j] <= t7[j];
          end
        end
      end

      stageFlag[0] <= True;
    endrule: stage0

    // function to get No of Registers in the previous stage (used in carry save adder )
    function int getNoRegs (int s, int firstStageCount);
        if(s==1)
          return firstStageCount;
        else begin
          let temp = getNoRegs(s-1,firstStageCount);
          return ((temp / 3) * 2) + (temp % 3);
        end
    endfunction

    // function to get index in StageReg array of registers, to access previous stage partial products 
    // in carry save adder
    function int getIndex (int s, int firstStageCount);
        if(s==1)
          return 0;
        else begin
          let temp = getNoRegs(s-1,firstStageCount);
          return getIndex(s-1, firstStageCount) + getNoRegs(s-1, firstStageCount);
        end
    endfunction

    // dynamic rules for remaining stages
    for(Integer s=1; s<valueOf(Stages); s=s+1) begin
      rule stageCompute(stageFlag[s] == False && stageFlag[s-1] == True && !available && finishFlag == 0);
        let noRegs = getNoRegs(fromInteger(s), fromInteger(valueOf(InBusSize)));
        let indexOfReg = getIndex(fromInteger(s), fromInteger(valueOf(InBusSize)));

        for(int i=0; i<noRegs/3; i=i+1) begin
          let p = stageReg[indexOfReg+3*i];
          let q = stageReg[indexOfReg+3*i+1];
          let r = stageReg[indexOfReg+3*i+2];
          // for sum
          for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[indexOfReg+noRegs+2*i][j] <= p[j] ^ q[j] ^ r[j];
          end
          // for carry
          for(Integer j=1; j<valueOf(OutBusSize); j=j+1) begin
            stageReg[indexOfReg+noRegs+2*i+1][j] <= (p[j-1] & q[j-1]) | (q[j-1] & r[j-1]) | (r[j-1] & p[j-1]);
          end
        end

        int csAdders = noRegs/3;
        if(noRegs%3 == 1) begin
          for(Integer k=0; k<valueOf(OutBusSize); k=k+1) begin
            stageReg[indexOfReg+2*csAdders+noRegs][k] <= stageReg[indexOfReg+3*csAdders][k];
          end
        end
        else if(noRegs%3 == 2) begin
          for(Integer k=0; k<valueOf(OutBusSize); k=k+1) begin
            stageReg[indexOfReg+2*csAdders+noRegs][k] <= stageReg[indexOfReg+3*csAdders][k];
            stageReg[indexOfReg+2*csAdders+noRegs+1][k] <= stageReg[indexOfReg+3*csAdders+1][k];
          end
        end
        stageFlag[s] <= True;
      endrule
    end

    rule finalStage(stageFlag[valueOf(Stages)-1] == True && finalStageFlag == False && !available && finishFlag == 0);
      let indexOfReg = getIndex(fromInteger(valueOf(Stages)-1), fromInteger(valueOf(InBusSize)));
      Bit#(CLAdder::InBusSize) a = 0;
      Bit#(CLAdder::InBusSize) b = 0;
      let c = stageReg[indexOfReg];
      let d = stageReg[indexOfReg+1];
      for(Integer i=0; i<valueOf(OutBusSize); i=i+1) begin
        a[i] = c[i];
        b[i] = d[i];
      end
      cla_x <= a;
      cla_y <= b;
      finalStageFlag <= True;
    endrule: finalStage

    rule doCLA(finalStageFlag == True && claFlag == False && !available && finishFlag == 0);
      adder1.put(cla_x, cla_y);
      claFlag <= True;
    endrule: doCLA

    rule finish(claFlag == True && !available && finishFlag == 0);
      let z = adder1.get();
      adder1.ack();
      product <= z[valueOf(OutBusSize)-1:0];  // stored product value
      finishFlag <= 1;
    endrule: finish

    // The below is for debugging purpose
    
    // rule debug(finishFlag == 1);
    //   for(Integer i=0; i<9; i=i+1) begin
    //     let regValue = stageReg[i];
    //     Bit#(OutBusSize) temp = 0;
    //     for(Integer j=0; j<valueOf(OutBusSize); j=j+1) begin
    //       temp[j] = regValue[j];
    //     end
    //     $display(temp);
    //   end
    //   $display(product);
    //   // $finish(0);
    // endrule: debug

   	method Action put(Bit#(InBusSize) m1, Bit#(InBusSize) m2) if(available);
   		x <= m1;
      y <= m2;
      available <= False;
   	endmethod

   	method ActionValue#(Bit#(OutBusSize)) get() if(!available && finishFlag == 1);
   		actionvalue
   			available <= True;
        finishFlag <= 0;
   			return product;
   		endactionvalue
   	endmethod
endmodule: mkWMultiplier

endpackage: WMultiplier