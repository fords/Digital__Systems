LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY zxw_8bit_upcnt_vhdl IS
	PORT( D		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetn, Clock	:	IN STD_LOGIC;
			Cnt_EN, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END zxw_8bit_upcnt_vhdl;

ARCHITECTURE Behavior OF zxw_8bit_upcnt_vhdl IS
	SIGNAL Count : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		PROCESS(Resetn, Clock)
			BEGIN
-- Check to see if Resetn is 0
				IF Resetn = '0' THEN
					Count <= "00000000";
-- Check to see if rising edge => count or load
				ELSIF (Clock'EVENT AND Clock = '1') THEN
					IF (Cnt_EN = '0' AND LD_EN = '1') THEN
						Count <= D;
					ELSIF (Cnt_EN = '1' AND LD_EN = '0') THEN
						Count <= Count + 1;
					ELSE
						Count <= Count;
					END IF;
				END IF;
			END PROCESS;
		Q <= Count;
END Behavior;