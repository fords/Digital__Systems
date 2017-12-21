LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_DP_vhdl_tb IS
END zxw_DP_vhdl_tb;

ARCHITECTURE lut OF zxw_DP_vhdl_tb IS
------------------------------------------------------------------------------
-- Declare the uut component
------------------------------------------------------------------------------
	COMPONENT zxw_DP_vhdl -- my Data Path
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
	LD_MAH, LD_MAL	:	IN	STD_LOGIC;

	ib					:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);	
	A_out, B_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	ALU_out		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- ALU_C_out,MA
	--PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	--PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	--MAmux			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	MAeff				:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	DM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	DHR_out, DLR_out	:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	END component; 
	
	
-------------------------------------------------------------------------------------
-- Stimulus signals
------------------------------------------------------------------------------
	SIGNAL   Resetn_tb, Clock_tb		:	STD_LOGIC;
	SIGNAL	ir_tb							: 	STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	C_tb							:	STD_LOGIC;
			
------------------------------------------------------------------------------
-- Observed and output signals
------------------------------------------------------------------------------
	
--				jmp_addr_tb					:   STD_LOGIC;
--				usel1_tb, usel0_tb		:   STD_LOGIC;	
	SIGNAL		LD_IR_tb						:   STD_LOGIC;
	SIGNAL		RD_PM_tb						:   STD_LOGIC;
	SIGNAL		CNT_PC_tb, LD_PC_tb		:   STD_LOGIC;
	SIGNAL		LD_DM_tb			   		:   STD_LOGIC;
	SIGNAL		LD_A_tb, LD_B_tb			:   STD_LOGIC;
	SIGNAL		LD_C_tb, OE_ALU_tb		:   STD_LOGIC;
	SIGNAL		FS_tb							:	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL		WB_tb             		:   STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		OE_RM_tb						:	 STD_LOGIC;
	SIGNAL		STACKMode_tb      		:   STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		LD_MAH_tb, LD_MAL_tb		:	 STD_LOGIC;
		
	SIGNAL	ib_tb					:		STD_LOGIC_VECTOR(3 DOWNTO 0);	
	SIGNAL	A_out_tb, B_out_tb	:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	ALU_out_tb		:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- ALU_C_out,MA
	--PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	--PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	--MAmux			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	MAeff_tb				:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	DM_out_tb			:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	DHR_out_tb, DLR_out_tb	:		STD_LOGIC_VECTOR(3 DOWNTO 0);
TYPE zxw_test_vector	IS RECORD	
	
	      Resetn_tb, Clock_tb		:	 STD_LOGIC;
	 		ir_tb							: 	 STD_LOGIC_VECTOR(3 downto 0);
			C_tb							:	 STD_LOGIC;	
			LD_IR_tb						:   STD_LOGIC;
			RD_PM_tb						:   STD_LOGIC;
			CNT_PC_tb, LD_PC_tb		:   STD_LOGIC;
			LD_DM_tb			   		:   STD_LOGIC;
			LD_A_tb, LD_B_tb			:   STD_LOGIC;
			LD_C_tb, OE_ALU_tb		:   STD_LOGIC;
			FS_tb							:	 STD_LOGIC_VECTOR(3 DOWNTO 0);
			WB_tb             		:   STD_LOGIC_VECTOR(1 DOWNTO 0);
		   OE_RM_tb						:	 STD_LOGIC;
			STACKMode_tb      		:   STD_LOGIC_VECTOR(1 DOWNTO 0);
		   LD_MAH_tb, LD_MAL_tb		:	 STD_LOGIC;	
			
			ib_tb							:		STD_LOGIC_VECTOR(3 DOWNTO 0);
			A_out_tb, B_out_tb		:		STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALU_out_tb					:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- ALU_C_out,MA
	--PC_out			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
	--PM_out			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	--MAmux			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			MAeff_tb						:		STD_LOGIC_VECTOR(7 DOWNTO 0);
			DM_out_tb					:		STD_LOGIC_VECTOR(3 DOWNTO 0);
		   DHR_out_tb, DLR_out_tb	:		STD_LOGIC_VECTOR(3 DOWNTO 0);
END RECORD;	
	
TYPE  zxw_test_vector_array IS ARRAY (natural RANGE <>) OF  zxw_test_vector;

CONSTANT  zxw_test_vectors	:	 zxw_test_vector_array := (
--reset
		( Resetn_tb => '0', Clock_tb => '0',ir_tb=>"0000", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0010", C_tb=>'0',  
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
				
		),
--inc
			( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0010",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1',LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '1', OE_ALU_tb => '1', 
				FS_tb => "0001" ,WB_tb=> "00" ,OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1011", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
--cpy
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1011", C_tb=>'0', 
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'1',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" , OE_RM_tb => '0',
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
					,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0000", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
			
--add
	      ( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0000",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0', LD_DM_tb=>'0',LD_C_tb => '1', OE_ALU_tb => '1', 
				FS_tb => "0010" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
					,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1010", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
					,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
--swap	
	( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1010", C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'1', LD_DM_tb=>'0',LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "11" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0110", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 	
		),
--or
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0110",C_tb=>'0', 
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0', 
				LD_A_tb=>'1',	LD_B_tb=>'0', LD_DM_tb=>'0',LD_C_tb => '0', OE_ALU_tb=> '1', 
				FS_tb => "1100" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),			
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0111", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
			
--shr
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0111",C_tb=>'0',
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '1', OE_ALU_tb => '1', 
				FS_tb => "1110" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			

			
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0101", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
--and
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0101",C_tb=>'0', 
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '1', 
				FS_tb => "1010" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0100", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
--not	
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0100",C_tb=>'0', 
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0', 
				LD_A_tb=>'1',LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '1', 
				FS_tb => "1000" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0001", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
			
--subtraction
			( Resetn_tb => '1', Clock_tb => '0',ir_tb=> "0001",C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0', LD_DM_tb=>'0', LD_C_tb => '1',OE_ALU_tb => '1', 
				FS_tb => "0101" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
			
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0011", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 	
		),
	--dec
			( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0011",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0', LD_PC_tb=> '0',
				LD_A_tb=>'1', 	LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '1', OE_ALU_tb => '1', 
				FS_tb => "0110" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1100", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
			
	--write
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1100",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0', 
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "10" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '1', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1100", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00"  , OE_RM_tb => '1', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'1'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1100",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'1', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1110", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
			
	--push
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1110", C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "01" , OE_RM_tb => '0', 
				STACKMode_tb => "01" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 	
		),
		
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1101", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
	--read
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1101", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "01" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '1', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 	
		),
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1101", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'1'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1101", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" , OE_RM_tb => '1',  
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1111", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),	
--pop
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1111", C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "01" ,  OE_RM_tb => '0', 
				STACKMode_tb => "10" , LD_MAH_tb=> '1', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1001", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
		),	
--jmpc
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1001",C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0', LD_DM_tb=>'0',LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '1', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1001", C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'1'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1001", C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '1', 
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" ),  
				
	--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1000", C_tb=>'0', 
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0' ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 	
		),			
--jmpu
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1000",C_tb=>'0', 
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0', 
				LD_A_tb=>'0', 	LD_B_tb=>'0', LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '1', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1000",C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '1',LD_PC_tb=> '0', 
				LD_A_tb=>'0', LD_B_tb=>'0', LD_DM_tb=>'0', LD_C_tb => '0',OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" , OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'1'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"1000",C_tb=>'0',  
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '1', 
				LD_A_tb=>'0', LD_B_tb=>'0', LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,
				DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			),
			--if0
		( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0010", C_tb=>'0',  
				LD_ir_tb=> '1', RD_PM_tb => '1', CNT_PC_tb=> '1',LD_PC_tb=> '0',
				LD_A_tb=>'0', LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '0', OE_ALU_tb => '0', 
				FS_tb => "0000" ,WB_tb=> "00" ,  OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
				
		),
--inc
			( Resetn_tb => '1', Clock_tb => '0',ir_tb=>"0010",C_tb=>'0',   
				LD_ir_tb=> '0', RD_PM_tb => '0', CNT_PC_tb=> '0',LD_PC_tb=> '0',
				LD_A_tb=>'1',LD_B_tb=>'0',LD_DM_tb=>'0', LD_C_tb => '1', OE_ALU_tb => '1', 
				FS_tb => "0001" ,WB_tb=> "00" ,OE_RM_tb => '0', 
				STACKMode_tb => "00" , LD_MAH_tb=> '0', LD_MAL_tb=>'0'  ,ib_tb=> "----"
				,A_out_tb=> "----", B_out_tb=> "----" ,ALU_out_tb=> "----",MAeff_tb	=>"--------" ,DM_out_tb=>"----",DHR_out_tb=>"----",DLR_out_tb=>"----" 
			)
);

BEGIN
	UUT	:	zxw_dp_vhdl
		PORT MAP(
	Resetn => Resetn_tb, Clock => Clock_tb, IR_out => ir_tb, C_out	 => C_tb,	
	LD_IR => LD_IR_tb, RD_PM => RD_PM_tb, CNT_PC => CNT_PC_tb, 
	LD_PC=> LD_PC_tb, LD_A => LD_A_tb, LD_B => LD_B_tb, WR_DM  => LD_DM_tb, 
	LD_CDFF => LD_C_tb, OE_ALU => OE_ALU_tb, FS => FS_tb, WB => WB_tb, OE_rD => OE_RM_tb, 
	STACKMode => STACKMode_tb, LD_MAH => LD_MAH_tb, LD_MAL => LD_MAL_tb,
	ib => ib_tb, A_out => A_out_tb, B_out=> B_out_tb,  ALU_out=>ALU_out_tb  , MAeff =>MAeff_tb  , DM_out=>DM_out_tb , DHR_out =>DHR_out_tb , DLR_out =>DLR_out_tb
	);
	
	tb	:	PROCESS
	CONSTANT period : time := 20 ns;
	BEGIN
		FOR i	IN zxw_test_vectors'RANGE LOOP	
		
		
		Resetn_tb	<=		zxw_test_vectors(i).Resetn_tb;
		Clock_tb		<=		zxw_test_vectors(i).Clock_tb;	
		LD_IR_tb		<=		zxw_test_vectors(i).LD_IR_tb;
		RD_PM_tb		<=		zxw_test_vectors(i).RD_PM_tb;
		CNT_PC_tb	<=		zxw_test_vectors(i).CNT_PC_tb;
		LD_PC_tb	 	<=		zxw_test_vectors(i).LD_PC_tb	;
		LD_A_tb		<=		zxw_test_vectors(i).LD_A_tb;
		LD_B_tb 		<=		zxw_test_vectors(i).LD_B_tb;
		LD_DM_tb		<=		zxw_test_vectors(i).LD_DM_tb;
		LD_C_tb		<=		zxw_test_vectors(i).LD_C_tb;
		OE_ALU_tb	<=		zxw_test_vectors(i).OE_ALU_tb;
		FS_tb			<=		zxw_test_vectors(i).FS_tb ;
		WB_tb			<=		zxw_test_vectors(i).WB_tb	;
		OE_RM_tb		<=		zxw_test_vectors(i).OE_RM_tb;
		STACKMode_tb	<=		zxw_test_vectors(i).STACKMode_tb;
		LD_MAH_tb		<=		zxw_test_vectors(i).LD_MAH_tb;
		LD_MAL_tb		<=		zxw_test_vectors(i).LD_MAL_tb ;
		
		WAIT FOR period;
		Clock_tb <= '1';
		WAIT FOR period;
		ASSERT (
		(ir_tb		<=		zxw_test_vectors(i).ir_tb) AND
		(C_tb		   <=		zxw_test_vectors(i).C_tb) AND
		(ib_tb		<=		zxw_test_vectors(i).ib_tb) AND		
		(A_out_tb 	<=		zxw_test_vectors(i).A_out_tb)AND
		(B_out_tb	<=		zxw_test_vectors(i).B_out_tb)AND
		(ALU_out_tb	<=		zxw_test_vectors(i).ALU_out_tb)AND	
		(MAeff_tb	<=		zxw_test_vectors(i).MAeff_tb)AND		
		(DM_out_tb	<=		zxw_test_vectors(i).DM_out_tb)AND	
		(DHR_out_tb	<=		zxw_test_vectors(i).DHR_out_tb)AND
		(DLR_out_tb	<=		zxw_test_vectors(i).DLR_out_tb) )
	REPORT "data path test vector " & INTEGER'IMAGE(i) & " failed"
		SEVERITY error;

	END LOOP;
	WAIT;
	END PROCESS;
END lut;
