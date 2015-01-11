-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity datefix is
	port(clk	:in  std_logic;
	     reset	:in  std_logic;
	     date_ready	:in  std_logic;
	     jaar	:in  std_logic_vector(7 downto 0);
	     maand	:in  std_logic_vector(4 downto 0);
	     dag	:in  std_logic_vector(5 downto 0);
	     weekdag	:in  std_logic_vector(2 downto 0);
	     datum	:out std_logic_vector(21 downto 0));
end datefix;
