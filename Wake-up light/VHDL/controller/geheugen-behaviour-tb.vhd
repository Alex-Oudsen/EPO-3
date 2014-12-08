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


	enable <='0' after 0 ns, 
			'1' after 155 ns,
			'0' after 365 ns,
			'1' after 665 ns;

	wek_in <= 	"00000000000000" after 0 ns,
				"00000000000010" after 65 ns,
				"00000000000011" after 105 ns,
				"00000000000100" after 145 ns,
				"00000000001000" after 385 ns,
				"00000000010000" after 705 ns,
				"00000000000000" after 745 ns,
				"00000000000000" after 765 ns;

	geheugen_pm: geheugen port map(clk,reset,enable,wek_in,wek_out);
end behaviour;















