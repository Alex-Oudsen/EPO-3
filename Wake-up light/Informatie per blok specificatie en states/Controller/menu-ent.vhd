library IEEE;
use IEEE.std_logic_1164.ALL;

entity menu is
   port(clk			:in    std_logic;
        reset		:in    std_logic;
		knoppen		:in    std_logic_vector(3 downto 0);
		tijd		:in    std_logic_vector(10 downto 0);
		wekdata		:in	   std_logic_vector(13 downto 0);
		enable		:out   std_logic_vector;
		wekker		:out   std_logic_vector(13 downto 0);
end menu;


