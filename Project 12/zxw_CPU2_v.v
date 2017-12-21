module zxw_CPU2_v (Resetn_pin, Clock_pin, SW_pin, PB_pin,
	DHR_pin, DLR_pin);

	input 		 Resetn_pin, Clock_pin;
	input[3:0] 	 SW_pin, PB_pin;
	output [3:0] DHR_pin,DLR_pin;
	
	parameter [1:0] MC0=2'b00, MC1=2'b01, MC2=2'b10, MC3=2'b11;
	parameter [3:0] ADD_IC=4'b0000, SUB_IC=4'b0001, INC_IC=4'b0010, DEC_IC=4'b0011, 
		NOT_IC=4'b0100, AND_IC=4'b0101, OR_IC=4'b0110, SHR_IC=4'b0111, 
		JMPU_IC =4'b1000, JMPC_IC=4'b1001, SWAP_IC=4'b1010, CPY_IC=4'b1011, 
		WR_IC=4'b1100, RD_IC=4'b1101, PUSH_IC=4'b1110, POP_IC=4'b1111;
	
	reg 	WR_DM;
	reg[1:0] MC;
	reg[3:0] IR, TA, MAH, MAL, B, DM_in, DHR, DLR;
	reg[7:0] PC, MAeff;
	reg[4:0] ALUout;
	reg[4:0] STACK;
	wire [7:0] MA;
	wire [3:0] PM_out, DM_out,A;
	wire    C, Clock_not;
	wire [3:0] outpu;
	reg [3:0] Temp1; 
	reg [15:0] Temp2; 
	assign	A	=ALUout[3:0] ; // already change this code
		// I need to put ALUout here A=ALUout[3:0]									
	assign Clock_not = ~Clock_pin;
	assign MA[7:4] = MAH;
	assign MA[3:0] = MAL;
	assign C			=ALUout[4];
	
	assign DHR_pin =DHR;
	assign DLR_pin =DLR;
	
	zxw_rom_v	my_rom	(PC, Clock_not, PM_out);
	zxw_ram_v	my_ram	(MAeff, Clock_not, DM_in,
										WR_DM, DM_out);

	always@(posedge Clock_pin)
		
				if (Resetn_pin == 0)
					begin	
					PC = 8'b00000000;
					ALUout = 5'b00000;
					MC = MC0;
				
					end
				else	begin
					case (MC)
						MC0:
							begin
								IR = PM_out;
								PC = PC + 1'b1;
								MC = MC1;
								WR_DM = 1'b0;
							end
						MC1: begin
							case (IR)
								ADD_IC:
									begin
										ALUout = {1'b0, A} + {1'b0, B};
										MC = MC0;
									end
										
								SUB_IC:

									begin
										ALUout = {1'b0, A} + (~B) + 1'b1;
										MC = MC0;
									end
								INC_IC:
//----------------------------------------------------------------------------
// For all assignments that target A we use ALUout.  This is 5-bits wide to
// 	account for the value of the carry when necessary.
//----------------------------------------------------------------------------
									begin
										ALUout = {1'b0, A} + 1'b1;
										MC = MC0;
									end
								DEC_IC:
//----------------------------------------------------------------------------
// We use the explicit 2's-C of 1. for decrement.
//----------------------------------------------------------------------------
									begin
										ALUout = {1'b0, A} + 4'b1111;
										MC = MC0;
									end
								NOT_IC:
									begin
										ALUout[3:0] = ~A;
										MC = MC0;
									end
						
								AND_IC:
									begin
										ALUout[3:0] = A & B;
										MC = MC0;
									end
								OR_IC:
									begin
										ALUout[3:0] = A | B;
										MC = MC0;
									end	
									
									
								SHR_IC:
									begin
										ALUout[3] = A[3];
										ALUout[2] = A[3];
										ALUout[1] = A[2];
										ALUout[0] = A[1];
										ALUout[4] = A[0];
										MC = MC0;
									end
								
								SWAP_IC:
									begin
										Temp1= A;
										ALUout[3:0] = B;  //in another words A=B
										B = Temp1;
										MC = MC0;
									end
								CPY_IC:
									begin
										B =A;
										MC= MC0;
									end
								PUSH_IC:
									begin
										Temp2[11] =Temp2[15];
										Temp2[10] =Temp2[14];
										Temp2[9]	 =Temp2[13];
										Temp2[8]	 =Temp2[12];
										Temp2[7]  =Temp2[11];
										Temp2[6]  =Temp2[10];
										Temp2[5]	 =Temp2[9];
										Temp2[4]	 =Temp2[8];
										Temp2[3]  =Temp2[7];
										Temp2[2]  =Temp2[6];
										Temp2[1]	 =Temp2[5];
										Temp2[0]	 =Temp2[4];
										Temp2[15] =A[3];
										Temp2[14] =A[2];
										Temp2[13] =A[1];
										Temp2[12] =A[0];
										
										MC= MC0;

									end
								POP_IC:
									begin
										ALUout[3]  = Temp2[15];
										ALUout[2]  = Temp2[14];
										ALUout[1]  = Temp2[13];
										ALUout[0]  = Temp2[12];
										Temp2[15]  = Temp2[11];
										Temp2[14]  = Temp2[10];
										Temp2[13]  = Temp2[9];
										Temp2[12] =Temp2[8];
										Temp2[11] =Temp2[7];
										Temp2[10] =Temp2[6];
										Temp2[9]	 =Temp2[5];
										Temp2[8]	 =Temp2[4];
										Temp2[7]  =Temp2[3];
										Temp2[6]  =Temp2[2];
										Temp2[5]	 =Temp2[1];
										Temp2[4]	 =Temp2[0];
										Temp2[3:0]=4'b0000;
										
										MC= MC0;
									end
								default:
									begin
										MAH = PM_out;
										MC = MC2;
										PC = PC + 1'b1;
									end
							endcase
						end
						MC2:	begin	
							case (IR)	
								JMPU_IC:
									begin
										MAL = PM_out;
										MC = MC3;
										PC = PC + 1'b1;
									end
								JMPC_IC:
									begin
										MAL = PM_out;
										PC = PC + 1'b1;
									if (C == 0)
										MC = MC3;
									else MC = MC0;
									end	
								WR_IC:
									begin
										MAL = PM_out;
										MC = MC3;
									
										PC = PC + 1'b1;
										WR_DM = 1'b1;
										// no need DM_in = A;
									if (MA[7] == 1)
										MAeff = {MAH, PM_out} + {PC};
									else MAeff = {MAH, PM_out};
									end
									
								RD_IC:
									begin
										MAL = PM_out;
										MC = MC3;
										PC = PC + 1'b1;
										WR_DM = 1'b0;
										// has to be pc relative so change concatenation 
											if (MA[7] == 1)
												MAeff = {MAH, PM_out} + {PC};
											else MAeff = {MAH, PM_out};
									end
								 default:
									MC = MC0;
							endcase
						end
						MC3: begin
							case(IR)
								JMPU_IC, JMPC_IC:
									begin
										PC = MA;
										MC = MC0;
									end
								WR_IC:
								//write is a little bit different with different location
									begin
										
										MC = MC0;
										if (MA == 8'b11111111)
										begin
											DHR = A;
											//DM_in = A;
										end
										else if (MA== 8'hFE)
										//DLR = A;
										begin
											 DLR = A;
											//DM_in = A;
										end
										else
										begin
											DM_in = A;
										end
									end
								RD_IC:
									begin
										WR_DM = 1'b0;
										MC = MC0;
										
										if (MA == 8'b11111101)   //a=1010 1011 1100 1101
										begin
											ALUout[3:0] = SW_pin;
										//	ALUout[3:0] = DM_out;
										end
										else if( MA== 8'b11111100)
										begin
											ALUout[3:0] = PB_pin;
										//	ALUout[3:0] = DM_out;
										end
										else
										begin
											ALUout[3:0] = DM_out;
										end
									end
								default:
									MC = MC0;
							endcase
						end
						 default:
							MC = MC0;
					endcase
				end
endmodule
	