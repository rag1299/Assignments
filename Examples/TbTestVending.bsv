package TbTestVending;
	import Vending::*;

	(*synthesize*)
	module mkTbTestVending(Empty);

		Vending machine <-mkVending;
		Reg#(int) rg_state_control <- mkReg(0);


		rule rl_display_output;
     		if (machine.dispense_gum)
	 			$display("Dispensing gum at time %0t", $time);
     		if (machine.dispense_ten_cents)
	 			$display("Dispensing ten cents at time %0t", $time);
		endrule

		rule rl_update_state_control;
			rg_state_control<= rg_state_control + 1;
		endrule

		rule rl_1(rg_state_control==0);
			machine.money_back_button;
			$display("Money back button pressed at time %0t", $time);
		endrule

		rule rl_2(rg_state_control<7);
			machine.ten_cent_in;
			$display("Inserting ten cents at time %0t", $time);
		endrule

		rule rl_3(rg_state_control==7);
			machine.ten_cent_in;
			$display("Inserting ten cents at time %0t", $time);
		endrule

		rule rl_4(rg_state_control==8);
			machine.fifty_cent_in;
			$display("Inserting fifty cents at time %0t", $time);
		endrule

		rule rl_5(rg_state_control==12);
			machine.money_back_button;
			$display("Pushed money back button at time %0t", $time);
		endrule

		rule rl_6(rg_state_control==20);
			$display("Finishing at time %0t", $time);
			$finish(0);
		endrule

	endmodule
endpackage
