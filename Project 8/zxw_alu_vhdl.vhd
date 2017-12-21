LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;

ENTITY zxw_alu_vhdl IS
	PORT (	
			Operand_A, Operand_B	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			Func_Sel					:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_Result				:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_Cout					: 	OUT 	STD_LOGIC ) ;
END zxw_alu_vhdl ;

ARCHITECTURE Behavior OF zxw_alu_vhdl IS	

SIGNAL	Sum, Incr, Diff, Decr, Shr	:	STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN

	Sum <= ('0' & Operand_A) + ('0' & Operand_B) + Func_Sel(0);
	Diff <= ('0' & Operand_A) + ('0' & (NOT Operand_B)) + Func_Sel(0);
	Incr <= ('0' & Operand_A) + Func_Sel(0);
	Decr <= ('0' & Operand_A) + "01111";
	Shr(4) <= Operand_A(0);
	Shr(3) <= Operand_A(3);
	Shr(2) <= Operand_A(3);
	Shr(1) <= Operand_A(2);
	Shr(0) <= Operand_A(1);
	
	WITH Func_Sel SELECT
		ALU_Result <= 	Operand_A 			WHEN "0000",
							Incr(3 DOWNTO 0) 	WHEN "0001",
							Sum(3 DOWNTO 0)	WHEN "0010",
							Sum(3 DOWNTO 0)	WHEN "0011",
							Diff(3 DOWNTO 0)	WHEN "0100",
							Diff(3 DOWNTO 0)	WHEN "0101",
							Decr(3 DOWNTO 0) 	WHEN "0110",
							Operand_A 			WHEN "0111",
							(NOT Operand_A) 	WHEN "1000",
							(NOT Operand_A) 	WHEN "1001",
							(Operand_A AND Operand_B)	WHEN "1010",
							(Operand_A AND Operand_B)	WHEN "1011",
							(Operand_A OR Operand_B) 	WHEN "1100",
							(Operand_A OR Operand_B) 	WHEN "1101",
							Shr(3 DOWNTO 0)	WHEN "1110",
							Shr(3 DOWNTO 0)	WHEN OTHERS;
	WITH Func_Sel SELECT
		ALU_Cout	<=		Incr(4)	WHEN "0001",
							Sum(4)	WHEN "0010",
							Sum(4)	WHEN "0011",
							Diff(4)	WHEN "0100",
							Diff(4)	WHEN "0101",
							Decr(4)	WHEN "0110",
							Shr(4)	WHEN "1110",
							Shr(4)	WHEN "1111",
							'0'		WHEN OTHERS;
END Behavior ;
