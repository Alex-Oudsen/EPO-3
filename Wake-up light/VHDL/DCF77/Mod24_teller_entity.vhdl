library ieee;
use ieee.std_logic_1164.all;

entity mod24_teller is
    port (clk:	    in  std_logic;
	  sync_now: in  std_logic;
	  ref:	    in  std_logic_vector(4 downto 0);
	  count:    out std_logic_vector(4 downto 0));
end entity mod24_teller;