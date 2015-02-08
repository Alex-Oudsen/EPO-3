library ieee;
use ieee.std_logic_1164.all;

entity dcf_counter is
	port(clk		: in  std_logic;
             reset			: in  std_logic;
             dcf_rise			: in  std_logic;
             dcf_fall			: in  std_logic;
             count			: out std_logic_vector(15 downto 0);
	     new_bit		: out std_logic);
end dcf_counter;


