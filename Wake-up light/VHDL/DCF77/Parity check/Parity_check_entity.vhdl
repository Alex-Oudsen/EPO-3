-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- parity check controleert of de bits uit het
-- dcf signaal 'kloppen' (even of oneven aantal 1-en)

library ieee;
use ieee.std_logic_1164.all;

entity parity_check is
    port (clk:	   	in  std_logic;
	  reset:    	in  std_logic;
	  start_xor:	in  std_logic;
	  minuten:  	in  std_logic_vector(6 downto 0);
	  uren:     	in  std_logic_vector(5 downto 0);
	  weekdag:  	in  std_logic_vector(2 downto 0);
	  dagen:   	in  std_logic_vector(5 downto 0);
	  maanden:  	in  std_logic_vector(4 downto 0);
	  jaren:    	in  std_logic_vector(7 downto 0);
	  parity_bits:	in  std_logic_vector(2 downto 0);
	  sync_now:	out std_logic);
end parity_check;