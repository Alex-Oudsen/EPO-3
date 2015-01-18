library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of alarm is
component counter
	 port(	clk   :in    std_logic;
        		reset :in    std_logic;
        		sec   :in    std_logic;
		licht :in    std_logic;
        		length:out   std_logic_vector(5 downto 0));
end component;
component pwm
	port(	clk   :in    std_logic;
        		reset :in    std_logic;
        		length:in    std_logic_vector(5 downto 0);
			licht :in	 std_logic;
        		pwm_signal   :out   std_logic);
end component;
signal length : std_logic_vector (5 downto 0);
begin
	counter_1 : counter port map (clk => clk, reset => reset, sec => sec, licht => licht, length => length);
	pwm_1 : pwm port map (clk => clk, reset => reset, length => length, licht => licht, pwm_signal => pwm_signal);
end behaviour;


