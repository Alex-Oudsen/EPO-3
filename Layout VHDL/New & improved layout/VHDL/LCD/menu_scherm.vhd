library ieee;
use ieee.std_logic_1164.all;

entity menu_scherm is
	port(clk		: in  std_logic;
             reset   			: in  std_logic;
             ready   			: in  std_logic;
	     alarm		: in  std_logic;
             menu    			: in  std_logic_vector(2 downto 0);
             lcd_menu			: out std_logic_vector(2 downto 0));
end menu_scherm;


