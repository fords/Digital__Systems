LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.zxw_package.all;

ENTITY zxw_DP_vhdl IS
	PORT (
	Resetn, Clock	:	IN	STD_LOGIC;
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
	MAeff				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	DM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	DHR_out, DLR_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0));
	
	
	
	
	
END zxw_DP_vhdl;


ARCHITECTURE Structural OF zxw_DP_vhdl IS

	SIGNAL 	Clock_not	:	STD_LOGIC;
	SIGNAL 	AAmux_in	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ib_int					:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	A_out_int, B_out_int	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	ALU_out_int				:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	ALU_C_out_int, C_out_int	:	STD_LOGIC;
	SIGNAL	MA_int, PC_out_int		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	PM_out_int, IR_out_int	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	MAmux_int				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	MAeff_int				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	DM_out_int				:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	LD_DHR_int, LD_DLR_int	:	STD_LOGIC;
	SIGNAL	IE_SW_int, IE_PB_int	:	STD_LOGIC;
	SIGNAL	DHR_out_int, DLR_out_int	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	Stackoutput          : STD_LOGIC_VECTOR(3 downto 0);
	begin
		
		Clock_not <= NOT Clock;
		AAmux_in <= ("0000" & B_out_int);
		
		Areg	:	zxw_4bit_reg_vhdl	PORT MAP(ib_int, Resetn, Clock,
					LD_A, A_out_int);
		Breg  :  zxw_4bit_reg_vhdl	PORT MAP(A_out_int, Resetn, Clock,
					LD_B, B_out_int); 
		alu 	:	zxw_alu_vhdl 		PORT MAP(A_out_int, B_out_int, FS, ALU_out_int, 
					ALU_C_out_int);  -- alu out goes to multiplexer
		cdff  :  zxw_dff_en_vhdl	PORT MAP(ALU_C_out_int, Clock, LD_CDFF, C_out_int);		
		
		pc	   :	zxw_8bit_upcnt_vhdl	PORT MAP(MA_int, Resetn,
					Clock, Cnt_PC, LD_PC, PC_out_int);			
					
		rom   :	zxw_rom_vhdl	PORT MAP(PC_out_int, Clock_not, PM_out_int);
					
		ir	:	zxw_4bit_reg_vhdl	PORT MAP(PM_out_int, Resetn, Clock,
					LD_IR, IR_out_int);			
					
		mah:	zxw_4bit_reg_vhdl	PORT MAP(PM_out_int, Resetn, Clock,
					LD_MAH, MA_int(7 DOWNTO 4));
		mal:	zxw_4bit_reg_vhdl	PORT MAP(PM_out_int, Resetn, Clock,
					LD_MAL, MA_int(3 DOWNTO 0));			
		aa_mux	:	zxw_8bit_mux2to1_vhdl	
					PORT MAP(AAmux_in, "00000000", MA_int(7), MAmux_int);			
		aa_add	:	zxw_8bit_AAadder_vhdl
					PORT MAP(MAmux_int, MA_int, MAeff_int);			
		my_ram:	zxw_ram_vhdl	PORT MAP(MAeff_int, Clock_not, ib_int,
					WR_DM, DM_out_int);		
		stack:   zxw_stack_vhdl PORT MAP(STACKMode, A_out_int, clock, Stackoutput );
				-- DMOut to MUX HAS TO BE 4 BIT
		muxToBus: zxw_4bit_mux4to1 PORT MAP (ALU_out_int,Stackoutput,DM_out_int,B_out_int,
						WB,ib_int);			
		adl	:	zxw_adl_vhdl	PORT MAP( WR_DM,OE_RD, MA_int, 
													IE_SW_int, IE_PB_int, LD_DHR_int, LD_DLR_int);			
					
		my_dhr	:	zxw_4bit_reg_vhdl	PORT MAP(ib_int, Resetn, Clock,
					LD_DHR_int, DHR_out_int);
		my_dlr	:	zxw_4bit_reg_vhdl	PORT MAP(ib_int, Resetn, Clock,
					LD_DLR_int, DLR_out_int);			
		
		C_out		<= C_out_int;
		IR_out	<= IR_out_int;
		ib				<= ib_int;
		A_out			<= A_out_int;
		B_out			<= B_out_int;
		ALU_out 		<= ALU_out_int;
	   
		--MA			<= MA_int;  --this one is MA after
	--	PC_out	<= PC_out_int;
	--	PM_out	<= PM_out_int;
		
		MAeff			<= MAeff_int;
		DM_out		<= DM_out_int;
		DHR_out		<= DHR_out_int;
		DLR_out		<= DLR_out_int;
		
end structural;