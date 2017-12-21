LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_CPU2_vhdl_tb2 IS
END zxw_CPU2_vhdl_tb2;

ARCHITECTURE lut OF zxw_CPU2_vhdl_tb2 IS
------------------------------------------------------------------------------
-- Declare the uut component
------------------------------------------------------------------------------
	COMPONENT zxw_CPU2_vhdl -- my CPU2
	PORT (Resetn, Clock	:	IN	STD_LOGIC;
			SW, PB		:	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
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
			MAout				:OUT	 STD_LOGIC_VECTOR(7 DOWNTO 0);
			ir             :OUT   STD_LOGIC_VECTOR(3 downto 0);
			C              :OUT  STD_LOGIC;
			LD_DHR,LD_DLR	:OUT STD_LOGIC
			);
	END component ;
------------------------------------------------------------------------------
-- Stimulus signals
------------------------------------------------------------------------------
	SIGNAL		Resetn_pin_tb, Clock_pin_tb	:	STD_LOGIC;
	SIGNAL		SW_pin_tb, PB_pin_tb	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
------------------------------------------------------------------------------
-- Observed and output signals
------------------------------------------------------------------------------
	SIGNAL		DHR_pin_tb, DLR_pin_tb	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
------------------------------------------------------------------------------
-- The port mapping of the UUT.

------------------------------------------------------------------------------
	SIGNAL		ib_tb					:		STD_LOGIC_VECTOR(3 DOWNTO 0);	
	SIGNAL		A_out_tb, B_out_tb	:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL		ALU_out_tb			:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL		MAeff_tb			:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL		DM_out_tb			:		STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			
	SIGNAL		LD_IR_tb				:   STD_LOGIC;
	SIGNAL	   RD_PM_tb			:   STD_LOGIC;
	SIGNAL		CNT_PC_tb, LD_PC_tb	:   STD_LOGIC;
	SIGNAL		LD_DM_tb			   :   STD_LOGIC;
	SIGNAL		LD_A_tb, LD_B_tb		:   STD_LOGIC;
			
	SIGNAL		LD_C_tb, OE_ALU_tb	:	 STD_LOGIC;
	SIGNAL		FS_tb					:	 STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL		wb_tb             :	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL		OE_RM_tb				:	 STD_LOGIC;
	SIGNAL		STACKMode_tb      :	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL	   LD_MAH_tb, LD_MAL_tb	:	 STD_LOGIC;
	SIGNAL 		MAout_tb				:	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL 		PC_out_tb			:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL      PM_out_tb			:		STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL      ir_tb             :   STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL 		C_tb              :  STD_LOGIC;
	SIGNAL     LD_DHR_tb,LD_DLR_tb:STD_LOGIC;
BEGIN
	UUT	:	zxw_CPU2_vhdl
		PORT MAP( Resetn => Resetn_pin_tb, Clock => Clock_pin_tb,
			SW => SW_pin_tb, PB => PB_pin_tb,
			DHR_out => DHR_pin_tb, DLR_out => DLR_pin_tb,
			ib =>ib_tb , A_out =>  A_out_tb,
			B_out		 =>	B_out_tb,
			ALU_out	=>    ALU_out_tb,
			MAeff		=>		MAeff_tb,
			DM_out	=>		DM_out_tb,
			LD_IR		=>		LD_IR_tb,
			RD_PM		=>		RD_PM_tb,
			CNT_PC	=>		CNT_PC_tb,
			LD_PC		=>		LD_PC_tb,
			LD_DM		=>		LD_DM_tb,
			LD_A		=>		LD_A_tb,
			LD_B		=>		LD_B_tb,
			LD_C		=>		LD_C_tb,
			OE_ALU 	=>		OE_ALU_tb,
			FS 		=>		FS_tb,
			wb			=>		wb_tb,
			OE_RM		=>		OE_RM_tb,
			STACKMode=>		STACKMode_tb,
			LD_MAH	=>		LD_MAH_tb,
			LD_MAL	=>		LD_MAL_tb,
			PC_out   =>		PC_out_tb,
			PM_out   => 	PM_out_tb,
			MAout    =>    MAout_tb,
			ir			=>    ir_tb,
			C			=>    C_tb ,
			LD_DHR	=>		LD_DHR_tb,
			LD_DLR	=>		LD_DLR_tb
			);
-------------------------------------------------------------------------------
-- The testbench process assigns new input stimulus values in the first 
--		half-period of the clock.
-- In this case, the assertion of the outputs is done "manually" in the
-- 	timing diagram.  Unless there are errors, only the values of 
-- 	DHR and DLR have to be checked.
------------------------------------------------------------------------------
	tb	:	PROCESS
	CONSTANT period : time := 20 ns;
	CONSTANT n	:	integer	:= 500;
	CONSTANT m	:	integer	:= 30;
	BEGIN
------------------------------------------------------------------------------
-- The RESET cycle
------------------------------------------------------------------------------
		Resetn_pin_tb <= '0';
		Clock_pin_tb <= '0';
		SW_pin_tb <= "0000";
		PB_pin_tb <= "0000";
		WAIT FOR period;
		Clock_pin_tb <= '1';
		WAIT FOR period;
------------------------------------------------------------------------------
-- The cycles in which the user enters the first operand value. PB=1
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "0101";
			PB_pin_tb <= "0001";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- PB=0
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "0101";
			PB_pin_tb <= "0000";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- PB=1
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "0101";
			PB_pin_tb <= "0001";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- The cycles in which the user enters the second operand value. PB=1
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "0101";
			PB_pin_tb <= "0001";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- PB=0
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "1010";
			PB_pin_tb <= "0000";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- PB=1
------------------------------------------------------------------------------	
		FOR i	IN 0 TO m LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "1010";
			PB_pin_tb <= "0001";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
------------------------------------------------------------------------------
-- All other cycles.  Their number depends on how long the program is.
------------------------------------------------------------------------------	
		FOR i	IN 0 TO n LOOP
			Resetn_pin_tb <= '1';
			Clock_pin_tb <= '0';
			SW_pin_tb <= "1010";
			PB_pin_tb <= "0001";
			WAIT FOR period;
			Clock_pin_tb <= '1';
			WAIT FOR period;
		END LOOP;
	WAIT;
	END PROCESS;
END lut;