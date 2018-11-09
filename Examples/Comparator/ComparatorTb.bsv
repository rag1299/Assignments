package ComparatorTb;
import Comparator::*;

(* synthesize *)
module mkComparatorTb(Empty);

  Reg#(Bit#(BusSize)) x   <- mkReg(23);
  Reg#(Bit#(BusSize)) y   <- mkReg(9);
  Reg#(Bool) putFlag <- mkReg(False);
  Reg#(Bool) doneFlag <- mkReg(False);

 	// The dut	--------------
 	Comparator_IFC dut <- mkComparator;
	// RULES 	  --------------
 	rule rule_tb_1(putFlag == False);
  	  $display ("    x = %d, y = %d", x, y);
    	dut.put (x, y);
      putFlag <= True;
 	endrule
 
 	rule rule_tb_2(putFlag == True && doneFlag == False);
			let ss = dut.getSmall();
			let bb = dut.getBig();
			dut.ack();
			$display("Small : %d , Big : %d",ss, bb);
      doneFlag <= True;
 	endrule

 	// TASK: Add a rule to invoke $finish(0) at the appropriate moment
 	rule stop (doneFlag == True);
     	$finish(0);
 	endrule
endmodule: mkComparatorTb
endpackage: ComparatorTb