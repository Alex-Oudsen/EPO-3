entity datum_tb is
end entity; 

architecture structural of datum_tb is 
component datum is 
	port(
		clk			: in std_logic;
		reset		: in std_logic;
		ready_buf	: IN std_logic;
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
signal		ready_buf	: std_logic;
signal		tijd_uren 	: std_logic_vector (4 downto 0);
signal		dagvdweek	: std_logic_vector (2 downto 0);
signal		dagvdmaand 	: std_logic_vector (5 downto 0);
signal		maand		: std_logic_vector (4 downto 0);
signal		jaar 		: std_logic_vector (7 downto 0);
signal
signal		x		: std_logic_vector (6 downto 0);
signal		y		: std_logic_vector (5 downto 0);
signal		c		: std_logic_vector (6 downto 0)


begin 
	clk   <=   '1' after 0 ns,
              '0' after 10 ns when clk /= '0' else '1' after 10 ,ns;

			reset 		<= 	'0' after 0 ns,
							'1' after 15 ns, 
							'0' after 29 ns;
			tijd_uren 	<= 	"00101" after 0 ns,
							"00010" after 50 ns,
							"00000" after 100 ns, 
							"00011" after 120 ns, 
							"00000" after 500 ns, 
							"00100" after 501 ns, 
							"00000" after 1000 ns, 
							"01101" after 1153 ns, 
							"00000" after 1200 ns, 
							"00110" after 1256 ns, 
							"00000" after 1400 ns, 
							"00111" after 1500 ns,
							"00000" after 2000 ns,
							"00101" after 2015 ns; 
							
			dagvdweek 	<= 	"001" after 0 ns,
							"010" after 100 ns, 
							"011" after 500 ns, 
							"100" after 1000 ns, 
							"101" after 1200 ns, 
							"110" after 1400 ns, 
							"111" after 2000 ns; 
			dagvdmaand	<=  "00001" after 0 ns,
							"00010" after 100 ns, 
							"00011" after 500 ns, 
							"00100" after 1000 ns, 
							"01101" after 1200 ns, 
							"00110" after 1400 ns, 
							"00111" after 2000 ns; 
			maand 		<=  "00001" after 0 ns,
							"00010" after 100 ns, 
							"00011" after 500 ns, 
							"00100" after 1000 ns, 
							"01101" after 1200 ns, 
							"00110" after 1400 ns, 
							"10111" after 2000 ns; 
			jaar 		<= 	"00000001" after 0 ns,
							"00010011" after 100 ns, 
							"00010001" after 500 ns, 
							"00101101" after 1000 ns, 
							"01001101" after 1200 ns, 
							"01011010" after 1400 ns, 
							"10101010" after 2000 ns; 
			
				

lbl1: datum port map (clk=>clk, reset=>reset, ready_buf=>ready_buf, tijd_uren=>tijd_uren, dagvdweek=>dagvdweek, dagvdmaand, maand=>maand, jaar=>jaar);
end architecture; 


