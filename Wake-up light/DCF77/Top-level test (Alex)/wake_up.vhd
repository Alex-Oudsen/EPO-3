-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity wake_up is
	port (clk	:in  std_logic;
	      reset	:in  std_logic;
	      knoppen	:in  std_logic_vector (4 downto 0);
	      dcf_in	:in  std_logic;
	      led_lamp	:out std_logic;
	      buzzer	:out std_logic;
              clk_out   :out std_logic;
	      data_out	:out std_logic_vector(6 downto 0));
end wake_up;
