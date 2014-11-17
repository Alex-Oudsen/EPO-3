library ieee;
use ieee.std_logic_1164.all;

entity alu is
	  port (clk : in  std_logic;
		a   : in  std_logic_vector (3 downto 0);
		b   : in  std_logic_vector (3 downto 0);
		f   : in  std_logic_vector (2 downto 0);
		r   : out std_logic_vector (3 downto 0);
		c   : out std_logic);
end entity alu;

