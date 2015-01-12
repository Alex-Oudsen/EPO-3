library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pwm_tb is
	component pwm
		port(	clk   :in    std_logic;
        			reset :in    std_logic;
        			length:in    std_logic_vector(5 downto 0);
        			pwm_signal   :out   std_logic);
	end component;
	signal clk		: std_logic;
	signal reset		: std_logic;
	signal length		: std_logic_vector(5 downto 0);
	signal pwm_signal		: std_logic;
begin
	lbl1: pwm port map (clk, reset, length, pwm_signal);
	clk <= '0' after 0 ns,
		'1' after 100 ns when clk /= '1' else '0' after 100 ns;
	reset <= '1' after 0 ns,
		'0' after 350 ns;
	length <= 		"111111" after 0 ns,
			"001111" after 4000 ns,
			"000001" after 40000 ns,
			"000000" after 110000 ns;
end behaviour;


