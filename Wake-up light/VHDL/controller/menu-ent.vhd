library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

entity menu is
   port(clk				:in    std_logic;
        reset		:in    std_logic;
		knoppen		:in    std_logic_vector(3 downto 0);
		wekdata		:in	   std_logic_vector(13 downto 0);
		enable			:out   std_logic;
		wekker			:out		 std_logic_vector(13 downto 0);
		menu_signal			:out		 std_logic_vector(2 downto 0));
end menu;





