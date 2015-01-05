-- Alex Oudsen, 4325494
-- Dit is simulatie met de 'echte' klok
-- Verwachte respons is weer een count die iedere
-- opgaande klokflank van clk_in één optelt bij
-- de waarde van count, waarbij na 59 weer 0 komt
-- Bovendien wordt er tweemaal gesynchroniseerd;
-- eenmaal met ref = 23 en eenmaal met ref = 59
-- Ook wordt aan de uitgang een klok gegenereerd met
-- frequentie 1/60 van de frequentie van clk_in
-- Advies simulatietijd: 50 sec.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_long of mod60_tel_tb is
	component mod60_teller is
 		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:    in  std_logic;
		      sync_now:	in  std_logic;
		      ref:	in  std_logic_vector(5 downto 0);
		      count:	out std_logic_vector(5 downto 0);
		      h_clk:	out std_logic);
	end component mod60_teller;

	signal clk, clk_in, h_clk, reset, sync_now: std_logic;
	signal ref, count: std_logic_vector(5 downto 0);

begin

	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	clk_in		<=	'1' after 0 ns,		-- Dit genereert een 1 Hz signaal
				'0' after 500 ms  when clk_in /= '0' else '1' after 500 ms;
	reset		<=	'1' after 0 ns, '0' after 2 sec;
	sync_now	<= 	'0' after 0 ns, '1' after 6000 ms, '0' after 6001 ms,
				'1' after 14000 ms, '0' after 14001 ms;
	ref		<=	"010111" after 0 ns, "111011" after 10 sec;

	count60: mod60_teller port map(clk, clk_in, reset, sync_now, ref, count, h_clk);

end behaviour_long;
