library IEEE;
use IEEE.std_logic_1164.ALL;

entity buff is
   port(clk			:in		std_logic;
        reset		:in		std_logic;
		knoppen_in		:in		std_logic_vector(3 downto 0);
		knoppen_out		:out	std_logic_vector(3 downto 0));
end buff;
