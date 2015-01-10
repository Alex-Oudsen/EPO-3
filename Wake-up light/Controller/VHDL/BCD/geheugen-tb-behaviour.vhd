-- Rens Hamburger 4292936
-- Testbench voor de 16 bit geheugen element met een positief enable signaal
library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geheugen_tb is
component geheugen is
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        enable :in    std_logic;
        wek_in :in    std_logic_vector(15 downto 0);
        wek_out:out   std_logic_vector(15 downto 0));
end component geheugen;

signal  clk,enable,reset	:	std_logic;
signal  wek_in,wek_out		:   	std_logic_vector(15 downto 0);


begin
	clk 	<=	'0' after 0 ns,
			'1' after 20 ns  when clk /= '1' else '0' after 20 ns;

	reset	<=	'1' after 0 ns,
			'0' after 85 ns;


	enable <=	'0' after 0 ns, 
			'1' after 150 ns,
			'0' after 290 ns,
			'1' after 590 ns;

	wek_in <= 	"0000000000000001" after 0 ns,
			"0000000000000010" after 70 ns,
			"0000000000000011" after 110 ns,
			"0000000000000100" after 150 ns,
			"0000000000000101" after 190 ns,
			"0000000000000110" after 230 ns,
			"0000000000000111" after 270 ns,
			"0000000000001000" after 310 ns,
			"0000000000001001" after 350 ns,
			"0000000000001010" after 390 ns,
			"0000000000001011" after 430 ns,
			"0000000000001100" after 470 ns,
			"0000000000001101" after 510 ns,
			"0000000000001110" after 550 ns,
			"0000000000001111" after 590 ns,
			"0000000000010000" after 630 ns,
			"0000000000010001" after 680 ns,
			"0000000000010010" after 735 ns,
			"0000000000010111" after 779 ns;

	geheugen_pm: geheugen port map(clk,reset,enable,wek_in,wek_out);
end behaviour;
