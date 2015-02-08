library ieee;
use ieee.std_logic_1164.all;

entity klokdeler is
	port(clk    	: in  std_logic;
        	    reset  	: in  std_logic;
             clk_1hz	: out std_logic);
end klokdeler;


