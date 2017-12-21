LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.zxw_package.all;

ENTITY zxw_cpu2_vhdl IS
	PORT( Resetn, Clock		:	IN	STD_LOGIC;
			SW,PB					:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			DHR_out, DLR_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			ib					:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);	
			A_out, B_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			MAeff				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			DM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			
			LD_IR				:  OUT  STD_LOGIC;
		   RD_PM 			: OUT STD_LOGIC;
			CNT_PC, LD_PC	: OUT  STD_LOGIC;
			LD_DM			   : OUT STD_LOGIC;
			LD_A, LD_B		: OUT  STD_LOGIC;
			
			LD_C, OE_ALU	:OUT	 STD_LOGIC;
			FS					:OUT	 STD_LOGIC_VECTOR(3 DOWNTO 0);
			wb             :OUT	 STD_LOGIC_VECTOR(1 DOWNTO 0);
			OE_RM				:OUT	 STD_LOGIC;
			STACKMode      :OUT	 STD_LOGIC_VECTOR(1 DOWNTO 0);
		   LD_MAH, LD_MAL	:OUT	 STD_LOGIC;
			PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			MAout				:OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ir             :OUT STD_LOGIC_VECTOR(3 downto 0);
			C            	:   OUT STD_LOGIC;
			LD_DHR, LD_DLR : OUT STD_LOGIC
			);
END zxw_cpu2_vhdl;			
	ARCHITECTURE Behavior OF zxw_CPU2_vhdl IS		
	
	
	SIGNAL 	Clock_not					:	STD_LOGIC;
	--SIGNAL 	AAmux_in						:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ib_int						:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	A_out_int, B_out_int		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	ALU_out_int					:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	ALU_C_out_int, C_out_int	:	STD_LOGIC;
	SIGNAL	MA_int					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	--SIGNAL	PM_out_int, IR_out_int	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	MAmux_int					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL	MAeff_int					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	DM_out_int					:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	LD_DHR_int, LD_DLR_int	:	STD_LOGIC;
	--SIGNAL	IE_SW_int, IE_PB_int		:	STD_LOGIC;
	SIGNAL	DHR_out_int, DLR_out_int	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	--SIGNAL	Stackoutput          	: STD_LOGIC_VECTOR(3 downto 0);
	
	SIGNAL		LD_IR_int				:   STD_LOGIC;
	SIGNAL		RD_PM_int 				:   STD_LOGIC;
	SIGNAL		CNT_PC_int , LD_PC_int 			:   STD_LOGIC;
	SIGNAL		LD_DM_int			   :   STD_LOGIC;
	SIGNAL		LD_A_int, LD_B_int	:   STD_LOGIC;
			
	SIGNAL		LD_C_int, OE_ALU_int	:	 STD_LOGIC;
	SIGNAL		FS_int					:	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL		wb_int             	:	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		OE_RM_int				:	 STD_LOGIC;
	SIGNAL		STACKMode_int      	:	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		LD_MAH_int, LD_MAL_int	:	 STD_LOGIC;
	SIGNAL      ir_int                   :   STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL      C_int                    :   STD_LOGIC;
	SIGNAL      usel1,usel0          :   STD_LOGIC;
	SIGNAL		PC_out_int				:	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL		PM_out_int				:	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL      MA_out_int           :   STD_LOGIC_VECTOR(7 downto 0);
	
	BEGIN
	--rom   :	zxw_rom_vhdl	PORT MAP(PC_out_int, Clock_not, PM_out_int);
	cu:   zxw_cu_vhdl PORT MAP(Resetn, Clock,	ir_int	,C_int	,usel1, usel0 ,	LD_IR_int	,	RD_PM_int ,	CNT_PC_int, LD_PC_int	,LD_DM_int	, 
	LD_A_int, LD_B_int,	LD_C_int, OE_ALU_int,	FS_int	,	wb_int , OE_RM_int, STACKMode_int , LD_MAH_int, LD_MAL_int	);
	dp:   zxw_dp_vhdl PORT MAP (
	Resetn, Clock, SW,PB, ir_int,C_int,LD_IR_int,RD_PM_int ,CNT_PC_int, LD_PC_int, 
	LD_DM_int ,LD_A_int, LD_B_int ,LD_C_int	,OE_ALU_int	,FS_int,wb_int	,	OE_RM_int	,STACKMode_int , LD_MAH_int, LD_MAL_int	,
	ib_int	,	A_out_int, B_out_int,	ALU_out_int	,
	PC_out_int,	
	PM_out_int,	
	MAeff_int,	DM_out_int	,DHR_out_int, DLR_out_int,MA_out_int,	LD_DHR_int, LD_DLR_int 	);
	
	ib			<= ib_int;
	A_out    <= A_out_int;
	B_out		<=	B_out_int;
	ALU_out	<=	ALU_out_int;
	MAeff		<=	MAeff_int;
	DM_out	<=	DM_out_int;
	DHR_out	<=	DHR_out_int;
	DLR_out	<=	DLR_out_int;
	
	MAout		<= MA_out_int;
	
	LD_IR		<=		LD_IR_int;
	RD_PM 	<=		RD_PM_int;
	CNT_PC	<=		CNT_PC_int;
	LD_PC		<=		LD_PC_int;
	LD_DM		<=	   LD_DM_int;
	LD_A		<=		LD_A_int;
	LD_B		<=		LD_B_int;
	LD_C		<=		LD_C_int;
	OE_ALU	<=		OE_ALU_int;
	FS			<=		FS_int;
	wb       <=    wb_int;
	OE_RM		<=		OE_RM_int;
	STACKMode<=    STACKMode_int;
	LD_MAH	<=		LD_MAH_int;
	LD_MAL	<=		LD_MAL_int;
	PC_out	<=  PC_out_int		;
	PM_out	<=  PM_out_int		;
	ir    	<= ir_int;
	C		   <= C_int;
	LD_DHR   <=LD_DHR_int;
	LD_DLR	<= LD_DLR_int;
	END behavior; 
	
	
	

