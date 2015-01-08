--blame Kevin, 4287592


library IEEE;
use IEEE.std_logic_1164.ALL;

entity top_top_entity is
	port (	clk			:	in	std_logic;
			reset		:	in	std_logic;
			knoppen		:	in	std_logic_vector (4 downto 0);
			dcf			:	in	std_logic;
			data_out	:	out	std_logic_vector(6 downto 0);
        	clk_out   	:	out	std_logic;
end top_top_entity;
