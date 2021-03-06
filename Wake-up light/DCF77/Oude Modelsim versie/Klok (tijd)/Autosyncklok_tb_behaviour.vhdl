-- Alex Oudsen, 4325494
-- De klok wordt getest met de signalen die er
-- uiteindelijk ook aan zullen worden aangeboden

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of autosyncklok_tb is
	component autosyncklok is
 		port (clk:	in  std_logic;
		      s_clk:	in  std_logic;
		      reset:    in  std_logic;
		      sync_now:	in  std_logic;
		      min_ref:	in  std_logic_vector(5 downto 0);
		      hr_ref:	in  std_logic_vector(4 downto 0);
		      minutes:	out std_logic_vector(5 downto 0);
		      hours:	out std_logic_vector(4 downto 0));
	end component autosyncklok;

signal clk, s_clk, reset, sync_now: std_logic;
signal minutes, min_ref: std_logic_vector(5 downto 0);
signal hours, hr_ref: std_logic_vector(4 downto 0);

begin

	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	s_clk		<=	'1' after 0 ns,		-- Dit genereert een 1 Hz signaal
				'0' after 500 ms  when s_clk /= '0' else '1' after 500 ms;
	reset		<=	'1' after 0 ns, '0' after 2 sec;
	sync_now	<= 	'0' after 0 ns, '1' after 5000 ms, '0' after 5001 ms,
				'1' after 10000 ms, '0' after 10001 ms;
	min_ref		<=	"001010" after 0 ns, "101101" after 6 sec;
	hr_ref		<=	"01010" after 0 ns, "10111" after 6 sec;

klok: autosyncklok port map(clk, s_clk, reset, sync_now, min_ref, hr_ref, minutes, hours);

end behaviour;