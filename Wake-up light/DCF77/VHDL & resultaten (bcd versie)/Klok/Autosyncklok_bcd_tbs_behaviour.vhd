-- Alex Oudsen, 4325494
-- Dit is de testbench voor simulatie op schaal
-- De verwachte respons geeft twee synchronisatiemomenten,
-- namelijk 10:10 en 23:45, waaromheen de klok autonoom
-- verder zal tellen op de interne klok
-- Advies simulatietijd: 80 ms.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_bcd of autosyncclk_tb is
	component ausy_klok_bcd is
    		port (clk:	in  std_logic;
	 	      s_clk:	in  std_logic;
	  	      reset:	in  std_logic;
	  	      sync_now:	in  std_logic;
		      min_ref:	in  std_logic_vector(6 downto 0);
		      hr_ref:	in  std_logic_vector(5 downto 0);
		      minutes:	out std_logic_vector(6 downto 0);
		      hours:	out std_logic_vector(5 downto 0));
	end component ausy_klok_bcd;

	signal clk, s_clk, reset, sync_now: std_logic;
	signal minutes, min_ref: std_logic_vector(6 downto 0);
	signal hours, hr_ref: std_logic_vector(5 downto 0);

begin
	clk		<=	'1' after 0 ns,	-- Dit genereert een 100 kHz signaal
				'0' after 5 us  when clk /= '0' else '1' after 5 us;
	s_clk		<=	'1' after 0 ns,	-- Dit genereert een 1 kHz signaal
				'0' after 500 us  when s_clk /= '0' else '1' after 500 us;
	reset		<=	'1' after 0 ns, '0' after 600 us;
	sync_now	<= 	'0' after 0 ns, '1' after 5 ms, '0' after 5020 us,
				'1' after 10 ms, '0' after 10020 us;
	min_ref		<=	"0010000" after 0 ns, "1000101" after 6 ms;
	hr_ref		<=	"010000" after 0 ns, "100011" after 6 ms;

	klok: ausy_klok_bcd port map(clk, s_clk, reset, sync_now, min_ref, hr_ref, minutes, hours);

end behaviour_bcd;
