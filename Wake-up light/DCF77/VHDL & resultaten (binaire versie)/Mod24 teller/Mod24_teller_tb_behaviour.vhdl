-- Alex Oudsen, 4325494
-- Dit is simulatie met de 'echte' klok
-- Verwachte respons is weer een count die iedere
-- opgaande klokflank van clk_in één optelt bij
-- de waarde van count, waarbij na 23 weer 0 komt
-- Bovendien wordt er tweemaal gesynchroniseerd;
-- eenmaal met ref = 10 en eenmaal met ref = 23
-- Advies simulatietijd: 7500 sec.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_long of mod24_tel_tb is
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
	clk_in		<=	'1' after 0 ns,		-- Dit genereert een 1/3600 Hz signaal
				'0' after 3600 sec when clk_in /= '0' else '1' after 3600 sec;
	reset		<=	'1' after 0 ns, '0' after 2 sec;
	sync_now	<= 	'0' after 0 ns, '1' after 1000000 ms, '0' after 1000001 ms,
				'1' after 4000000 ms, '0' after 4000001 ms;
	ref		<=	"01010" after 0 ns, "10111" after 3000 sec;

	count24: mod24_teller port map(clk, clk_in, reset, sync_now, ref, count);

end behaviour_long;
