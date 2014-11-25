library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of totaal_tb is
	component fifo_totaal
		port (push  :in    std_logic;
        			pop   :in    std_logic;
        			reset :in    std_logic;
        			clk   :in    std_logic;
        			full  :out   std_logic;
   			empty :out   std_logic;
        			nopop :out   std_logic;
        			nopush:out   std_logic;
			dIn   :in    std_logic_vector(7 downto 0);
        			dOut  :out   std_logic_vector(7 downto 0));
	end component;
	signal push:  std_logic;
        signal pop :      std_logic;
        signal reset :    std_logic;
        signal clk   :   std_logic;
        signal full  :   std_logic;
        signal empty :   std_logic;
        signal nopop :   std_logic;
        signal nopush:   std_logic;
	signal dIn   :   std_logic_vector(7 downto 0);
        signal dOut  :  std_logic_vector(7 downto 0);
begin
	lbl1: fifo_totaal port map (push, pop, reset, clk, full, empty, nopop, nopush, dIn, dOut);
	clk <=  '1' after 0 ns,
		'0' after 100 ns when clk /= '0' else '1' after 100 ns;
	reset <= '1' after 0 ns,
		'0' after 250 ns;
	push <= '0' after 0 ns,
		'1' after 550 ns,
		'0' after 950 ns,
		'1' after 1950 ns;
	pop <= 	'0' after 0 ns,
		'1' after 950 ns,
		'0' after 1750 ns,
		'1' after 3050 ns;
	dIn <=		"00000001" after 0 ns,
			"00000010" after 340 ns,
			"00000011" after 640 ns,
			"00000100" after 940 ns,
			"00000101" after 1240 ns,
			"00000110" after 1540 ns,
			"00000111" after 1840 ns,
			"00001000" after 2140 ns,
			"00001001" after 2440 ns,
			"00001010" after 2740 ns,
			"00001011" after 3040 ns,
			"00001100" after 3340 ns,
			"00001101" after 3640 ns,
			"00001110" after 3940 ns,
			"00001111" after 4240 ns,
			"00010000" after 4540 ns,
			"00010001" after 4840 ns,
			"00010010" after 5140 ns,
			"00010011" after 5440 ns,
			"00010100" after 5740 ns,
			"00010101" after 6040 ns,
			"00010110" after 6340 ns,
			"00010111" after 6640 ns,
			"00011000" after 6940 ns;
end behaviour;










