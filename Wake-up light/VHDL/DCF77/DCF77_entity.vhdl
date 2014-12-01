library ieee;
use ieee.std_logic_1164.all;

entity dcf77 is
    port (clk:	    in  std_logic;
	  reset:    in  std_logic;
	  dcf_in:   in  std_logic;
	  dcf_led:  out std_logic;
	  clk_1hz:  out std_logic;
	  minutes:  out std_logic_vector(5 downto 0);
	  hours:    out std_logic_vector(4 downto 0));
end entity dcf77;