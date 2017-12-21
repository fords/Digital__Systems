LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.zxw_package.all;

ENTITY zxw_cu_vhdl IS
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

END zxw_cu_vhdl;

ARCHITECTURE Structural OF zxw_cu_vhdl IS
------------------------------------------------------------------------------
-- Declare internal signals
------------------------------------------------------------------------------
	SIGNAL Clockn	:	STD_LOGIC;
	SIGNAL uM1	:	STD_LOGIC;
	SIGNAL uM0	:	STD_LOGIC;
--	SIGNAL usel1_int: STD_LOGIC;
--	SIGNAL usel0_int: STD_LOGIC;
   SIGNAL incre_out_int : STD_LOGIC_VECTOR (5  downto 0);
	SIGNAL 	uPCout_int	: STD_LOGIC_VECTOR (5  downto 0);
--	SIGNAL jmp_addr_int : STD_LOGIC_VECTOR(5 downto 0) ;
	SIGNAL mux_out_int  : STD_LOGIC_VECTOR(5 downto 0)  ;
	SIGNAL upc : STD_LOGIC_VECTOR(5 downto 0)  ;
	SIGNAL rom_out_int : STD_LOGIC_VECTOR(27 downto 0)  ;
	SIGNAL ir6bit : STD_LOGIC_VECTOR(5 downto 0)  ;
	SIGNAL uMsum: STD_LOGIC_VECTOR(1 downto 0);
begin	
	Clockn <= NOT Clock;
	my_sel: zxw_uSel_vhdl PORT MAP(rom_out_int(21),rom_out_int(20),C,uM1,uM0);
	uMsum <= uM1& uM0;
	ir6bit   <= "00" & ir;
	my_increregister: zxw_incre_vhdl PORT MAP(upc, incre_out_int);
	my_6bit: zxw_6bit_4to1mux_vhdl PORT MAP(uMsum, incre_out_int,ir6bit,"000000",rom_out_int(27 downto 22),  mux_out_int );
	
	my_upc  : zxw_6bit_reg_vhdl PORT MAP(mux_out_int,Resetn, clock, '1', upc);
	
	my_rom :  zxw_rom5_vhdl PORT MAP (upc ,clockn, rom_out_int);
	--zeyar: zxw_ir_vhdl PORT MAP( ir,Clock,ir_out_int);
	--jmp_addr	<= rom_out_int(28 downto 23) ;
	usel1    <= rom_out_int(21) ;
	usel0	   <= rom_out_int(20);
	LD_IR		<= rom_out_int(19);
	RD_PM    <= rom_out_int(18);
	CNT_PC   <= rom_out_int(17);
	LD_PC	   <= rom_out_int(16);
	LD_DM		<= rom_out_int(13);  
	LD_A		<= rom_out_int(15);
	LD_B		<= rom_out_int(14); 
	LD_C		<= rom_out_int(12);
	OE_ALU	<= rom_out_int(11);	
	FS			<= rom_out_int(10 downto 7);
	WB       <= rom_out_int(6 downto 5);     
	
	OE_RM		<= rom_out_int(4);
	STACKMode<= rom_out_int(3 downto 2);    
	LD_MAH	<= rom_out_int(1);
	LD_MAL	<= rom_out_int(0);
END Structural;