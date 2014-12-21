-- Alex Oudsen, 4325494
-- Dit is de testbench voor simulatie op schaal
-- Verwachte respons is  een klok met frequentie
-- 1/60 van de frequentie van clk_in
-- Bovendien wordt er tweemaal gesynchroniseerd;
-- eenmaal met ref = 23 en eenmaal met ref = 59
-- Advies simulatietijd: 80 ms.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_clk of mod60_tel_tb is
	component mod60_clk is
 		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:    in  std_logic;
		      sync_now:	in  std_logic;
		      ref:	in  std_logic_vector(5 downto 0);
		      m_clk:	out std_logic);
	end component mod60_clk;

	signal clk, clk_in, m_clk, reset, sync_now: std_logic;
	signal ref: std_logic_vector(5 downto 0);

begin

	clk		<=	'1' after 0 ns,	-- Dit genereert een 100 kHz signaal
				'0' after 5 us  when clk /= '0' else '1' after 5 us;
	clk_in		<=	'1' after 0 ns,	-- Dit genereert een 1 kHz signaal
				'0' after 500 us  when clk_in /= '0' else '1' after 500 us;
	reset		<=	'1' after 0 ns, '0' after 600 us;
	sync_now	<= 	'0' after 0 ns, '1' after 5 ms, '0' after 5020 us,
				'1' after 10 ms, '0' after 10020 us;
	ref		<=	"010111" after 0 ns, "111011" after 6 ms;

	count60: mod60_clk port map(clk, clk_in, reset, sync_now, ref, m_clk);

end behaviour_clk;
