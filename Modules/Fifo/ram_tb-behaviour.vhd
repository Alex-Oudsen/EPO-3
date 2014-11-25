library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ram_tb is
	component ram
		port(	dIn    :in    std_logic_vector(7 downto 0);
        			we     :in    std_logic;
        			do     :in    std_logic;
        			address:in    std_logic_vector(2 downto 0);
			reset  :in	   std_logic;
			clk    :in	   std_logic;
        			dOut   :out   std_logic_vector(7 downto 0));
	end component;
	signal dIn: std_logic_vector(7 downto 0);
	signal we: std_logic;
	signal do: std_logic;
	signal address: std_logic_vector(2 downto 0);
	signal reset: std_logic;
	signal clk: std_logic;
	signal dOut: std_logic_vector(7 downto 0);
begin
	lbl1: ram port map (dIn, we, do, address, reset, clk, dOut);
	clk <=  '1' after 0 ns,
		'0' after 100 ns when clk /= '0' else '1' after 100 ns;
	reset <= '1' after 0 ns,
		'0' after 250 ns;
	do <= 	'0' after 0 ns,
		'1' after 650 ns,
		'0' after 1850 ns,
		'1' after 2150 ns;
	we <=	'0' after 0 ns,
		'1' after 350 ns,
		'0' after 1550 ns,
		'1' after 2550 ns;
	address <= "000" after 0 ns,
		"001" after 450 ns,
		"010" after 550 ns,
		"011" after 650 ns,
		"100" after 750 ns,
		"101" after 850 ns,
		"110" after 950 ns,
		"111" after 1050 ns,
		"000" after 1150 ns;
	dIn <= "00000000" after 0 ns,
		"00001000" after 550 ns;

	
end behaviour;


