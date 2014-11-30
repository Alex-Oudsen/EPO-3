library ieee;
use ieee.std_logic_1164.all;

entity mod60_teller is
    port (clk:	    in  std_logic;
	  sync_now: in  std_logic;
	  ref:	    in  std_logic_vector(5 downto 0);
	  t_clk:    out std_logic;
	  count:    out std_logic_vector(5 downto 0));
end entity mod60_teller;