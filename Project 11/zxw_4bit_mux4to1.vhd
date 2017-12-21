library IEEE;
use IEEE.std_logic_1164.all;



entity zxw_4bit_mux4to1 is 
port(  A,B,C,D: in std_logic_vector(3 downto 0);
             S: in std_logic_vector(1 downto 0);
             O: out std_logic_vector(3 downto 0));

end zxw_4bit_mux4to1;

Architecture behavioral of zxw_4bit_mux4to1 is
Begin

Process(S,A,B,C,D)
variable temp : std_logic_vector(3 downto 0);            
Begin

if(S="00")then
temp:=A;

elsif(S="01")then                   
temp:=B;

elsif(S="10")then
temp:=C;

else
temp:=D;
end if;                                

O<=temp;                        
end Process;
end behavioral; 
