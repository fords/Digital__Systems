LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_far_vhdl IS
     PORT (Cin  : IN  STD_LOGIC;
             X,Y  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
             S    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
             Cout : OUT STD_LOGIC );
             
END zxw_far_vhdl;

ARCHITECTURE Structure OF zxw_far_vhdl IS
     SIGNAL C: STD_LOGIC_VECTOR(3 downto 1);
     SIGNAL T: STD_LOGIC_VECTOR( 3 downto 0);
     COMPONENT zxw_fa_vhdl IS
			PORT ( Cin, x, y:IN STD_LOGIC ; 
						s,Cout :OUT STD_LOGIC);
	  END COMPONENT zxw_fa_vhdl;	
BEGIN
	T(0)<= Y(0) XOR Cin;
	T(1)<= Y(1) XOR Cin;
	T(2)<= Y(2) XOR Cin;
	T(3)<= Y(3) XOR Cin;
	stage0: zxw_fa_vhdl PORT MAP (Cin, X(0), T(0),S(0),C(1) );
	stage1: zxw_fa_vhdl PORT MAP (C(1),X(1), T(1),S(1),C(2) );
	stage2: zxw_fa_vhdl PORT MAP (C(2),X(2), T(2),S(2),C(3) );
	stage3: zxw_fa_vhdl PORT MAP (C(3),X(3), T(3),S(3),Cout );
END structure;     
