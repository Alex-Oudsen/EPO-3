library ieee;
use ieee.std_logic_1164.all;

entity geluid is
	port(clk			: in  std_logic;
	     reset			: in  std_logic;	
	     ready			: in  std_logic;
	     geluid_signaal			: in  std_logic;
	     menu			: in  std_logic_vector(2 downto 0);
	     lcd_geluid 			: out std_logic_vector(1 downto 0));
end geluid;


