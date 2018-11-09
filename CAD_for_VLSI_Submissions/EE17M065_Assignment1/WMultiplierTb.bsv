//
//  WMultiplierTb.bsv
//  Created by Raghavendra Goli on 29/09/18.
//  Copyright © 2018 Raghavendra Goli and Siva Adike. All rights reserved.
//
package WMultiplierTb;

import WMultiplier::*;

(* synthesize *)
module mkWMultiplierTb(Empty);

  Reg#(Bit#(InBusSize)) x   <- mkReg(63);
  Reg#(Bit#(InBusSize)) y   <- mkReg(17);
  Reg#(Bool)  putFlag       <- mkReg(False);
  Reg#(Bool)  doneFlag      <- mkReg(False);

 	// The dut	--------------
 	Multiplier_IFC dut <- mkWMultiplier;
	// RULES 	  --------------
 	rule rule_tb_1(putFlag == False);
  	  $display ("    x = %d, y = %d", x, y);
    	dut.put (x, y);
      putFlag <= True;
 	endrule
 
 	rule rule_tb_2(putFlag == True && doneFlag == False);
    	let z = dut.get();
      doneFlag <= True;
    	$display("    Product = %d", z);
 	endrule

 	// TASK: Add a rule to invoke $finish(0) at the appropriate moment
 	rule stop (doneFlag == True);
     	$finish(0);
 	endrule
endmodule: mkWMultiplierTb

endpackage: WMultiplierTb