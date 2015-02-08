library ieee;
use ieee.std_logic_1164.all;

entity ausy_klok_bcd is
    port (clk:			in  std_logic;
	  s_clk:		in  std_logic;
	  reset:		in  std_logic;
	  sync_now:		in  std_logic;
	  min_ref:		in  std_logic_vector(6 downto 0);
	  hr_ref:		in  std_logic_vector(5 downto 0);
	  minutes:		out std_logic_vector(6 downto 0);
	  hours:		out std_logic_vector(5 downto 0));
end ausy_klok_bcd;


