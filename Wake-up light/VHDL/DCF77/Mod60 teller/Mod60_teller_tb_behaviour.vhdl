-- Alex Oudsen, 4325494
-- De teller wordt gebruikt voor zowel seconden als minuten;
-- daarom is clk_in niet altijd hetzelfde, maar kan deze twee
-- verschillende frequenties hebben: voor de simulatie wordt
-- een frequentie van 1 Hz gebruikt als clk_in signaal

library ieee;
use ieee.std_logic_1164.all;

architecture behavioural of mod60_teller_tb is
	component mod60_teller is
 		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:    in  std_logic;
		      sync_now:	in  std_logic;
		      ref:	in  std_logic_vector(5 downto 0);
		      t_clk:	out std_logic;
		      count:	out std_logic_vector(5 downto 0));
	end component mod60_teller;

signal clk, clk_in, reset, sync_now, t_clk: std_logic;
signal ref, count: std_logic_vector(5 downto 0);

begin

	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	clk_in		<=	'1' after 0 ns,		-- Dit genereert een 1 Hz signaal
				'0' after 500 ms  when clk_in /= '0' else '1' after 500 ms;
	reset		<=	'1' after 0 ns, '0' after 2 sec;
	sync_now	<= 	'0' after 0 ns, '1' after 5000 ms, '0' after 5001 ms,
				'1' after 10000 ms, '0' after 10001 ms;
	ref		<=	"001010" after 0 ns, "101101" after 6 sec;

count60: mod60_teller port map(clk, clk_in, reset, sync_now, ref, t_clk, count);

end architecture behavioural;