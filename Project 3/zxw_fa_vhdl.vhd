LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_fa_vhdl IS
			PORT ( Cin, x, y:IN STD_LOGIC ; 
					s,Cout :OUT STD_LOGIC);
END zxw_fa_vhdl;													
												
ARCHITECTURE zxw_fa_vhdl OF zxw_fa_vhdl IS
BEGIN
	s <= x XOR y  XOR cin;
	Cout <= (x AND y) OR ( Cin AND x) OR (Cin AND y);

END zxw_fa_vhdl;
