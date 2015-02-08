library ieee;
use ieee.std_logic_1164.all;

entity wake_up is
	port (xi			: in  std_logic;
	      xo			: inout std_logic;
	      reset			: in  std_logic;
	      dcf_in			: in  std_logic;
	      snooze			: in  std_logic;
	      knoppen			: in  std_logic_vector(3 downto 0);
	      schakelaars			: in  std_logic_vector(2 downto 0);
	      debug_out			: out std_logic_vector(7 downto 0);
	      data_out			: out std_logic_vector(6 downto 0);
         	    clk_out  			: out std_logic;
	      buzzer			: out std_logic;
	      led_lamp			: out std_logic);
end wake_up;


