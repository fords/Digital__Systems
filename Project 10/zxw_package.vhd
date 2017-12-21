LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

PACKAGE zxw_package IS


	component zxw_uSel_vhdl 
		PORT ( usel1,usel0, Cout : IN STD_LOGIC;
			    uM1, uM0 : OUT STD_LOGIC
	
		);
	END component;
	
	
	component zxw_incre_vhdl 
		PORT
			(
			datab		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			result		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
		);
	END component;

	component zxw_6bit_reg_vhdl 
		PORT( D		:	IN		STD_LOGIC_VECTOR(5 DOWNTO 0);
			Resetn, Clock, LD_EN	:	IN STD_LOGIC;
			Q		:	OUT	STD_LOGIC_VECTOR(5 DOWNTO 0));
	END component;


	component zxw_rom5_vhdl 
		PORT( address		:	IN		STD_LOGIC_VECTOR(5 DOWNTO 0);
			Clock:	IN STD_LOGIC;
			q		:	OUT	STD_LOGIC_VECTOR(27 DOWNTO 0));
	END component;
	
	component zxw_6bit_4to1mux_vhdl

			port(
                s       : in    std_logic_vector(1 downto 0);
                d0      : in    std_logic_vector(5 downto 0);
                d1      : in    std_logic_vector(5 downto 0);
                d2      : in    std_logic_vector(5 downto 0);
                d3      : in    std_logic_vector(5 downto 0);
                y       : out   std_logic_vector(5 downto 0)
        );
	END component;

END zxw_package ;
