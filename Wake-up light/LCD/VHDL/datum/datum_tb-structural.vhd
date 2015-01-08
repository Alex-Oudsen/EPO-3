library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of datum_tb is
component datum is 
	port(
		clk			: in std_logic;
		reset		: in std_logic;
		ready		: IN std_logic;
		tijd_uren 	: IN std_logic_vector (4 downto 0);
		dagvdweek	: IN std_logic_vector (2 downto 0);
		dagvdmaand 	: IN std_logic_vector (5 downto 0);
		maand		: IN std_logic_vector (4 downto 0);
		jaar 		: IN std_logic_vector (7 downto 0);

		x		: out std_logic_vector (6 downto 0);
		y		: out std_logic_vector (5 downto 0);
		c		: out std_logic_vector (6 downto 0)
		);
end component; 

signal		clk			: std_logic;
signal		reset		: std_logic;
signal		ready 	: std_logic;
signal		tijd_uren 	: std_logic_vector (4 downto 0);
signal		dagvdweek	: std_logic_vector (2 downto 0);
signal		dagvdmaand 	: std_logic_vector (5 downto 0);
signal		maand		: std_logic_vector (4 downto 0);
signal		jaar 		: std_logic_vector (7 downto 0);
signal		x		: std_logic_vector (6 downto 0);
signal		y		: std_logic_vector (5 downto 0);
signal		c		: std_logic_vector (6 downto 0);
begin 
	clk   <=   '1' after 0 ns,
              '0' after 1000 ns when clk /= '0' else '1' after 1000 ns;

			reset 		<= 	'0' after 0 ns,
							'1' after 1500 ns, 
							'0' after 2900 ns,
							'1' after 260000 ns;
			tijd_uren 	<= 	"00101" after 0 ns,
							"00010" after 5000 ns,
							"00000" after 10000 ns, 
							"00011" after 12000 ns, 
							"00000" after 50000 ns, 
							"00100" after 50100 ns, 
							"00000" after 100000 ns, 
							"01101" after 115300 ns, 
							"00000" after 120000 ns, 
							"00110" after 125600 ns, 
							"00000" after 140000 ns, 
							"00111" after 150000 ns,
							"00000" after 200000 ns,
							"00101" after 300000 ns; 
							
			dagvdweek 	<= 	"001" after 0 ns,
							"010" after 10000 ns, 
							"011" after 50000 ns, 
							"100" after 100000 ns, 
							"101" after 120000 ns, 
							"110" after 140000 ns, 
							"111" after 200000 ns; 
			dagvdmaand	<=  "000001" after 0 ns,
							"000010" after 10000 ns, 
							"000011" after 50000 ns, 
							"000100" after 100000 ns, 
							"001101" after 120000 ns, 
							"000110" after 140000 ns, 
							"000111" after 200000 ns; 
			maand 		<=  "00001" after 0 ns,
							"00010" after 10000 ns, 
							"00011" after 50000 ns, 
							"00100" after 100000 ns, 
							"01101" after 120000 ns, 
							"00110" after 140000 ns, 
							"10111" after 200000 ns; 
			jaar 		<= 	"00000001" after 0 ns,
							"00010011" after 10000 ns, 
							"00010001" after 50000 ns, 
							"00101101" after 100000 ns, 
							"01001101" after 120000 ns, 
							"01011010" after 140000 ns, 
							"10101010" after 200000 ns; 

			ready 		<= 		'0' after 0 ns,
							'1' after 5020 ns,
							'0' after 6020 ns,
							'1' after 10020 ns, 
							'0' after 12020 ns, 
							'1' after 14020 ns, 
							'0' after 20020 ns, 
							'1' after 50020 ns, 
							'0' after 56020 ns, 
							'1' after 60020 ns, 
							'0' after 70020 ns, 
							'1' after 100020 ns, 
							'0' after 102020 ns,
							'1' after 110020 ns, 
							'0' after 119020 ns,
							'1' after 122020 ns,
							'0' after 130020 ns, 
							'1' after 140020 ns, 
							'0' after 143020 ns, 
							'1' after 150020 ns,
							'0' after 160020 ns, 
							'1' after 189020 ns,
							'0' after 200920 ns,
							'1' after 205020 ns, 
							'0' after 207520 ns, 
							'1' after 210020 ns, 
							'0' after 220020 ns, 
							'1' after 230020 ns, 
							'0' after 240020 ns, 
							'1' after 245020 ns, 	
							'0' after 259020 ns; 



lbl1: datum port map (clk=>clk, reset=>reset, ready=>ready, tijd_uren=>tijd_uren, dagvdweek=>dagvdweek, dagvdmaand=>dagvdmaand, maand=>maand, jaar=>jaar, x=>x, y=>y, c=>c);
	
end structural;






































