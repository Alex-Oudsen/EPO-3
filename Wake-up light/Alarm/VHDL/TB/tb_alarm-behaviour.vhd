library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tb_alarm is
	component alarm
		port(	clk       :in    std_logic;
        			reset     :in    std_logic;
        			sec       :in    std_logic;
        			licht     :in    std_logic;
        			pwm_signal:out   std_logic);
	end component;
	signal clk : std_logic;
	signal reset: std_logic;
	signal sec: std_logic;
	signal licht: std_logic;
	signal pwm_signal: std_logic;
begin
	lbl1: alarm port map (clk, reset, sec, licht, pwm_signal);
	clk <= 		'0' after 0 ns,
			'1' after 100 ns when clk /= '1' else '0' after 100 ns;
	reset <= 		'1' after 0 ns,
			'0' after 350 ns;
	licht <= 		'0' after 0 ns;
	sec <=		'0' after 0 ns,
			'1' after 5000 ns when sec /= '1' else '0' after 5000 ns;
end behaviour;


