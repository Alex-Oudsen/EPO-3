library ieee;
use ieee.std_logic_1164.all;

entity datum is	
	port(clk		: in  std_logic;
	     reset		: in  std_logic;
	     ready		: in  std_logic;
	     date_ready : in  std_logic;
	     dagvdweek		: in  std_logic_vector(2 downto 0);
	     dagvdmaand : in  std_logic_vector(5 downto 0);
	     maand		: in  std_logic_vector(4 downto 0);
	     jaar 		: in  std_logic_vector(7 downto 0);
	     position		: out std_logic_vector(2 downto 0);
	     lcd_datum		: out std_logic_vector(4 downto 0));
end datum; 


