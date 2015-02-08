library ieee;
use ieee.std_logic_1164.all;

entity geheugen is
	port(clk    	: in  std_logic;
             reset  	: in  std_logic;
             enable 	: in  std_logic;
             wek_in 	: in  std_logic_vector(15 downto 0);
             wek_out	: out std_logic_vector(15 downto 0));
end geheugen;


