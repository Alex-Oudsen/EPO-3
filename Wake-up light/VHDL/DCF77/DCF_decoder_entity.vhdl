library ieee;
use ieee.std_logic_1164.all;

entity dcf_decoder is
    port (clk:	    in  std_logic;
	  dcf_in:   in  std_logic;
	  dcf_led:  out std_logic;
	  sync_now: out std_logic;
	  time_ref: out std_logic_vector(16 downto 0));
end entity dcf_decoder;