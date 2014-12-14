library ieee;
use ieee.std_logic_1164.all;

entity parity_check is
end entity parity_check;


architecture behavioural of parity_check is
component parity_check is
    port (start_xor:		in  std_logic;
		reset: in std_logic;
	  new_dcf:	in  std_logic_vector(58 downto 0);
	  sync_now:	out std_logic);
end component parity_check;


signal reset, start_xor,sync_now: std_logic;
signal new_dcf: std_logic_vector(58 downto 0);

begin

		reset	<= 	'1' after 0 ns,
							'0' after 50 ns;
		start_xor <= '0' after 0 ns;
		new_dcf <= '0000 0000 0000 0000 0000 1100110 1 001101 1 1100 1101 1000 1100 0101 01' after 

check: parity_check port map(start_xor, reset, new_dcf, sync_now);

end architecture behavioural;