-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of dcf_gen_tb is
	component dcf_gen is
 		port (clk50mhz:	in  std_logic;
		      res:    	in  std_logic;
		      dcf:  	out std_logic);
	end component dcf_gen;

signal clk, reset, dcf: std_logic;

begin
	clk	<=	'1' after 0 ns,		-- Dit genereert een 50 MHz signaal
			'0' after 10 ns  when clk /= '0' else '1' after 10 ns;
	reset	<=	'1' after 0 ns, '0' after 25 ns;

	gen: dcf_gen port map(clk, reset, dcf);

end behaviour;