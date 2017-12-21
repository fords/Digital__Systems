LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_6bit_reg_vhdl IS
	PORT( D		:	IN		STD_LOGIC_VECTOR(5 DOWNTO 0);
			Resetn, Clock, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(5 DOWNTO 0));
END zxw_6bit_reg_vhdl;

ARCHITECTURE Behavior OF zxw_6bit_reg_vhdl IS
	SIGNAL Count	:	STD_LOGIC_VECTOR(5 DOWNTO 0);
	BEGIN
		PROCESS(Resetn, Clock)
			BEGIN
-- Check if asynchronous Resetn is 0
			IF Resetn = '0' THEN
					Count <= "011111";
-- Check if rising edge
				ELSIF (Clock'EVENT AND Clock = '1') THEN
					IF LD_EN = '1' THEN
						Count <= D;
					ELSE
						Count <= Count;
					END IF;
				END IF;
			END PROCESS;
			Q <= Count;
END Behavior;