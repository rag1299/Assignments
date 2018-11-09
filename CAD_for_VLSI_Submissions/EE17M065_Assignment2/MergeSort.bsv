package MergeSort;
	import Vector::*;
	(* synthesize *)
	
module mkMergeSort(Empty);
	Vector#(16, Reg#(Bit#(8))) storage[17];
	Reg#(Bool) flag1 <- mkReg(False);
	Reg#(Bool) flag2 <- mkReg(False);
	Reg#(Bool) flag3 <- mkReg(False);
	Reg#(Bool) flag4 <- mkReg(False);
	Reg#(Bool) flag5 <- mkReg(False);
	Reg#(Bool) flag6 <- mkReg(False);
	Reg#(Bool) flag7 <- mkReg(False);
	Reg#(Bool) flag8 <- mkReg(False);
	Reg#(Bool) flag9 <- mkReg(False);
	Reg#(Bool) flag10 <- mkReg(False);
	Reg#(Bool) flag11 <- mkReg(False);
	Reg#(Bool) flag12 <- mkReg(False);
	Reg#(Bool) flag13 <- mkReg(False);
	Reg#(Bool) flag14 <- mkReg(False);
	Reg#(Bool) flag15 <- mkReg(False);
	Reg#(Bool) flag16 <- mkReg(False);
	Reg#(Bool) finishFlag <- mkReg(False);

	storage[0][0] <- mkReg(103);
	storage[0][1] <- mkReg(55);
	storage[0][2] <- mkReg(204);
	storage[0][3] <- mkReg(26);
	storage[0][4] <- mkReg(206);
	storage[0][5] <- mkReg(93);
	storage[0][6] <- mkReg(118);
	storage[0][7] <- mkReg(126);
	storage[0][8] <- mkReg(139);
	storage[0][9] <- mkReg(103);
	storage[0][10] <- mkReg(77);
	storage[0][11] <- mkReg(144);
	storage[0][12] <- mkReg(166);
	storage[0][13] <- mkReg(15);
	storage[0][14] <- mkReg(16);
	storage[0][15] <- mkReg(204);
	for(Integer i=1; i<17; i=i+1) begin
		storage[i] <- replicateM(mkReg(0));
	end

rule rule1(!flag1);
// 2 input Sort Stage
	let x = storage[0];
	for(Integer i=0; i<8; i=i+1) begin
		if(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin
		storage[1][2*fromInteger(i)] <= x[2*fromInteger(i)];
		storage[1][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];
	end
	else begin
		storage[1][2*fromInteger(i)] <= x[2*fromInteger(i)+1];
		storage[1][2*fromInteger(i)+1] <= x[2*fromInteger(i)];
		end
	end

	flag1 <= True;
endrule: rule1

rule rule3(!flag3 && flag2);
// 2 input Sort Stage
	let x = storage[2];
	for(Integer i=0; i<8; i=i+1) begin
		if(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin
		storage[3][2*fromInteger(i)] <= x[2*fromInteger(i)];
		storage[3][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];
	end
	else begin
		storage[3][2*fromInteger(i)] <= x[2*fromInteger(i)+1];
		storage[3][2*fromInteger(i)+1] <= x[2*fromInteger(i)];
		end
	end

	flag3 <= True;
endrule: rule3

rule rule7(!flag7 && flag6);
// 2 input Sort Stage
	let x = storage[6];
	for(Integer i=0; i<8; i=i+1) begin
		if(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin
		storage[7][2*fromInteger(i)] <= x[2*fromInteger(i)];
		storage[7][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];
	end
	else begin
		storage[7][2*fromInteger(i)] <= x[2*fromInteger(i)+1];
		storage[7][2*fromInteger(i)+1] <= x[2*fromInteger(i)];
		end
	end

	flag7 <= True;
endrule: rule7

rule rule13(!flag13 && flag12);
// 2 input Sort Stage
	let x = storage[12];
	for(Integer i=0; i<8; i=i+1) begin
		if(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin
		storage[13][2*fromInteger(i)] <= x[2*fromInteger(i)];
		storage[13][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];
	end
	else begin
		storage[13][2*fromInteger(i)] <= x[2*fromInteger(i)+1];
		storage[13][2*fromInteger(i)+1] <= x[2*fromInteger(i)];
		end
	end

	flag13 <= True;
endrule: rule13

rule rule2(!flag2 && flag1);
//2 input Swap Stage
	let x = storage[1];
	storage[2][0] <= x[0];
	storage[2][1] <= x[2];
	storage[2][2] <= x[1];
	storage[2][3] <= x[3];
	storage[2][4] <= x[4];
	storage[2][5] <= x[6];
	storage[2][6] <= x[5];
	storage[2][7] <= x[7];
	storage[2][8] <= x[8];
	storage[2][9] <= x[10];
	storage[2][10] <= x[9];
	storage[2][11] <= x[11];
	storage[2][12] <= x[12];
	storage[2][13] <= x[14];
	storage[2][14] <= x[13];
	storage[2][15] <= x[15];

	flag2 <= True;
endrule: rule2

rule rule5(!flag5 && flag4);
//4 input Swap Stage
	let x = storage[4];
	storage[5][0] <= x[0];
	storage[5][1] <= x[2];
	storage[5][2] <= x[4];
	storage[5][3] <= x[6];
	storage[5][4] <= x[1];
	storage[5][5] <= x[3];
	storage[5][6] <= x[5];
	storage[5][7] <= x[7];
	storage[5][8] <= x[8];
	storage[5][9] <= x[10];
	storage[5][10] <= x[12];
	storage[5][11] <= x[14];
	storage[5][12] <= x[9];
	storage[5][13] <= x[11];
	storage[5][14] <= x[13];
	storage[5][15] <= x[15];

	flag5 <= True;
endrule: rule5

rule rule6(!flag6 && flag5);
//2 input Swap Stage
	let x = storage[5];
	storage[6][0] <= x[0];
	storage[6][1] <= x[2];
	storage[6][2] <= x[1];
	storage[6][3] <= x[3];
	storage[6][4] <= x[4];
	storage[6][5] <= x[6];
	storage[6][6] <= x[5];
	storage[6][7] <= x[7];
	storage[6][8] <= x[8];
	storage[6][9] <= x[10];
	storage[6][10] <= x[9];
	storage[6][11] <= x[11];
	storage[6][12] <= x[12];
	storage[6][13] <= x[14];
	storage[6][14] <= x[13];
	storage[6][15] <= x[15];

	flag6 <= True;
endrule: rule6

rule rule10(!flag10 && flag9);
//8 input Swap Stage
	let x = storage[9];
	storage[10][0] <= x[0];
	storage[10][1] <= x[2];
	storage[10][2] <= x[4];
	storage[10][3] <= x[6];
	storage[10][4] <= x[8];
	storage[10][5] <= x[10];
	storage[10][6] <= x[12];
	storage[10][7] <= x[14];
	storage[10][8] <= x[1];
	storage[10][9] <= x[3];
	storage[10][10] <= x[5];
	storage[10][11] <= x[7];
	storage[10][12] <= x[9];
	storage[10][13] <= x[11];
	storage[10][14] <= x[13];
	storage[10][15] <= x[15];

	flag10 <= True;
endrule: rule10

rule rule11(!flag11 && flag10);
//4 input Swap Stage
	let x = storage[10];
	storage[11][0] <= x[0];
	storage[11][1] <= x[2];
	storage[11][2] <= x[4];
	storage[11][3] <= x[6];
	storage[11][4] <= x[1];
	storage[11][5] <= x[3];
	storage[11][6] <= x[5];
	storage[11][7] <= x[7];
	storage[11][8] <= x[8];
	storage[11][9] <= x[10];
	storage[11][10] <= x[12];
	storage[11][11] <= x[14];
	storage[11][12] <= x[9];
	storage[11][13] <= x[11];
	storage[11][14] <= x[13];
	storage[11][15] <= x[15];

	flag11 <= True;
endrule: rule11

rule rule12(!flag12 && flag11);
//2 input Swap Stage
	let x = storage[11];
	storage[12][0] <= x[0];
	storage[12][1] <= x[2];
	storage[12][2] <= x[1];
	storage[12][3] <= x[3];
	storage[12][4] <= x[4];
	storage[12][5] <= x[6];
	storage[12][6] <= x[5];
	storage[12][7] <= x[7];
	storage[12][8] <= x[8];
	storage[12][9] <= x[10];
	storage[12][10] <= x[9];
	storage[12][11] <= x[11];
	storage[12][12] <= x[12];
	storage[12][13] <= x[14];
	storage[12][14] <= x[13];
	storage[12][15] <= x[15];

	flag12 <= True;
endrule: rule12

rule rule16(!flag16 && flag15);
//16 input Merge Stage
	let x = storage[15];
	storage[16][0] <= x[0];
	if(x[1] <= x[8]) begin
		storage[16][1] <= x[1];
		storage[16][2] <= x[8];
	end
	else begin
		storage[16][1] <= x[8];
		storage[16][2] <= x[1];
	end
	if(x[2] <= x[9]) begin
		storage[16][3] <= x[2];
		storage[16][4] <= x[9];
	end
	else begin
		storage[16][3] <= x[9];
		storage[16][4] <= x[2];
	end
	if(x[3] <= x[10]) begin
		storage[16][5] <= x[3];
		storage[16][6] <= x[10];
	end
	else begin
		storage[16][5] <= x[10];
		storage[16][6] <= x[3];
	end
	if(x[4] <= x[11]) begin
		storage[16][7] <= x[4];
		storage[16][8] <= x[11];
	end
	else begin
		storage[16][7] <= x[11];
		storage[16][8] <= x[4];
	end
	if(x[5] <= x[12]) begin
		storage[16][9] <= x[5];
		storage[16][10] <= x[12];
	end
	else begin
		storage[16][9] <= x[12];
		storage[16][10] <= x[5];
	end
	if(x[6] <= x[13]) begin
		storage[16][11] <= x[6];
		storage[16][12] <= x[13];
	end
	else begin
		storage[16][11] <= x[13];
		storage[16][12] <= x[6];
	end
	if(x[7] <= x[14]) begin
		storage[16][13] <= x[7];
		storage[16][14] <= x[14];
	end
	else begin
		storage[16][13] <= x[14];
		storage[16][14] <= x[7];
	end
	storage[16][15] <= x[15];

	flag16 <= True;
endrule: rule16

rule rule4(!flag4 && flag3);
//4 input Merge Stage
	let x = storage[3];
	storage[4][0] <= x[0];
	if(x[1] <= x[2]) begin
		storage[4][1] <= x[1];
		storage[4][2] <= x[2];
	end
	else begin
		storage[4][1] <= x[2];
		storage[4][2] <= x[1];
	end
	storage[4][3] <= x[3];
	storage[4][4] <= x[4];
	if(x[5] <= x[6]) begin
		storage[4][5] <= x[5];
		storage[4][6] <= x[6];
	end
	else begin
		storage[4][5] <= x[6];
		storage[4][6] <= x[5];
	end
	storage[4][7] <= x[7];
	storage[4][8] <= x[8];
	if(x[9] <= x[10]) begin
		storage[4][9] <= x[9];
		storage[4][10] <= x[10];
	end
	else begin
		storage[4][9] <= x[10];
		storage[4][10] <= x[9];
	end
	storage[4][11] <= x[11];
	storage[4][12] <= x[12];
	if(x[13] <= x[14]) begin
		storage[4][13] <= x[13];
		storage[4][14] <= x[14];
	end
	else begin
		storage[4][13] <= x[14];
		storage[4][14] <= x[13];
	end
	storage[4][15] <= x[15];

	flag4 <= True;
endrule: rule4

rule rule8(!flag8 && flag7);
//4 input Merge Stage
	let x = storage[7];
	storage[8][0] <= x[0];
	if(x[1] <= x[2]) begin
		storage[8][1] <= x[1];
		storage[8][2] <= x[2];
	end
	else begin
		storage[8][1] <= x[2];
		storage[8][2] <= x[1];
	end
	storage[8][3] <= x[3];
	storage[8][4] <= x[4];
	if(x[5] <= x[6]) begin
		storage[8][5] <= x[5];
		storage[8][6] <= x[6];
	end
	else begin
		storage[8][5] <= x[6];
		storage[8][6] <= x[5];
	end
	storage[8][7] <= x[7];
	storage[8][8] <= x[8];
	if(x[9] <= x[10]) begin
		storage[8][9] <= x[9];
		storage[8][10] <= x[10];
	end
	else begin
		storage[8][9] <= x[10];
		storage[8][10] <= x[9];
	end
	storage[8][11] <= x[11];
	storage[8][12] <= x[12];
	if(x[13] <= x[14]) begin
		storage[8][13] <= x[13];
		storage[8][14] <= x[14];
	end
	else begin
		storage[8][13] <= x[14];
		storage[8][14] <= x[13];
	end
	storage[8][15] <= x[15];

	flag8 <= True;
endrule: rule8

rule rule9(!flag9 && flag8);
//8 input Merge Stage
	let x = storage[8];
	storage[9][0] <= x[0];
	if(x[1] <= x[4]) begin
		storage[9][1] <= x[1];
		storage[9][2] <= x[4];
	end
	else begin
		storage[9][1] <= x[4];
		storage[9][2] <= x[1];
	end
	if(x[2] <= x[5]) begin
		storage[9][3] <= x[2];
		storage[9][4] <= x[5];
	end
	else begin
		storage[9][3] <= x[5];
		storage[9][4] <= x[2];
	end
	if(x[3] <= x[6]) begin
		storage[9][5] <= x[3];
		storage[9][6] <= x[6];
	end
	else begin
		storage[9][5] <= x[6];
		storage[9][6] <= x[3];
	end
	storage[9][7] <= x[7];
	storage[9][8] <= x[8];
	if(x[9] <= x[12]) begin
		storage[9][9] <= x[9];
		storage[9][10] <= x[12];
	end
	else begin
		storage[9][9] <= x[12];
		storage[9][10] <= x[9];
	end
	if(x[10] <= x[13]) begin
		storage[9][11] <= x[10];
		storage[9][12] <= x[13];
	end
	else begin
		storage[9][11] <= x[13];
		storage[9][12] <= x[10];
	end
	if(x[11] <= x[14]) begin
		storage[9][13] <= x[11];
		storage[9][14] <= x[14];
	end
	else begin
		storage[9][13] <= x[14];
		storage[9][14] <= x[11];
	end
	storage[9][15] <= x[15];

	flag9 <= True;
endrule: rule9

rule rule14(!flag14 && flag13);
//4 input Merge Stage
	let x = storage[13];
	storage[14][0] <= x[0];
	if(x[1] <= x[2]) begin
		storage[14][1] <= x[1];
		storage[14][2] <= x[2];
	end
	else begin
		storage[14][1] <= x[2];
		storage[14][2] <= x[1];
	end
	storage[14][3] <= x[3];
	storage[14][4] <= x[4];
	if(x[5] <= x[6]) begin
		storage[14][5] <= x[5];
		storage[14][6] <= x[6];
	end
	else begin
		storage[14][5] <= x[6];
		storage[14][6] <= x[5];
	end
	storage[14][7] <= x[7];
	storage[14][8] <= x[8];
	if(x[9] <= x[10]) begin
		storage[14][9] <= x[9];
		storage[14][10] <= x[10];
	end
	else begin
		storage[14][9] <= x[10];
		storage[14][10] <= x[9];
	end
	storage[14][11] <= x[11];
	storage[14][12] <= x[12];
	if(x[13] <= x[14]) begin
		storage[14][13] <= x[13];
		storage[14][14] <= x[14];
	end
	else begin
		storage[14][13] <= x[14];
		storage[14][14] <= x[13];
	end
	storage[14][15] <= x[15];

	flag14 <= True;
endrule: rule14

rule rule15(!flag15 && flag14);
//8 input Merge Stage
	let x = storage[14];
	storage[15][0] <= x[0];
	if(x[1] <= x[4]) begin
		storage[15][1] <= x[1];
		storage[15][2] <= x[4];
	end
	else begin
		storage[15][1] <= x[4];
		storage[15][2] <= x[1];
	end
	if(x[2] <= x[5]) begin
		storage[15][3] <= x[2];
		storage[15][4] <= x[5];
	end
	else begin
		storage[15][3] <= x[5];
		storage[15][4] <= x[2];
	end
	if(x[3] <= x[6]) begin
		storage[15][5] <= x[3];
		storage[15][6] <= x[6];
	end
	else begin
		storage[15][5] <= x[6];
		storage[15][6] <= x[3];
	end
	storage[15][7] <= x[7];
	storage[15][8] <= x[8];
	if(x[9] <= x[12]) begin
		storage[15][9] <= x[9];
		storage[15][10] <= x[12];
	end
	else begin
		storage[15][9] <= x[12];
		storage[15][10] <= x[9];
	end
	if(x[10] <= x[13]) begin
		storage[15][11] <= x[10];
		storage[15][12] <= x[13];
	end
	else begin
		storage[15][11] <= x[13];
		storage[15][12] <= x[10];
	end
	if(x[11] <= x[14]) begin
		storage[15][13] <= x[11];
		storage[15][14] <= x[14];
	end
	else begin
		storage[15][13] <= x[14];
		storage[15][14] <= x[11];
	end
	storage[15][15] <= x[15];

	flag15 <= True;
endrule: rule15


// debugging rule

rule rulefinish(flag16 && !finishFlag);
	for(Integer i=0; i<16; i=i+1) begin
		$display("Input -- %d :::: Output -- ",storage[0][i] ,storage[16][i]);
	end
	finishFlag <= True;
endrule

endmodule: mkMergeSort
endpackage: MergeSort
