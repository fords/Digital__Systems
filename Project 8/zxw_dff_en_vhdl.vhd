LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_dff_en_vhdl	IS
	PORT(Din, Clock, LD_EN	:	IN STD_LOGIC;
			Q_out	:	OUT STD_LOGIC);
END zxw_dff_en_vhdl;

ARCHITECTURE Behavioral OF zxw_dff_en_vhdl IS
	SIGNAL Q_int	:	STD_LOGIC;
	BEGIN
		PROCESS(Clock)
		BEGIN
			IF Clock'Event AND Clock='1' THEN
				IF LD_EN = '1' THEN
					Q_int <= Din;
				ELSE
					Q_int <= Q_int;
				END IF;
			END IF;
		END PROCESS;
		Q_out <= Q_int;
END Behavioral;
