library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of lcd_top_tb is
	component
    	port (	clk		: in	std_logic;
							reset		: in	std_logic;
							uren		: in 	std_logic_vector(5 downto 0);
							minuten 	: in 	std_logic_vector(6 downto 0);
							dagvdweek	: in 	std_logic_vector (2 downto 0);
							dagvdmaand 	: in 	std_logic_vector (5 downto 0);
							maand		: in 	std_logic_vector (4 downto 0);
							jaar 		: in 	std_logic_vector (7 downto 0);
							dcf_debug	: in   	std_logic;
							alarm		: in	std_logic;
							menu		: in 	std_logic_vector (2 downto 0);
							geluid_signaal	: in   	std_logic;
							licht_signaal	: in	std_logic;
							hz_1			: in	std_logic;
  			  		wektijd_uren	: in    std_logic_vector(5 downto 0);
 			       	wektijd_min 	: in    std_logic_vector(6 downto 0);
			       	data_out  	: out   std_logic_vector(6 downto 0);
			       	clk_out   	: out   std_logic);
	end component;

signal clk, reset, ready, dcf_debug, alarm, geluid_signaal, licht_signaal, hz_1, clk_out: std_logic;
signal dagvdweek, menu: std_logic_vector (2 downto 0);
signal maand: std_logic_vector (4 downto 0);
signal uren, dagvdmaand, wektijd_uren: std_logic_vector (5 downto 0);
signal minuten, wektijd_min, data_out: std_logic_vector (6 downto 0);
signal jaar: std_logic_vector (7 downto 0);

begin
lbl_lcd_top: lcd_top port map (clk, reset, uren, minuten, dagvdweek, dagvdmaand, maand, jaar, dcf_debug, alarm, menu, geluid_signaal, licht_signaal, hz_1, wektijd_uren, wektijd_min, data_out, clk_out);

clk <=	'1' after 0 ns,
				'0' after 100 ns when clk /= '0' else '1' after 100 ns;
reset <='1' after 0 ns,
				'0' after 200 ns;
uren <= "000000" after 0 ns,
				"000001" after 6050 ns;
minuten <= "0000000" after 0 ns,
					"0000001" after 150 ns,
					"0000010" after 250 ns,
					"0000011" after 350 ns,
					"0000100" after 450 ns,
					"0000101" after 550 ns,
					"0000110" after 650 ns,
					"0000111" after 750 ns,
					"0001000" after 850 ns,
					"0001001" after 950 na,
					"0001010" after 1050 ns,
					"0001011" after 1150 ns,
					"0001100" after 1250 ns,
					"0001101" after 1350 ns,
					"0001110" after 1450 ns,
					"0001111" after 1550 ns,
					"0010000" after 1650 ns,
					"0010001" after 1750 ns,	
					"0010010" after 1850 ns,
					"0010011" after 1950 ns,
					"0010100"after 2050 ns,
					"0010101"after 2150 ns,
					"0010110"after 2250 ns,
					"0010111"after 2350 ns,
					"0011000"after 2450 ns,
					"0011001"after 2550 ns,
					"0011010"after 2650 ns,
					"0011011"after 2750 ns
					"0011100" after 2850 ns,
					"0011101"after 2950 ns,
					"0011110"after 3050 ns,
					"0011111"after 3150 ns,
					"0100000"after 3250 ns,
					"0100001"after 3350 ns,
					"0100010" after 3450 ns,
					"0100011" after 3550 ns,
					"0100100" after 3650 ns,
					"0100101"after 3750 ns,
					"0100110"after 3850 ns,
					"0100111" after 3950 ns,
					"0101000" after 4050 ns,
					"0101001" after 4150 ns,
					"0101010" after 4250 ns,
					"0101011" after 4350 ns,
					"0101100" after 4450 ns,
					"0101101" after 4550 ns,
					"0101110" after 4650 ns,
					"0101111" after 4750 ns,
					"0110000" after 4850 ns,
					"0110001" after 4950 ns,
					"0110010" after 5050 ns,
					"0110011" after 5150 ns,
					"0110100" after 5250 ns,
					"0110101" after 5350 ns,
					"0110110" after 5450 ns,
					"0110111" after 5550 ns,
					"0111000" after 5650 ns,
					"0111001"after 5750 ns,
					"0111010" after 5850 ns,
					"0111011" after 5950 ns,
					"0000000" after 6050 ns;	
dagvdweek <= "000" after 000 ns;
dagvdmaand <= "000000" after 0 ns;	
maand <= "00101" after 0 ns;
jaar <= "00001111" after 0 ns;
dcf_debug <= '1' after 0 ns,
							'0' after 450 ns,
							'1' after 850 ns,
							'0' after 1050 ns,
							'1' after 1550 ns,
							'0' after 2150 ns,
							'1' after 3550 ns,
							'0' after 5500 ns,
							'1' after 6050 ns;

