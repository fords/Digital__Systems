LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY zxw_fa_vhdl_tb IS
END zxw_fa_vhdl_tb;

ARCHITECTURE behavior OF zxw_fa_vhdl_tb IS

	COMPONENT zxw_fa_vhdl
		PORT ( Cin, x, y	: IN STD_LOGIC ;
				s, Cout 	: OUT STD_LOGIC ) ;
	END COMPONENT ;

-- Declare signals to assign values to stimuli and to observe
	SIGNAL x_tb, y_tb, Cin_tb, s_tb, Cout_tb : std_logic;

BEGIN
-- Create an instance of the circuit to be verified
uut: zxw_fa_vhdl PORT MAP (x => x_tb, y => y_tb, Cin => Cin_tb, s => s_tb, Cout => Cout_tb);

-- Define a process to apply input stimulus and test outputs
tb : PROCESS

	CONSTANT period : time := 20 ns;

	BEGIN

-- Apply every possible input combination

-- apply input combination 000 and check outputs
		x_tb <= '0' ;
		y_tb <= '0' ;
		Cin_tb <= '0';
		WAIT FOR period;
		ASSERT ((s_tb = '0') AND (Cout_tb = '0'))
		REPORT "Test failed FOR input combination 000" SEVERITY error;

		x_tb <= '0'; --apply input combination 001 and
		y_tb <= '0'; --check outputs
		Cin_tb <= '1';
		WAIT FOR period;
		ASSERT ((s_tb = '1') AND (Cout_tb = '0'))
		REPORT "Test failed FOR input combination 001" SEVERITY error;

		x_tb <= '0'; --apply input combination 010 and
		y_tb <= '1'; --check outputs
		Cin_tb <= '0';
		WAIT FOR period;
		ASSERT ((s_tb = '1') AND (Cout_tb = '0'))
		REPORT "Test failed FOR input combination 010" SEVERITY error;

		x_tb <= '0'; --apply input combination 011 and
		y_tb <= '1'; --check outputs
		Cin_tb <= '1';
		WAIT FOR period;
		ASSERT ((s_tb = '0') AND (Cout_tb = '1'))
		REPORT "Test failed FOR input combination 011" SEVERITY error;

		x_tb <= '1'; --apply input combination 100 and
		y_tb <= '0'; --check outputs
		Cin_tb <= '0';
		WAIT FOR period;
		ASSERT ((s_tb = '1') AND (Cout_tb = '0'))
		REPORT "Test failed FOR input combination 100" SEVERITY error;

		x_tb <= '1'; --apply input combination 101 and
		y_tb <= '0'; --check outputs
		Cin_tb <= '1';
		WAIT FOR period;
		ASSERT ((s_tb = '0') AND (Cout_tb = '1'))
		REPORT "Test failed FOR input combination 101" SEVERITY error;

		x_tb <= '1'; --apply input combination 110 and
		y_tb <= '1'; --check outputs
		Cin_tb <= '0';
		WAIT FOR period;
		ASSERT ((s_tb = '0') AND (Cout_tb = '1'))
		REPORT "Test failed FOR input combination 110" SEVERITY error;

		x_tb <= '1'; --apply input combination 111 and
		y_tb <= '1'; --check outputs
		Cin_tb <= '1';
		WAIT FOR period;
		ASSERT ((s_tb = '1') AND (Cout_tb = '1'))
		REPORT "Test failed FOR input combination 111" SEVERITY error;

		WAIT; -- indefinitely suspend the process
	END PROCESS;
END;
