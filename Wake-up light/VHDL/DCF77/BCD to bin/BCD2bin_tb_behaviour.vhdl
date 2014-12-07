-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture behavioural of bcd2bin_tb is
	component bcd2bin is
 		port (clk:	in  std_logic;
		      reset:    in  std_logic;
		      start:	in  std_logic;
		      bcd_in:	in  std_logic_vector(7 downto 0);
		      bin_out:	out std_logic_vector(6 downto 0);
		      ready:	out std_logic);
	end component bcd2bin;

signal clk, reset, start, ready: std_logic;
signal bcd_in: std_logic_vector(7 downto 0);
signal bin_out: std_logic_vector(6 downto 0);

begin

	clk	<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
			'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	reset	<=	'1' after 0 ns, '0' after 50000 ns;
	start	<=	'0' after 0 ns, '1' after 120 us, '0' after 140 us,
			'1' after 200 us, '0' after 220 us;
	bcd_in	<=	"01011001" after 0 ns, "00100011" after 150 us;

convert: bcd2bin port map(clk, reset, start, bcd_in, bin_out, ready);

end architecture behavioural;