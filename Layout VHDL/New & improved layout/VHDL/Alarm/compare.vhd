library ieee;
use ieee.std_logic_1164.all;

entity compare is
	port(clk       		 : in  std_logic;
             reset     			: in  std_logic;
	     start_alarm  : in  std_logic;
             stop_alarm			: in  std_logic;
             tijd_uur_l 		: in  std_logic_vector(3 downto 0);
	     tijd_uur_h 		: in	std_logic_vector(1 downto 0);
             tijd_min_l 		: in  std_logic_vector(3 downto 0);
	     tijd_min_h 		: in	std_logic_vector(2 downto 0);
             wekker_uur_l	: in  std_logic_vector(3 downto 0);
	     wekker_uur_h	: in  std_logic_vector(1 downto 0);
             wekker_min_l	: in  std_logic_vector(3 downto 0);
	     wekker_min_h	: in  std_logic_vector(2 downto 0);
             geluid    			: out std_logic;
             licht     			: out std_logic);
end compare;


