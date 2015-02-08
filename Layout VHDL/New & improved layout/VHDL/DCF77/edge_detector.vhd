library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
	port(clk    		: in  std_logic;
             reset  			: in  std_logic;
             input  			: in  std_logic;
             rising 			: out std_logic;
             falling			: out std_logic);
end edge_detector;


