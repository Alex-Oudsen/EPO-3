library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter_tb is
	component counter
		port(	clk   :in    std_logic;
        			reset :in    std_logic;
        			sec   :in    std_logic;
			licht :in    std_logic;
        			length:out   std_logic_vector(5 downto 0));
	end component;
	signal clk 	 : std_logic;
	signal reset	: std_logic;
	signal sec 	 : std_logic;
	signal licht	: std_logic;
	signal length: std_logic_vector(5 downto 0);
begin
	lbl1: counter port map (clk, reset, sec, licht, length);
	clk <=		'0' after 0 ns,
			'1' after 100 ns when clk /= '1' else '0' after 100 ns;
	reset <= 		'1' after 0 ns,
			'0' after 650 ns;
	licht <= 		'1' after 0 ns;
	sec <=		'0' after 0 ns,
			'1' after 5000 ns when sec /= '1' else '0' after 5000 ns;	
end behaviour;


