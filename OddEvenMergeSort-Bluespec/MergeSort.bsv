package MergeSort;
	import Vector::*;
	(* synthesize *)
	
module mkMergeSort(Empty);
	Vector#(32, Reg#(Bit#(8))) storage[26];
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
	Reg#(Bool) flag17 <- mkReg(False);
	Reg#(Bool) flag18 <- mkReg(False);
	Reg#(Bool) flag19 <- mkReg(False);
	Reg#(Bool) flag20 <- mkReg(False);
	Reg#(Bool) flag21 <- mkReg(False);
	Reg#(Bool) flag22 <- mkReg(False);
	Reg#(Bool) flag23 <- mkReg(False);
	Reg#(Bool) flag24 <- mkReg(False);
	Reg#(Bool) flag25 <- mkReg(False);
	Reg#(Bool) finishFlag <- mkReg(False);

	storage[0][0] <- mkReg(182);
	storage[0][1] <- mkReg(132);
	storage[0][2] <- mkReg(41);
	storage[0][3] <- mkReg(138);
	storage[0][4] <- mkReg(147);
	storage[0][5] <- mkReg(151);
	storage[0][6] <- mkReg(195);
	storage[0][7] <- mkReg(149);
	storage[0][8] <- mkReg(107);
	storage[0][9] <- mkReg(104);
	storage[0][10] <- mkReg(92);
	storage[0][11] <- mkReg(174);
	storage[0][12] <- mkReg(126);
	storage[0][13] <- mkReg(145);
	storage[0][14] <- mkReg(137);
	storage[0][15] <- mkReg(175);
	storage[0][16] <- mkReg(191);
	storage[0][17] <- mkReg(129);
	storage[0][18] <- mkReg(135);
	storage[0][19] <- mkReg(224);
	storage[0][20] <- mkReg(53);
	storage[0][21] <- mkReg(151);
	storage[0][22] <- mkReg(229);
	storage[0][23] <- mkReg(161);
	storage[0][24] <- mkReg(87);
	storage[0][25] <- mkReg(87);
	storage[0][26] <- mkReg(29);
	storage[0][27] <- mkReg(215);
	storage[0][28] <- mkReg(42);
	storage[0][29] <- mkReg(57);
	storage[0][30] <- mkReg(216);
	storage[0][31] <- mkReg(99);
	for(Integer i=1; i<26; i=i+1) begin
		storage[i] <- replicateM(mkReg(0));
	end

rule rule1(!flag1);
// 2 input Sort Stage
	let x = storage[0];
	for(Integer i=0; i<16; i=i+1) begin
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
	for(Integer i=0; i<16; i=i+1) begin
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
	for(Integer i=0; i<16; i=i+1) begin
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
	for(Integer i=0; i<16; i=i+1) begin
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

rule rule21(!flag21 && flag20);
// 2 input Sort Stage
	let x = storage[20];
	for(Integer i=0; i<16; i=i+1) begin
		if(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin
		storage[21][2*fromInteger(i)] <= x[2*fromInteger(i)];
		storage[21][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];
	end
	else begin
		storage[21][2*fromInteger(i)] <= x[2*fromInteger(i)+1];
		storage[21][2*fromInteger(i)+1] <= x[2*fromInteger(i)];
		end
	end

	flag21 <= True;
endrule: rule21

rule rule17(!flag17 && flag16);
//16 input Swap Stage
	let x = storage[16];
	storage[17][0] <= x[0];
	storage[17][1] <= x[2];
	storage[17][2] <= x[4];
	storage[17][3] <= x[6];
	storage[17][4] <= x[8];
	storage[17][5] <= x[10];
	storage[17][6] <= x[12];
	storage[17][7] <= x[14];
	storage[17][8] <= x[16];
	storage[17][9] <= x[18];
	storage[17][10] <= x[20];
	storage[17][11] <= x[22];
	storage[17][12] <= x[24];
	storage[17][13] <= x[26];
	storage[17][14] <= x[28];
	storage[17][15] <= x[30];
	storage[17][16] <= x[1];
	storage[17][17] <= x[3];
	storage[17][18] <= x[5];
	storage[17][19] <= x[7];
	storage[17][20] <= x[9];
	storage[17][21] <= x[11];
	storage[17][22] <= x[13];
	storage[17][23] <= x[15];
	storage[17][24] <= x[17];
	storage[17][25] <= x[19];
	storage[17][26] <= x[21];
	storage[17][27] <= x[23];
	storage[17][28] <= x[25];
	storage[17][29] <= x[27];
	storage[17][30] <= x[29];
	storage[17][31] <= x[31];

	flag17 <= True;
endrule: rule17

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
	storage[2][16] <= x[16];
	storage[2][17] <= x[18];
	storage[2][18] <= x[17];
	storage[2][19] <= x[19];
	storage[2][20] <= x[20];
	storage[2][21] <= x[22];
	storage[2][22] <= x[21];
	storage[2][23] <= x[23];
	storage[2][24] <= x[24];
	storage[2][25] <= x[26];
	storage[2][26] <= x[25];
	storage[2][27] <= x[27];
	storage[2][28] <= x[28];
	storage[2][29] <= x[30];
	storage[2][30] <= x[29];
	storage[2][31] <= x[31];

	flag2 <= True;
endrule: rule2

rule rule19(!flag19 && flag18);
//4 input Swap Stage
	let x = storage[18];
	storage[19][0] <= x[0];
	storage[19][1] <= x[2];
	storage[19][2] <= x[4];
	storage[19][3] <= x[6];
	storage[19][4] <= x[1];
	storage[19][5] <= x[3];
	storage[19][6] <= x[5];
	storage[19][7] <= x[7];
	storage[19][8] <= x[8];
	storage[19][9] <= x[10];
	storage[19][10] <= x[12];
	storage[19][11] <= x[14];
	storage[19][12] <= x[9];
	storage[19][13] <= x[11];
	storage[19][14] <= x[13];
	storage[19][15] <= x[15];
	storage[19][16] <= x[16];
	storage[19][17] <= x[18];
	storage[19][18] <= x[20];
	storage[19][19] <= x[22];
	storage[19][20] <= x[17];
	storage[19][21] <= x[19];
	storage[19][22] <= x[21];
	storage[19][23] <= x[23];
	storage[19][24] <= x[24];
	storage[19][25] <= x[26];
	storage[19][26] <= x[28];
	storage[19][27] <= x[30];
	storage[19][28] <= x[25];
	storage[19][29] <= x[27];
	storage[19][30] <= x[29];
	storage[19][31] <= x[31];

	flag19 <= True;
endrule: rule19

rule rule20(!flag20 && flag19);
//2 input Swap Stage
	let x = storage[19];
	storage[20][0] <= x[0];
	storage[20][1] <= x[2];
	storage[20][2] <= x[1];
	storage[20][3] <= x[3];
	storage[20][4] <= x[4];
	storage[20][5] <= x[6];
	storage[20][6] <= x[5];
	storage[20][7] <= x[7];
	storage[20][8] <= x[8];
	storage[20][9] <= x[10];
	storage[20][10] <= x[9];
	storage[20][11] <= x[11];
	storage[20][12] <= x[12];
	storage[20][13] <= x[14];
	storage[20][14] <= x[13];
	storage[20][15] <= x[15];
	storage[20][16] <= x[16];
	storage[20][17] <= x[18];
	storage[20][18] <= x[17];
	storage[20][19] <= x[19];
	storage[20][20] <= x[20];
	storage[20][21] <= x[22];
	storage[20][22] <= x[21];
	storage[20][23] <= x[23];
	storage[20][24] <= x[24];
	storage[20][25] <= x[26];
	storage[20][26] <= x[25];
	storage[20][27] <= x[27];
	storage[20][28] <= x[28];
	storage[20][29] <= x[30];
	storage[20][30] <= x[29];
	storage[20][31] <= x[31];

	flag20 <= True;
endrule: rule20

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
	storage[5][16] <= x[16];
	storage[5][17] <= x[18];
	storage[5][18] <= x[20];
	storage[5][19] <= x[22];
	storage[5][20] <= x[17];
	storage[5][21] <= x[19];
	storage[5][22] <= x[21];
	storage[5][23] <= x[23];
	storage[5][24] <= x[24];
	storage[5][25] <= x[26];
	storage[5][26] <= x[28];
	storage[5][27] <= x[30];
	storage[5][28] <= x[25];
	storage[5][29] <= x[27];
	storage[5][30] <= x[29];
	storage[5][31] <= x[31];

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
	storage[6][16] <= x[16];
	storage[6][17] <= x[18];
	storage[6][18] <= x[17];
	storage[6][19] <= x[19];
	storage[6][20] <= x[20];
	storage[6][21] <= x[22];
	storage[6][22] <= x[21];
	storage[6][23] <= x[23];
	storage[6][24] <= x[24];
	storage[6][25] <= x[26];
	storage[6][26] <= x[25];
	storage[6][27] <= x[27];
	storage[6][28] <= x[28];
	storage[6][29] <= x[30];
	storage[6][30] <= x[29];
	storage[6][31] <= x[31];

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
	storage[10][16] <= x[16];
	storage[10][17] <= x[18];
	storage[10][18] <= x[20];
	storage[10][19] <= x[22];
	storage[10][20] <= x[24];
	storage[10][21] <= x[26];
	storage[10][22] <= x[28];
	storage[10][23] <= x[30];
	storage[10][24] <= x[17];
	storage[10][25] <= x[19];
	storage[10][26] <= x[21];
	storage[10][27] <= x[23];
	storage[10][28] <= x[25];
	storage[10][29] <= x[27];
	storage[10][30] <= x[29];
	storage[10][31] <= x[31];

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
	storage[11][16] <= x[16];
	storage[11][17] <= x[18];
	storage[11][18] <= x[20];
	storage[11][19] <= x[22];
	storage[11][20] <= x[17];
	storage[11][21] <= x[19];
	storage[11][22] <= x[21];
	storage[11][23] <= x[23];
	storage[11][24] <= x[24];
	storage[11][25] <= x[26];
	storage[11][26] <= x[28];
	storage[11][27] <= x[30];
	storage[11][28] <= x[25];
	storage[11][29] <= x[27];
	storage[11][30] <= x[29];
	storage[11][31] <= x[31];

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
	storage[12][16] <= x[16];
	storage[12][17] <= x[18];
	storage[12][18] <= x[17];
	storage[12][19] <= x[19];
	storage[12][20] <= x[20];
	storage[12][21] <= x[22];
	storage[12][22] <= x[21];
	storage[12][23] <= x[23];
	storage[12][24] <= x[24];
	storage[12][25] <= x[26];
	storage[12][26] <= x[25];
	storage[12][27] <= x[27];
	storage[12][28] <= x[28];
	storage[12][29] <= x[30];
	storage[12][30] <= x[29];
	storage[12][31] <= x[31];

	flag12 <= True;
endrule: rule12

rule rule18(!flag18 && flag17);
//8 input Swap Stage
	let x = storage[17];
	storage[18][0] <= x[0];
	storage[18][1] <= x[2];
	storage[18][2] <= x[4];
	storage[18][3] <= x[6];
	storage[18][4] <= x[8];
	storage[18][5] <= x[10];
	storage[18][6] <= x[12];
	storage[18][7] <= x[14];
	storage[18][8] <= x[1];
	storage[18][9] <= x[3];
	storage[18][10] <= x[5];
	storage[18][11] <= x[7];
	storage[18][12] <= x[9];
	storage[18][13] <= x[11];
	storage[18][14] <= x[13];
	storage[18][15] <= x[15];
	storage[18][16] <= x[16];
	storage[18][17] <= x[18];
	storage[18][18] <= x[20];
	storage[18][19] <= x[22];
	storage[18][20] <= x[24];
	storage[18][21] <= x[26];
	storage[18][22] <= x[28];
	storage[18][23] <= x[30];
	storage[18][24] <= x[17];
	storage[18][25] <= x[19];
	storage[18][26] <= x[21];
	storage[18][27] <= x[23];
	storage[18][28] <= x[25];
	storage[18][29] <= x[27];
	storage[18][30] <= x[29];
	storage[18][31] <= x[31];

	flag18 <= True;
endrule: rule18

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
	storage[16][16] <= x[16];
	if(x[17] <= x[24]) begin
		storage[16][17] <= x[17];
		storage[16][18] <= x[24];
	end
	else begin
		storage[16][17] <= x[24];
		storage[16][18] <= x[17];
	end
	if(x[18] <= x[25]) begin
		storage[16][19] <= x[18];
		storage[16][20] <= x[25];
	end
	else begin
		storage[16][19] <= x[25];
		storage[16][20] <= x[18];
	end
	if(x[19] <= x[26]) begin
		storage[16][21] <= x[19];
		storage[16][22] <= x[26];
	end
	else begin
		storage[16][21] <= x[26];
		storage[16][22] <= x[19];
	end
	if(x[20] <= x[27]) begin
		storage[16][23] <= x[20];
		storage[16][24] <= x[27];
	end
	else begin
		storage[16][23] <= x[27];
		storage[16][24] <= x[20];
	end
	if(x[21] <= x[28]) begin
		storage[16][25] <= x[21];
		storage[16][26] <= x[28];
	end
	else begin
		storage[16][25] <= x[28];
		storage[16][26] <= x[21];
	end
	if(x[22] <= x[29]) begin
		storage[16][27] <= x[22];
		storage[16][28] <= x[29];
	end
	else begin
		storage[16][27] <= x[29];
		storage[16][28] <= x[22];
	end
	if(x[23] <= x[30]) begin
		storage[16][29] <= x[23];
		storage[16][30] <= x[30];
	end
	else begin
		storage[16][29] <= x[30];
		storage[16][30] <= x[23];
	end
	storage[16][31] <= x[31];

	flag16 <= True;
endrule: rule16

rule rule24(!flag24 && flag23);
//16 input Merge Stage
	let x = storage[23];
	storage[24][0] <= x[0];
	if(x[1] <= x[8]) begin
		storage[24][1] <= x[1];
		storage[24][2] <= x[8];
	end
	else begin
		storage[24][1] <= x[8];
		storage[24][2] <= x[1];
	end
	if(x[2] <= x[9]) begin
		storage[24][3] <= x[2];
		storage[24][4] <= x[9];
	end
	else begin
		storage[24][3] <= x[9];
		storage[24][4] <= x[2];
	end
	if(x[3] <= x[10]) begin
		storage[24][5] <= x[3];
		storage[24][6] <= x[10];
	end
	else begin
		storage[24][5] <= x[10];
		storage[24][6] <= x[3];
	end
	if(x[4] <= x[11]) begin
		storage[24][7] <= x[4];
		storage[24][8] <= x[11];
	end
	else begin
		storage[24][7] <= x[11];
		storage[24][8] <= x[4];
	end
	if(x[5] <= x[12]) begin
		storage[24][9] <= x[5];
		storage[24][10] <= x[12];
	end
	else begin
		storage[24][9] <= x[12];
		storage[24][10] <= x[5];
	end
	if(x[6] <= x[13]) begin
		storage[24][11] <= x[6];
		storage[24][12] <= x[13];
	end
	else begin
		storage[24][11] <= x[13];
		storage[24][12] <= x[6];
	end
	if(x[7] <= x[14]) begin
		storage[24][13] <= x[7];
		storage[24][14] <= x[14];
	end
	else begin
		storage[24][13] <= x[14];
		storage[24][14] <= x[7];
	end
	storage[24][15] <= x[15];
	storage[24][16] <= x[16];
	if(x[17] <= x[24]) begin
		storage[24][17] <= x[17];
		storage[24][18] <= x[24];
	end
	else begin
		storage[24][17] <= x[24];
		storage[24][18] <= x[17];
	end
	if(x[18] <= x[25]) begin
		storage[24][19] <= x[18];
		storage[24][20] <= x[25];
	end
	else begin
		storage[24][19] <= x[25];
		storage[24][20] <= x[18];
	end
	if(x[19] <= x[26]) begin
		storage[24][21] <= x[19];
		storage[24][22] <= x[26];
	end
	else begin
		storage[24][21] <= x[26];
		storage[24][22] <= x[19];
	end
	if(x[20] <= x[27]) begin
		storage[24][23] <= x[20];
		storage[24][24] <= x[27];
	end
	else begin
		storage[24][23] <= x[27];
		storage[24][24] <= x[20];
	end
	if(x[21] <= x[28]) begin
		storage[24][25] <= x[21];
		storage[24][26] <= x[28];
	end
	else begin
		storage[24][25] <= x[28];
		storage[24][26] <= x[21];
	end
	if(x[22] <= x[29]) begin
		storage[24][27] <= x[22];
		storage[24][28] <= x[29];
	end
	else begin
		storage[24][27] <= x[29];
		storage[24][28] <= x[22];
	end
	if(x[23] <= x[30]) begin
		storage[24][29] <= x[23];
		storage[24][30] <= x[30];
	end
	else begin
		storage[24][29] <= x[30];
		storage[24][30] <= x[23];
	end
	storage[24][31] <= x[31];

	flag24 <= True;
endrule: rule24

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
	storage[4][16] <= x[16];
	if(x[17] <= x[18]) begin
		storage[4][17] <= x[17];
		storage[4][18] <= x[18];
	end
	else begin
		storage[4][17] <= x[18];
		storage[4][18] <= x[17];
	end
	storage[4][19] <= x[19];
	storage[4][20] <= x[20];
	if(x[21] <= x[22]) begin
		storage[4][21] <= x[21];
		storage[4][22] <= x[22];
	end
	else begin
		storage[4][21] <= x[22];
		storage[4][22] <= x[21];
	end
	storage[4][23] <= x[23];
	storage[4][24] <= x[24];
	if(x[25] <= x[26]) begin
		storage[4][25] <= x[25];
		storage[4][26] <= x[26];
	end
	else begin
		storage[4][25] <= x[26];
		storage[4][26] <= x[25];
	end
	storage[4][27] <= x[27];
	storage[4][28] <= x[28];
	if(x[29] <= x[30]) begin
		storage[4][29] <= x[29];
		storage[4][30] <= x[30];
	end
	else begin
		storage[4][29] <= x[30];
		storage[4][30] <= x[29];
	end
	storage[4][31] <= x[31];

	flag4 <= True;
endrule: rule4

rule rule22(!flag22 && flag21);
//4 input Merge Stage
	let x = storage[21];
	storage[22][0] <= x[0];
	if(x[1] <= x[2]) begin
		storage[22][1] <= x[1];
		storage[22][2] <= x[2];
	end
	else begin
		storage[22][1] <= x[2];
		storage[22][2] <= x[1];
	end
	storage[22][3] <= x[3];
	storage[22][4] <= x[4];
	if(x[5] <= x[6]) begin
		storage[22][5] <= x[5];
		storage[22][6] <= x[6];
	end
	else begin
		storage[22][5] <= x[6];
		storage[22][6] <= x[5];
	end
	storage[22][7] <= x[7];
	storage[22][8] <= x[8];
	if(x[9] <= x[10]) begin
		storage[22][9] <= x[9];
		storage[22][10] <= x[10];
	end
	else begin
		storage[22][9] <= x[10];
		storage[22][10] <= x[9];
	end
	storage[22][11] <= x[11];
	storage[22][12] <= x[12];
	if(x[13] <= x[14]) begin
		storage[22][13] <= x[13];
		storage[22][14] <= x[14];
	end
	else begin
		storage[22][13] <= x[14];
		storage[22][14] <= x[13];
	end
	storage[22][15] <= x[15];
	storage[22][16] <= x[16];
	if(x[17] <= x[18]) begin
		storage[22][17] <= x[17];
		storage[22][18] <= x[18];
	end
	else begin
		storage[22][17] <= x[18];
		storage[22][18] <= x[17];
	end
	storage[22][19] <= x[19];
	storage[22][20] <= x[20];
	if(x[21] <= x[22]) begin
		storage[22][21] <= x[21];
		storage[22][22] <= x[22];
	end
	else begin
		storage[22][21] <= x[22];
		storage[22][22] <= x[21];
	end
	storage[22][23] <= x[23];
	storage[22][24] <= x[24];
	if(x[25] <= x[26]) begin
		storage[22][25] <= x[25];
		storage[22][26] <= x[26];
	end
	else begin
		storage[22][25] <= x[26];
		storage[22][26] <= x[25];
	end
	storage[22][27] <= x[27];
	storage[22][28] <= x[28];
	if(x[29] <= x[30]) begin
		storage[22][29] <= x[29];
		storage[22][30] <= x[30];
	end
	else begin
		storage[22][29] <= x[30];
		storage[22][30] <= x[29];
	end
	storage[22][31] <= x[31];

	flag22 <= True;
endrule: rule22

rule rule25(!flag25 && flag24);
//32 input Merge Stage
	let x = storage[24];
	storage[25][0] <= x[0];
	if(x[1] <= x[16]) begin
		storage[25][1] <= x[1];
		storage[25][2] <= x[16];
	end
	else begin
		storage[25][1] <= x[16];
		storage[25][2] <= x[1];
	end
	if(x[2] <= x[17]) begin
		storage[25][3] <= x[2];
		storage[25][4] <= x[17];
	end
	else begin
		storage[25][3] <= x[17];
		storage[25][4] <= x[2];
	end
	if(x[3] <= x[18]) begin
		storage[25][5] <= x[3];
		storage[25][6] <= x[18];
	end
	else begin
		storage[25][5] <= x[18];
		storage[25][6] <= x[3];
	end
	if(x[4] <= x[19]) begin
		storage[25][7] <= x[4];
		storage[25][8] <= x[19];
	end
	else begin
		storage[25][7] <= x[19];
		storage[25][8] <= x[4];
	end
	if(x[5] <= x[20]) begin
		storage[25][9] <= x[5];
		storage[25][10] <= x[20];
	end
	else begin
		storage[25][9] <= x[20];
		storage[25][10] <= x[5];
	end
	if(x[6] <= x[21]) begin
		storage[25][11] <= x[6];
		storage[25][12] <= x[21];
	end
	else begin
		storage[25][11] <= x[21];
		storage[25][12] <= x[6];
	end
	if(x[7] <= x[22]) begin
		storage[25][13] <= x[7];
		storage[25][14] <= x[22];
	end
	else begin
		storage[25][13] <= x[22];
		storage[25][14] <= x[7];
	end
	if(x[8] <= x[23]) begin
		storage[25][15] <= x[8];
		storage[25][16] <= x[23];
	end
	else begin
		storage[25][15] <= x[23];
		storage[25][16] <= x[8];
	end
	if(x[9] <= x[24]) begin
		storage[25][17] <= x[9];
		storage[25][18] <= x[24];
	end
	else begin
		storage[25][17] <= x[24];
		storage[25][18] <= x[9];
	end
	if(x[10] <= x[25]) begin
		storage[25][19] <= x[10];
		storage[25][20] <= x[25];
	end
	else begin
		storage[25][19] <= x[25];
		storage[25][20] <= x[10];
	end
	if(x[11] <= x[26]) begin
		storage[25][21] <= x[11];
		storage[25][22] <= x[26];
	end
	else begin
		storage[25][21] <= x[26];
		storage[25][22] <= x[11];
	end
	if(x[12] <= x[27]) begin
		storage[25][23] <= x[12];
		storage[25][24] <= x[27];
	end
	else begin
		storage[25][23] <= x[27];
		storage[25][24] <= x[12];
	end
	if(x[13] <= x[28]) begin
		storage[25][25] <= x[13];
		storage[25][26] <= x[28];
	end
	else begin
		storage[25][25] <= x[28];
		storage[25][26] <= x[13];
	end
	if(x[14] <= x[29]) begin
		storage[25][27] <= x[14];
		storage[25][28] <= x[29];
	end
	else begin
		storage[25][27] <= x[29];
		storage[25][28] <= x[14];
	end
	if(x[15] <= x[30]) begin
		storage[25][29] <= x[15];
		storage[25][30] <= x[30];
	end
	else begin
		storage[25][29] <= x[30];
		storage[25][30] <= x[15];
	end
	storage[25][31] <= x[31];

	flag25 <= True;
endrule: rule25

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
	storage[8][16] <= x[16];
	if(x[17] <= x[18]) begin
		storage[8][17] <= x[17];
		storage[8][18] <= x[18];
	end
	else begin
		storage[8][17] <= x[18];
		storage[8][18] <= x[17];
	end
	storage[8][19] <= x[19];
	storage[8][20] <= x[20];
	if(x[21] <= x[22]) begin
		storage[8][21] <= x[21];
		storage[8][22] <= x[22];
	end
	else begin
		storage[8][21] <= x[22];
		storage[8][22] <= x[21];
	end
	storage[8][23] <= x[23];
	storage[8][24] <= x[24];
	if(x[25] <= x[26]) begin
		storage[8][25] <= x[25];
		storage[8][26] <= x[26];
	end
	else begin
		storage[8][25] <= x[26];
		storage[8][26] <= x[25];
	end
	storage[8][27] <= x[27];
	storage[8][28] <= x[28];
	if(x[29] <= x[30]) begin
		storage[8][29] <= x[29];
		storage[8][30] <= x[30];
	end
	else begin
		storage[8][29] <= x[30];
		storage[8][30] <= x[29];
	end
	storage[8][31] <= x[31];

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
	storage[9][16] <= x[16];
	if(x[17] <= x[20]) begin
		storage[9][17] <= x[17];
		storage[9][18] <= x[20];
	end
	else begin
		storage[9][17] <= x[20];
		storage[9][18] <= x[17];
	end
	if(x[18] <= x[21]) begin
		storage[9][19] <= x[18];
		storage[9][20] <= x[21];
	end
	else begin
		storage[9][19] <= x[21];
		storage[9][20] <= x[18];
	end
	if(x[19] <= x[22]) begin
		storage[9][21] <= x[19];
		storage[9][22] <= x[22];
	end
	else begin
		storage[9][21] <= x[22];
		storage[9][22] <= x[19];
	end
	storage[9][23] <= x[23];
	storage[9][24] <= x[24];
	if(x[25] <= x[28]) begin
		storage[9][25] <= x[25];
		storage[9][26] <= x[28];
	end
	else begin
		storage[9][25] <= x[28];
		storage[9][26] <= x[25];
	end
	if(x[26] <= x[29]) begin
		storage[9][27] <= x[26];
		storage[9][28] <= x[29];
	end
	else begin
		storage[9][27] <= x[29];
		storage[9][28] <= x[26];
	end
	if(x[27] <= x[30]) begin
		storage[9][29] <= x[27];
		storage[9][30] <= x[30];
	end
	else begin
		storage[9][29] <= x[30];
		storage[9][30] <= x[27];
	end
	storage[9][31] <= x[31];

	flag9 <= True;
endrule: rule9

rule rule23(!flag23 && flag22);
//8 input Merge Stage
	let x = storage[22];
	storage[23][0] <= x[0];
	if(x[1] <= x[4]) begin
		storage[23][1] <= x[1];
		storage[23][2] <= x[4];
	end
	else begin
		storage[23][1] <= x[4];
		storage[23][2] <= x[1];
	end
	if(x[2] <= x[5]) begin
		storage[23][3] <= x[2];
		storage[23][4] <= x[5];
	end
	else begin
		storage[23][3] <= x[5];
		storage[23][4] <= x[2];
	end
	if(x[3] <= x[6]) begin
		storage[23][5] <= x[3];
		storage[23][6] <= x[6];
	end
	else begin
		storage[23][5] <= x[6];
		storage[23][6] <= x[3];
	end
	storage[23][7] <= x[7];
	storage[23][8] <= x[8];
	if(x[9] <= x[12]) begin
		storage[23][9] <= x[9];
		storage[23][10] <= x[12];
	end
	else begin
		storage[23][9] <= x[12];
		storage[23][10] <= x[9];
	end
	if(x[10] <= x[13]) begin
		storage[23][11] <= x[10];
		storage[23][12] <= x[13];
	end
	else begin
		storage[23][11] <= x[13];
		storage[23][12] <= x[10];
	end
	if(x[11] <= x[14]) begin
		storage[23][13] <= x[11];
		storage[23][14] <= x[14];
	end
	else begin
		storage[23][13] <= x[14];
		storage[23][14] <= x[11];
	end
	storage[23][15] <= x[15];
	storage[23][16] <= x[16];
	if(x[17] <= x[20]) begin
		storage[23][17] <= x[17];
		storage[23][18] <= x[20];
	end
	else begin
		storage[23][17] <= x[20];
		storage[23][18] <= x[17];
	end
	if(x[18] <= x[21]) begin
		storage[23][19] <= x[18];
		storage[23][20] <= x[21];
	end
	else begin
		storage[23][19] <= x[21];
		storage[23][20] <= x[18];
	end
	if(x[19] <= x[22]) begin
		storage[23][21] <= x[19];
		storage[23][22] <= x[22];
	end
	else begin
		storage[23][21] <= x[22];
		storage[23][22] <= x[19];
	end
	storage[23][23] <= x[23];
	storage[23][24] <= x[24];
	if(x[25] <= x[28]) begin
		storage[23][25] <= x[25];
		storage[23][26] <= x[28];
	end
	else begin
		storage[23][25] <= x[28];
		storage[23][26] <= x[25];
	end
	if(x[26] <= x[29]) begin
		storage[23][27] <= x[26];
		storage[23][28] <= x[29];
	end
	else begin
		storage[23][27] <= x[29];
		storage[23][28] <= x[26];
	end
	if(x[27] <= x[30]) begin
		storage[23][29] <= x[27];
		storage[23][30] <= x[30];
	end
	else begin
		storage[23][29] <= x[30];
		storage[23][30] <= x[27];
	end
	storage[23][31] <= x[31];

	flag23 <= True;
endrule: rule23

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
	storage[14][16] <= x[16];
	if(x[17] <= x[18]) begin
		storage[14][17] <= x[17];
		storage[14][18] <= x[18];
	end
	else begin
		storage[14][17] <= x[18];
		storage[14][18] <= x[17];
	end
	storage[14][19] <= x[19];
	storage[14][20] <= x[20];
	if(x[21] <= x[22]) begin
		storage[14][21] <= x[21];
		storage[14][22] <= x[22];
	end
	else begin
		storage[14][21] <= x[22];
		storage[14][22] <= x[21];
	end
	storage[14][23] <= x[23];
	storage[14][24] <= x[24];
	if(x[25] <= x[26]) begin
		storage[14][25] <= x[25];
		storage[14][26] <= x[26];
	end
	else begin
		storage[14][25] <= x[26];
		storage[14][26] <= x[25];
	end
	storage[14][27] <= x[27];
	storage[14][28] <= x[28];
	if(x[29] <= x[30]) begin
		storage[14][29] <= x[29];
		storage[14][30] <= x[30];
	end
	else begin
		storage[14][29] <= x[30];
		storage[14][30] <= x[29];
	end
	storage[14][31] <= x[31];

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
	storage[15][16] <= x[16];
	if(x[17] <= x[20]) begin
		storage[15][17] <= x[17];
		storage[15][18] <= x[20];
	end
	else begin
		storage[15][17] <= x[20];
		storage[15][18] <= x[17];
	end
	if(x[18] <= x[21]) begin
		storage[15][19] <= x[18];
		storage[15][20] <= x[21];
	end
	else begin
		storage[15][19] <= x[21];
		storage[15][20] <= x[18];
	end
	if(x[19] <= x[22]) begin
		storage[15][21] <= x[19];
		storage[15][22] <= x[22];
	end
	else begin
		storage[15][21] <= x[22];
		storage[15][22] <= x[19];
	end
	storage[15][23] <= x[23];
	storage[15][24] <= x[24];
	if(x[25] <= x[28]) begin
		storage[15][25] <= x[25];
		storage[15][26] <= x[28];
	end
	else begin
		storage[15][25] <= x[28];
		storage[15][26] <= x[25];
	end
	if(x[26] <= x[29]) begin
		storage[15][27] <= x[26];
		storage[15][28] <= x[29];
	end
	else begin
		storage[15][27] <= x[29];
		storage[15][28] <= x[26];
	end
	if(x[27] <= x[30]) begin
		storage[15][29] <= x[27];
		storage[15][30] <= x[30];
	end
	else begin
		storage[15][29] <= x[30];
		storage[15][30] <= x[27];
	end
	storage[15][31] <= x[31];

	flag15 <= True;
endrule: rule15


// debugging rule

rule rulefinish(flag25 && !finishFlag);
	for(Integer i=0; i<32; i=i+1) begin
		$display("Input -- %d :::: Output -- ",storage[0][i] ,storage[25][i]);
	end
	finishFlag <= True;
endrule

endmodule: mkMergeSort
endpackage: MergeSort
