library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port(clk    		: in  std_logic;
             reset  			: in  std_logic;
             knoppen			: in  std_logic_vector(3 downto 0);
             wekker 			: out std_logic_vector(15 downto 0);
             menu_state : out std_logic_vector(2 downto 0));
end controller;


