LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY  zxw_8bit_mux2to1_vhdl IS 			
	PORT ( x1, x2	: 	IN   	STD_LOGIC_VECTOR(7 DOWNTO 0) ;
				s		:	IN		STD_LOGIC;
				f 		:	OUT  	STD_LOGIC_VECTOR(7 DOWNTO 0) ) ; 	
END  zxw_8bit_mux2to1_vhdl ; 	

ARCHITECTURE zxw_dataflow OF zxw_8bit_mux2to1_vhdl IS 	
BEGIN 	
	f <= x1 WHEN s = '1' ELSE x2; 	
END zxw_dataflow ; 	
