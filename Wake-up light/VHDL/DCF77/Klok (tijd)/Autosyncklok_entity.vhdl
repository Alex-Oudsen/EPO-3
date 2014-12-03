-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity autosyncklok is
    port (clk:		in  std_logic;
	  s_clk:	in  std_logic;
	  reset:	in  std_logic;
	  sync_now:	in  std_logic;
	  time_ref:	in  std_logic_vector(16 downto 0);
	  minutes:	out std_logic_vector(5 downto 0);
	  hours:	out std_logic_vector(4 downto 0));
end entity autosyncklok;