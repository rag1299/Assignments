//
//  CLAdderTb.bsv
//  Created by Raghavendra Goli on 29/09/18.
//  Copyright © 2018 Raghavendra Goli and Siva Adike. All rights reserved.
//
package CLAdderTb;

import CLAdder::*;

(* synthesize *)
module mkCLAdderTb(Empty);
  // Defining registers for passing x,y to CLAdder
  Reg#(Bit#(InBusSize)) x   <- mkReg(400);
  Reg#(Bit#(InBusSize)) y   <- mkReg(300);
  Reg#(Bool)  putFlag       <- mkReg(False);
  Reg#(Bool)  doneFlag      <- mkReg(False);

 	// initiating dut for CLAdder
 	Adder_IFC dut <- mkCLAdder;

	// rule for putting data into CLAdder
 	rule rule_tb_1(putFlag == False);
  	  $display ("    x = %d, y = %d", x, y);
    	dut.put (x, y);
      putFlag <= True;
 	endrule
  
  // rule & condition for getting output from the adder
 	rule rule_tb_2(putFlag == True && doneFlag == False);
    	let z = dut.get();
      doneFlag <= True;
    	$display("    Sum = %d", z);
 	endrule

 	// TASK: Add a rule to invoke $finish(0) at the appropriate moment
 	rule stop (doneFlag == True);
     	$finish(0);
 	endrule
endmodule: mkCLAdderTb

endpackage: CLAdderTb