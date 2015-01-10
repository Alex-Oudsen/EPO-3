-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity dcf77_bcd is
    port (clk:	    	  in  std_logic;
	  reset:     	in  std_logic;
	  dcf_in:   	 in  std_logic;
	  dcf_led:   	out std_logic;
	  clk_1hz:  	 out std_logic;
	  minutes:  	 out std_logic_vector(6 downto 0);
	  hours:     	out std_logic_vector(5 downto 0);
	  weekday:   	out std_logic_vector(2 downto 0);
	  day:	      out std_logic_vector(5 downto 0);
	  month:    	 out std_logic_vector(4 downto 0);
	  year:	      out std_logic_vector(7 downto 0);
	  date_ready:	out std_logic);
end dcf77_bcd;


