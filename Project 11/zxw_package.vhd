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
	component zxw_uSel_vhdl 
		PORT ( usel1,usel0, Cout : IN STD_LOGIC;
			    uM1, uM0 : OUT STD_LOGIC
	
		);
	END component;
	
	
	component zxw_incre_vhdl 
		PORT
			(
			datab		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			result		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
		);
	END component;

	component zxw_6bit_reg_vhdl 
		PORT( D		:	IN		STD_LOGIC_VECTOR(5 DOWNTO 0);
			Resetn, Clock, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(5 DOWNTO 0));
	END component;


	component zxw_rom5_vhdl 
		PORT( address		:	IN		STD_LOGIC_VECTOR(5 DOWNTO 0);
			Clock:	IN STD_LOGIC;
			q		:	OUT	STD_LOGIC_VECTOR(27 DOWNTO 0));
	END component;
	
	component zxw_6bit_4to1mux_vhdl

			port(
                s       : in    std_logic_vector(1 downto 0);
                d0      : in    std_logic_vector(5 downto 0);
                d1      : in    std_logic_vector(5 downto 0);
                d2      : in    std_logic_vector(5 downto 0);
                d3      : in    std_logic_vector(5 downto 0);
                y       : out   std_logic_vector(5 downto 0)
        );
	END component;
	
	component zxw_4bit_mux8to1
	port(  A,B,C,D,E,F: in std_logic_vector(3 downto 0);
             S: in std_logic_vector(1 downto 0);
				 IE_SW,IE_PB:in std_logic  ;
             O: out std_logic_vector(3 downto 0));
	END component;

	component zxw_cu_vhdl

		PORT( Resetn, Clock	:	IN	STD_LOGIC;
			ir					: IN	STD_LOGIC_VECTOR(3 downto 0);
			C					:	IN STD_LOGIC;
	--		jmp_addr			:  OUT STD_LOGIC_VECTOR(5 downto 0);
			usel1, usel0	:  OUT STD_LOGIC;	
			LD_IR				:  OUT STD_LOGIC;
			RD_PM 			:  OUT STD_LOGIC;
			CNT_PC, LD_PC	:  OUT STD_LOGIC;
			LD_DM			   :  OUT STD_LOGIC;
			LD_A, LD_B		:  OUT STD_LOGIC;
			
			LD_C, OE_ALU	:	OUT STD_LOGIC;
			FS					:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			WB             :	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			OE_RM				:	OUT STD_LOGIC;
			STACKMode      :	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			LD_MAH, LD_MAL	:	OUT STD_LOGIC);
	END component;
	component zxw_dp_vhdl
	PORT (
	Resetn, Clock	:	IN	STD_LOGIC;
	SW,PB          :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	IR_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	C_out				:	OUT STD_LOGIC;
	LD_IR				:	IN	STD_LOGIC;
	 RD_PM 		   :  IN STD_LOGIC; --doesn't use at all
	CNT_PC, LD_PC	:	IN	STD_LOGIC;
	WR_DM      		:	IN	STD_LOGIC; --LD_DM same
	LD_A, LD_B		:	IN STD_LOGIC;
	LD_CDFF			:	IN	STD_LOGIC;
	OE_ALU			:	IN	STD_LOGIC;
	FS					:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	WB					:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	OE_rD				:	IN	STD_LOGIC;
	STACKMode      :	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LD_MAH, LD_MAL	:	IN	STD_LOGIC ;
	
	ib					:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);	
	A_out, B_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	ALU_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- ALU_C_out,MA
	--PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	--PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	--MAmux			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	MAeff				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	DM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	DHR_out, DLR_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	MAout		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	LD_DHR, LD_DLR	:	OUT STD_LOGIC);
	END component;
	
END zxw_package ;
