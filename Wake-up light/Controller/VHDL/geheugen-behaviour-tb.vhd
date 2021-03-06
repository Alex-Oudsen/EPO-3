library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geheugen_tb is
component geheugen is
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        enable :in    std_logic;
        wek_in :in    std_logic_vector(13 downto 0);
        wek_out:out   std_logic_vector(13 downto 0));
end component geheugen;

signal  clk,enable,reset	:	std_logic;
signal  wek_in,wek_out		:   	std_logic_vector(13 downto 0);


begin
	clk 	<=	'0' after 0 ns,
			'1' after 20 ns  when clk /= '1' else '0' after 20 ns;

	reset	<=	'1' after 0 ns,
			'0' after 85 ns;


	enable <=	'0' after 0 ns, 
			'1' after 150 ns,
			'0' after 290 ns,
			'1' after 590 ns;

	wek_in <= 	"00000000000001" after 0 ns,
			"00000000000010" after 70 ns,
			"00000000000011" after 110 ns,
			"00000000000100" after 150 ns,
			"00000000000101" after 190 ns,
			"00000000000110" after 230 ns,
			"00000000000111" after 270 ns,
			"00000000001000" after 310 ns,
			"00000000001001" after 350 ns,
			"00000000001010" after 390 ns,
			"00000000001011" after 430 ns,
			"00000000001100" after 470 ns,
			"00000000001101" after 510 ns,
			"00000000001110" after 550 ns,
			"00000000001111" after 590 ns,
			"00000000010000" after 630 ns,
			"00000000010001" after 680 ns,
			"00000000010010" after 735 ns,
			"00000000010111" after 779 ns;

	geheugen_pm: geheugen port map(clk,reset,enable,wek_in,wek_out);
end behaviour;
