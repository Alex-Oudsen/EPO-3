-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of klokdeler_tb is
	component klokdeler is
 		port (clk:	in  std_logic;
		      reset:    in  std_logic;
		      clk_1hz:  out std_logic);
	end component klokdeler;

signal clk, reset, clk_1hz: std_logic;

begin
	clk	<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
			'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	reset	<=	'1' after 0 ns, '0' after 50000 ns;

divide: klokdeler port map(clk, reset, clk_1hz);

end behaviour;