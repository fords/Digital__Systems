LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY zxw_uSel_vhdl IS
	PORT ( usel1,usel0, Cout : IN STD_LOGIC;
			 uM1, uM0 : OUT STD_LOGIC
	
	);
END zxw_uSel_vhdl;

ARCHITECTURE Behavior OF zxw_uSel_vhdl IS

BEGIN
	PROCESS(usel1,usel0, Cout)
		BEGIN
		if(usel1 ='0' AND usel0= '0')THEN
			uM1 <= '0';
			uM0 <= '0';
		ELSIF	(usel1= '0' AND usel0= '1') THEN
			uM1 <='0'; 
			uM0  <= '1';
		ELSIF (usel1= '1' AND usel0 ='0') THEN
			if Cout = '0' THEN
				uM1 <='0';
				uM0 <= '0';
			elsif Cout='1' THEN
				uM1 <='1' ;
				uM0 <= '1';
			end if;
		ELSIF (usel1= '1' AND usel0 ='1') THEN
				uM1 <='1';
				uM0 <= '1';
		
		END if;	
	end proCESS;
END Behavior;	