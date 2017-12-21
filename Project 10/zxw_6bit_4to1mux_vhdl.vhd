library IEEE;
use IEEE.std_logic_1164.all;


entity zxw_6bit_4to1mux_vhdl is

 port(
                s       : in    std_logic_vector(1 downto 0);
                d0      : in    std_logic_vector(5 downto 0);
                d1      : in    std_logic_vector(5 downto 0);
                d2      : in    std_logic_vector(5 downto 0);
                d3      : in    std_logic_vector(5 downto 0);
                y       : out   std_logic_vector(5 downto 0)

        );

end zxw_6bit_4to1mux_vhdl;


architecture name of zxw_6bit_4to1mux_vhdl is

begin


  with s select y <= d0 when "00",
                     d1 when "01",
                     d2 when "10",
                     d3 when "11",
							"000000" when others;
end name;