library ieee;
use ieee.std_logic_1164.all;

entity tijd is
	port(clk		: in  std_logic;
             reset			: in  std_logic;
             ready			: in  std_logic;
	     hz_sig		: in  std_logic;
	     uren		: in  std_logic_vector(5 downto 0);
	     minuten		: in  std_logic_vector(6 downto 0);
	     position		: out std_logic_vector(2 downto 0);
             lcd_tijd			: out std_logic_vector(3 downto 0));
end tijd;


