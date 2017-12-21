LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY zxw_8bit_adder_vhdl IS
	PORT( Cin	:	IN		STD_LOGIC;
			X, Y	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Cout	:	OUT	STD_LOGIC);
END zxw_8bit_adder_vhdl;

ARCHITECTURE Behavior OF zxw_8bit_adder_vhdl IS
	SIGNAL Sum : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		Sum <= ('0' & X) + ('0' & Y) + Cin;
		S <= Sum(7 DOWNTO 0);
		Cout <= Sum(8);
END Behavior;