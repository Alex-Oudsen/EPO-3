library ieee;
use ieee.std_logic_1164.all;

entity alarm is
	port(clk       		 	: in  std_logic;
             reset     				: in  std_logic;
             sec       				: in  std_logic;
	     start_alarm			: in  std_logic;
	     stop_alarm			: in  std_logic;
	     tijd_uren			: in  std_logic_vector(5 downto 0);
	     tijd_min			: in  std_logic_vector(6 downto 0);
	     wek_uren			: in  std_logic_vector(5 downto 0);
	     wek_min			: in  std_logic_vector(6 downto 0);
	     geluid			: out std_logic;
             pwm_signal				: out std_logic);
end alarm;


