library ieee;
use ieee.std_logic_1164.all;

entity pwm is
	port(clk		: in  std_logic;
             reset			: in  std_logic;
	     licht		: in  std_logic;
             length			: in  std_logic_vector(5 downto 0);
             pwm_signal : out std_logic);
end pwm;


