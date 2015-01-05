-- Alex Oudsen, 4325494
-- Dit is de simulatie met de 'echte' klok
-- De verwachte respons blijft een korte puls
-- rising direct na iedere rising edge van het
-- ingangssignaal en een korte puls falling direct
-- na iedere falling edge van het ingangssignaal
-- Advies simulatietijd: 5 sec.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_long of edge_detect_tb is
	component edge_detector is
 		port (clk:		in  std_logic;
		      reset:		in  std_logic;
		      input:    	in  std_logic;
		      rising:		out std_logic;
		      falling:		out std_logic);
	end component edge_detector;

signal clk, reset, input, rising, falling: std_logic;

begin

	clk	<=	'1' after 0 ns, -- Dit genereert een 32 kHz signaal
			'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	reset	<=	'1' after 0 ns, '0' after 50000 ns;
	input	<=	'0' after 0 ms, '1' after 400 ms, '0' after 500 ms,
			'1' after 1500 ms, '0' after 1600 ms,
			'1' after 2500 ms, '0' after 2600 ms,
			'1' after 3500 ms, '0' after 3600 ms,
			'1' after 4500 ms, '0' after 4600 ms;

	detect: edge_detector port map(clk, reset, input, rising, falling);

end behaviour_long;
