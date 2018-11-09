package Squarer;

typedef 8 BusSize;
// typedef Bit#(valueOf(BusSize)) in_dataType;
// typedef Bit#(valueOf(BusSize)) out_dataType;

interface Squarer_IFC;
	method Action putInput(Bit#(BusSize) x);
	method ActionValue#(Bit#(BusSize)) getOutput();
endinterface

(* synthesize *)
module mkSquarer (Squarer_IFC);
	Reg#(Bit#(BusSize)) x <- mkReg(8);
	Reg#(Bit#(BusSize)) y <- mkReg(0);
	Reg#(bit) flag <- mkReg(0);
	Reg#(Bool) available <- mkReg(True);

	rule changeFirstBit (flag == 0);
		Bit#(BusSize) temp = x;
		Bit#(BusSize) temp1 = temp * temp;
		y <= temp1;
		flag <= 1;
	endrule
	rule done (flag == 1);
		$display ("x squared = %0d",y);
			$finish (0);
	endrule

	method Action putInput(Bit#(BusSize) m1) if(available);
		x <= m1;
		available <= False;
	endmethod

	method ActionValue#(Bit#(BusSize)) getOutput() if(!available && flag == 1);
		actionvalue
			available <= True;
			return y;
		endactionvalue
	endmethod
endmodule: mkSquarer

endpackage: Squarer