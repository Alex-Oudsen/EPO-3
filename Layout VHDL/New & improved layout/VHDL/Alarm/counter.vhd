library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port(clk   	: in  std_logic;
	     reset 	: in  std_logic;
             sec   	: in  std_logic;
	     licht 	: in  std_logic;
             length	: out std_logic_vector(5 downto 0));
end counter;


