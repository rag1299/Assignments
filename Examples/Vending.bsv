// === Copyright 2006 Bluespec, Inc.  All rights reserved ===

// This package implements a vending machine which accepts 10-cent and 50-cent
// input coins, and dispenses a 50-cent packet of chewing gum whenever there
// is sufficient money in the machine.  There is a "money back" button which
// returns any remaining credit.  The machine is allowed to refuse input
// (i.e. it might refuse to accept a coin, or refuse to allow the "money back"
// button to be pressed).  Money is always returned as 10-cent coins; it is
// assumed that the supply of such coins never runs out.
//
// It might be worth noting that this design, and the test program to drive it
// (TestVending.bsv) was originally drafted as a working design in less than
// an hour.  The design has been slightly altered since then, and most of the
// commentary has also been added later.

package Vending;

	import ConfigReg::*;

// First, as usual, we define the design's interface.  The inputs to the
// machine (coin input and request for money back) become Action methods --
// note that they can have implicit conditions, which provide the machine's
// ability to refuse input.  The outputs are value methods of type Bool: it is
// assumed that one item of the relevant kind will be dispensed during each
// cycle for which such a value is True.

interface Vending;
   // 10-cent deposit input:
   method Action ten_cent_in();
   // 50-cent deposit input:
   method Action fifty_cent_in();
   // Money back button input:
   method Action money_back_button();
   // dispense 10 cents output:
   method Bool dispense_ten_cents();
   // dispense chewing gum output:
   method Bool dispense_gum();
endinterface

// The Vending Machine module:

(* synthesize *)
module mkVending(Vending);
   
   // A register to keep count of money in the vending machine (in cents): 
   Reg#(UInt#(7)) count <- mkConfigReg(0);
   
   // A register saying whether money return is in progress:
   Reg#(Bool) money_back <- mkReg(False);

// We next declare apparatus for connecting the rules which control the
// dispensing, of money and gum, to the output methods.  One might use
// registers for this purpose; but this would introduce extra latency, and one
// would have to arrange to unset the registers whenever dispensing had just
// happened.  So instead we use one of the Wires family: the appropriate one
// is a PulseWire.  These have a "send" Action method, to assert a signal;
// they also have a Bool "_read" method, just like a Reg, to tell whether a
// signal has been asserted.
   
   // wire to control dispense money output
   Wire#(Bool) dispense_money <- mkDWire(False);
   
   // wire to control gum dispenser output
   Wire#(Bool) gum_control <- mkDWire(False);


// The rules:

// Note that each rule decrements the count, to maintain the correct credit.
// The atomicity of rules ensures that there is no danger of a race condition
// separating the actions of dispensing and decrementing.  The test in the
// first rule maintains the invariant that money_back is never True when there
// is insufficient credit to dispense another 10 cents.  

	rule rl_disp_count;
		$display("Count= %d at time %0t",count,$time);
	endrule
   
   // rule that controls dispensing of money
   rule do_dispense_money(money_back);
      let new_count = count - 10;
      count <= new_count;
      dispense_money<= True;
      if(new_count == 0)
	  	money_back <= False;
   endrule
   
   // rule that controls dispensing of gum
   rule do_dispense_gum(!money_back && count >= 50);
      count <= count - 50;
      gum_control<= True;
   endrule
   
// The methods:

// First come the three input methods.  Note that they are all inhibited if
// the return of money is in progress.  The money_back button is also
// inhibited if there is no money to return.
   
   method Action ten_cent_in() if(!money_back);
      count <= count + 10;
   endmethod
   
   method Action fifty_cent_in() if(!money_back);
      count <= count + 50;
   endmethod     
   
   method Action money_back_button() if(!money_back 
					&& count > 0);
      money_back <= True;
   endmethod
   
   // Note that the money_back_button method conflicts with the other two
   // Action methods: this is because it writes to the money_back register,
   // which the other two read (in their conditions), while the others write
   // to the count register, which this one reads.  Since any method which
   // writes to a register has to fire (in the rule-semantics ordering)
   // *after* any method which merely reads it in the same cycle, the
   // money_back_button method cannot fire in the same cycle as the other
   // two.  See the note at the end of the TestVending package for further
   // discussion.

	// Finally, the output methods simply convey whether the corresponding
	// PulseWire has been asserted by the relevant rule.
   
   method Bool dispense_ten_cents();
	   return dispense_money;
   endmethod

   method Bool dispense_gum();
	   return gum_control;
   endmethod

endmodule

endpackage
