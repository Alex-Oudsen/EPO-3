library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of buff_tb is
component buff is
	port(clk			:in		std_logic;
        reset		:in		std_logic;
		knoppen		:in		std_logic_vector(3 downto 0);
		knopjes		:out	std_logic_vector(3 downto 0));
end component buff;

signal  clk,enable,reset		:	std_logic;
signal  knoppen,knoppjes		:   	std_logic_vector(3 downto 0);


begin
	clk 	<=	'0' after 0 ns,
			'1' after 20 ns  when clk /= '1' else '0' after 20 ns;

	reset	<=	'1' after 0 ns,
			'0' after 85 ns;

	knoppen <= 	"0000" after 0 ns,
				"1111" after 100 ns,
				"0000" after 150 ns,
				"1000" after 190 ns,
				"0000" after 240 ns,
				"0001" after 290 ns;

	buff_pm: buff port map(clk,reset,knoppen,knoppjes);
end behaviour;
