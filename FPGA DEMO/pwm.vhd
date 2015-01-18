library IEEE;
use IEEE.std_logic_1164.ALL;

entity pwm is
   port(clk   :in    std_logic;
        reset :in    std_logic;
        length:in    std_logic_vector(5 downto 0);
	   licht :in	std_logic;
        pwm_signal   :out   std_logic);
end pwm;


