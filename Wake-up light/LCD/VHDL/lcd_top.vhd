--Joran Out, 4331958

library ieee;
use ieee.std_logic_1164.all;

entity lcd_top is
    	port (	clk		: in	std_logic;
		reset		: in	std_logic;
		ready		: in 	std_logic;
		uren		: in 	std_logic_vector(4 downto 0);
		minuten 	: in 	std_logic_vector(5 downto 0);
		dagvdweek	: in 	std_logic_vector (2 downto 0);
		dagvdmaand 	: in 	std_logic_vector (5 downto 0);
		maand		: in 	std_logic_vector (4 downto 0);
		jaar 		: in 	std_logic_vector (7 downto 0);
		dcf_debug	: in   	std_logic;
		menu		: in 	std_logic_vector (2 downto 0);
		geluid_signaal	: in   	std_logic;
	       	data_out  	: out   std_logic_vector(6 downto 0);
	       	clk_out   	: out   std_logic;
end dcf77_bcd;


