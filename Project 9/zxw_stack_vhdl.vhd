library IEEE;
use IEEE.std_logic_1164.all;
USE work.zxw_package.all;

entity zxw_stack_vhdl is
PORT(

	mode  : in    std_logic_vector(1 downto 0);
	push  : in    std_logic_vector(3 downto 0);
	clk   : in    std_logic;
	output: out   std_logic_vector(3 downto 0)
);
end zxw_stack_vhdl;

ARCHITECTURE Structure OF zxw_stack_vhdl IS
	SIGNAL Aout,Bout,Cout,Dout : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL f0,f1,f2,f3         : STD_LOGIC_VECTOR(3 downto 0);
	COMPONENT zxw_4bit_mux4to1 IS
			port(  A,B,C,D: in std_logic_vector(3 downto 0);
             S: in std_logic_vector(1 downto 0);
             O: out std_logic_vector(3 downto 0));
	END COMPONENT zxw_4bit_mux4to1;
   
	BEGIN
	Areg	:	zxw_4bit_reg_vhdl	PORT MAP(f0, '1', Clk,
					'1', Aout);
	Breg	:	zxw_4bit_reg_vhdl	PORT MAP(f1, '1', Clk,
					'1', Bout);
	Creg	:	zxw_4bit_reg_vhdl	PORT MAP(f2, '1', Clk,
					'1', Cout);
	Dreg	:	zxw_4bit_reg_vhdl	PORT MAP(f3, '1', Clk,
					'1', Dout);
					
	output <= Aout; 
	stage0: zxw_4bit_mux4to1 PORT MAP (Aout,push,Bout,"0000",mode,f0 );
	stage1: zxw_4bit_mux4to1 PORT MAP (Bout,Aout,Cout,"0000",mode,f1 );
	stage2: zxw_4bit_mux4to1 PORT MAP (Cout,Bout,Dout,"0000",mode,f2 );
	stage3: zxw_4bit_mux4to1 PORT MAP (Dout,Cout,"0000","0000",mode,f3 );
	
	

End structure;

--input [1:0]mode;
 --input [3:0]push;
 --input clk;
 --output [3:0]pop;
 
 --zxw_4mux4to1_v stage0(mode, A, B, C, "0000", f);
-- zxw_4mux4to1_v stage1(mode, A, push, C, "0000", f);
 --zxw_4mux4to1_v stage2(mode, A, B, C, "0000", f);
 --zxw_4mux4to1_v stage3(mode, A, B, "0000", "0000", f);