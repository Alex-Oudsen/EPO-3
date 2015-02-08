library ieee;
use ieee.std_logic_1164.all;

entity menu is
	port(clk			: in  std_logic;
             reset				: in  std_logic;
	     knoppen			: in  std_logic_vector(3 downto 0);
	     wekdata			: in  std_logic_vector(15 downto 0);
	     wekker			: out std_logic_vector(15 downto 0);
	     menu_signal			: out std_logic_vector(2 downto 0);
	     enable			: out std_logic);
end menu;


