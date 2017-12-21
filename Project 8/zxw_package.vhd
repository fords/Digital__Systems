LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

PACKAGE zxw_package IS

	COMPONENT zxw_8bit_upcnt_vhdl -- 8bit up counter
	PORT (D		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetn, Clock	:	IN STD_LOGIC;
			Cnt_EN, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT ;

	COMPONENT zxw_4bit_reg_vhdl -- 4bit register
	PORT (D		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			Resetn, Clock, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT ;

	COMPONENT zxw_dff_en_vhdl -- my dff with enable
	PORT (Din, Clock, LD_EN	:	IN STD_LOGIC;
			Q_out	:	OUT STD_LOGIC);
	END COMPONENT ;

	COMPONENT zxw_rom_vhdl -- my ROM
	PORT (address	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END component ;

	COMPONENT zxw_ram_vhdl -- my RAM
	PORT (address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END component ;


	COMPONENT zxw_8bit_mux2to1_vhdl -- my 8-bit mux2to1
	PORT (x1, x2	: 	IN   	STD_LOGIC_VECTOR(7 DOWNTO 0) ;
				s		:	IN		STD_LOGIC;
				f 		:	OUT  	STD_LOGIC_VECTOR(7 DOWNTO 0) );
	END component ;

	COMPONENT zxw_8bit_adder_vhdl -- my 8-bit adder
	PORT (Cin	:	IN		STD_LOGIC;
			X, Y	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Cout	:	OUT	STD_LOGIC);
	END component ;

	COMPONENT zxw_8bit_AAadder_vhdl -- my Address Arithmetic 8-bit adder
	PORT (X, Y	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
	END component ;

	COMPONENT zxw_adl_vhdl -- my Address Decoding Logic
	PORT (WR_DM, OE_RD  : IN STD_LOGIC ;
		MAH	:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		IE_SW, IE_PB, LD_DHR, LD_DLR : OUT STD_LOGIC);
	END component ;

	COMPONENT zxw_alu_vhdl -- my Address Decoding Logic
	PORT (Operand_A, Operand_B	:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			Func_Sel					:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_Result				:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_Cout					: 	OUT 	STD_LOGIC);
	END component ;
	
	component zxw_4bit_mux4to1 
	port(
		A	: in	STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		B	: in	STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		C	: in	STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		D	: in	STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		S  : in	STD_LOGIC_VECTOR(1 DOWNTO 0);
		
		O	: out	STD_LOGIC_VECTOR(3 DOWNTO 0) );
	END component;
	
	component zxw_stack_vhdl
	PORT(

	mode  : in    std_logic_vector(1 downto 0);
	push  : in    std_logic_vector(3 downto 0);
	clk   : in    std_logic;
	output: out   std_logic_vector(3 downto 0)
	);
	END component;
	
END zxw_package ;
