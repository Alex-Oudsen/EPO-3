-- Alex Oudsen, 4325494
-- De teller wordt op schaal getest, omdat anders met
-- wel heel erg lange simulatietijden gewerkt moet worden;
-- In plaats van 1/3600 Hz wordt een clk_in van 1 Hz gebruikt

library ieee;
use ieee.std_logic_1164.all;

architecture behavioural of mod24_teller_tb is
	component mod24_teller is
 		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:    in  std_logic;
		      sync_now:	in  std_logic;
		      ref:	in  std_logic_vector(4 downto 0);
		      count:	out std_logic_vector(4 downto 0));
	end component mod24_teller;

signal clk, clk_in, reset, sync_now: std_logic;
signal ref, count: std_logic_vector(4 downto 0);

begin

	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	clk_in		<=	'1' after 0 ns,		-- Dit genereert een 1 Hz signaal
				'0' after 500 ms  when clk_in /= '0' else '1' after 500 ms;
	reset		<=	'1' after 0 ns, '0' after 2 sec;
	sync_now	<= 	'0' after 0 ns, '1' after 5000 ms, '0' after 5001 ms,
				'1' after 10000 ms, '0' after 10001 ms;
	ref		<=	"01010" after 0 ns, "10111" after 6 sec;

count24: mod24_teller port map(clk, clk_in, reset, sync_now, ref, count);

end architecture behavioural;