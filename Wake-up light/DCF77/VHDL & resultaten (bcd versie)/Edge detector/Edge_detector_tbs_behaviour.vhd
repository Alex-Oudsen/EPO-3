-- Alex Oudsen, 4325494
-- Dit is de testbench voor simulatie op schaal
-- De verwachte respons geeft een korte puls rising
-- direct na iedere rising edge van het ingangssignaal
-- en een korte puls falling direct na iedere falling
-- edge van het ingangssignaal
-- Advies simulatietijd: 50 ms.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of edge_detect_tb is
	component edge_detector is
 		port (clk:		in  std_logic;
		      reset:		in  std_logic;
		      input:    	in  std_logic;
		      rising:		out std_logic;
		      falling:		out std_logic);
	end component edge_detector;

signal clk, reset, input, rising, falling: std_logic;

begin

	clk	<=	'1' after 0 ns, -- Dit genereert een signaal van iets meer dan 3.2 MHz
			'0' after 156 ns  when clk /= '0' else '1' after 156 ns;
	reset	<=	'1' after 0 ns, '0' after 500 ns;
	input	<=	'0' after 0 ms, '1' after 4 ms, '0' after 5 ms,
			'1' after 15 ms, '0' after 16 ms,
			'1' after 25 ms, '0' after 26 ms,
			'1' after 35 ms, '0' after 36 ms,
			'1' after 45 ms, '0' after 46 ms;

	detect: edge_detector port map(clk, reset, input, rising, falling);

end behaviour;
