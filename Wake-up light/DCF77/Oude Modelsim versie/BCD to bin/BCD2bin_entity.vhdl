-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity bcd2bin is
    port (clk:		in  std_logic;
	  reset:	in  std_logic;
	  start:	in  std_logic;
	  bcd_in:	in  std_logic_vector(7 downto 0);
	  bin_out:	out std_logic_vector(6 downto 0);
	  ready:	out std_logic);
end bcd2bin;