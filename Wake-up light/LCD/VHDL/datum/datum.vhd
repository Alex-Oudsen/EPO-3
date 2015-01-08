library ieee;
use ieee.std_logic_1164.all;

entity datum is	
	port(
		clk			: in std_logic;
		reset			: in std_logic;
		ready			: IN std_logic;
		tijd_uren 			: IN std_logic_vector (4 downto 0); 
		dagvdweek			: IN std_logic_vector (2 downto 0);
		dagvdmaand 			: IN std_logic_vector (5 downto 0);
		maand			: IN std_logic_vector (4 downto 0);
		jaar 			: IN std_logic_vector (7 downto 0);
		
		x			: out std_logic_vector (6 downto 0);
		y			: out std_logic_vector (5 downto 0);
		c			: out std_logic_vector (6 downto 0)
		);
end datum; 





