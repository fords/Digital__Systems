LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY zxw_8bit_AAadder_vhdl IS
	PORT(	X, Y	:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END zxw_8bit_AAadder_vhdl;

ARCHITECTURE Behavior OF zxw_8bit_AAadder_vhdl IS
	BEGIN
		S <= X + Y;
END Behavior;