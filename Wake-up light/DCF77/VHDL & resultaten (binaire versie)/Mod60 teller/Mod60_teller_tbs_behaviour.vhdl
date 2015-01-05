-- Alex Oudsen, 4325494
-- Dit is de testbench voor simulatie op schaal
-- Verwachte respons is een count die iedere
-- opgaande klokflank van clk_in één optelt bij
-- de waarde van count, waarbij na 59 weer 0 komt
-- Bovendien wordt er tweemaal gesynchroniseerd;
-- eenmaal met ref = 23 en eenmaal met ref = 59
-- Ook wordt aan de uitgang een klok gegenereerd met
-- frequentie 1/60 van de frequentie van clk_in
-- Advies simulatietijd: 80 ms.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of mod60_tel_tb is
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

	clk		<=	'1' after 0 ns,	-- Dit genereert een 100 kHz signaal
				'0' after 5 us  when clk /= '0' else '1' after 5 us;
	clk_in		<=	'1' after 0 ns,	-- Dit genereert een 1 kHz signaal
				'0' after 500 us  when clk_in /= '0' else '1' after 500 us;
	reset		<=	'1' after 0 ns, '0' after 600 us;
	sync_now	<= 	'0' after 0 ns, '1' after 5 ms, '0' after 5020 us,
				'1' after 10 ms, '0' after 10020 us;
	ref		<=	"010111" after 0 ns, "111011" after 6 ms;

	count60: mod60_teller port map(clk, clk_in, reset, sync_now, ref, count, h_clk);

end behaviour;
