-- Alex Oudsen, 4325494
-- Dit onderdeel is verantwoordelijk voor het genereren
-- van synchronisatiemomenten uit het te ontvangen
-- digitale dcf77 signaal

-- Er wordt gebruik gemaakt van de volgende subblokken:
-- edge_detector, dcf_counter, dcf_decoder en parity_check

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of synctime is
	component edge_detector is
		port(clk:		in  std_logic;
	 	     reset:		in  std_logic;
            	     	  input:		in  std_logic;
          	     	    rising:		out std_logic;
	  	     falling:		out std_logic);
	end component edge_detector;

	component dcf_counter is
   		port(clk		:in    	std_logic;
 		     reset		:in    	std_logic;
 		     dcf_rise		:in    	std_logic;
  		     dcf_fall		:in    	std_logic;
  		     count		:out   	std_logic_vector(15 downto 0);
		     new_bit		:out   	std_logic);
	end component dcf_counter;

	component dcf_decoder is
   		port(clk		:in  std_logic;
 		     reset		:in  std_logic;
 		     count		:in  std_logic_vector(15 downto 0);
		     new_bit		:in  std_logic;
		     dcf_led		:out std_logic;
		     start_xor		:out std_logic;
		     minuten		:out std_logic_vector(6 downto 0);
		     uren		:out std_logic_vector(5 downto 0);
		     weekdag		:out std_logic_vector(2 downto 0);
		     dagen		:out std_logic_vector(5 downto 0);
		     maanden		:out std_logic_vector(4 downto 0);
		     jaren		:out std_logic_vector(7 downto 0);
		     parity_bits:out std_logic_vector(2 downto 0));
	end component dcf_decoder;

	component parity_check is
    		port (clk:	   	 	in  std_logic;
		      reset:    			in  std_logic;
		      start_xor:			in  std_logic;
		      minuten:  			in  std_logic_vector(6 downto 0);
		      uren:     			in  std_logic_vector(5 downto 0);
		      weekdag:  			in  std_logic_vector(2 downto 0);
		      dagen:   			in  std_logic_vector(5 downto 0);
		      maanden:  			in  std_logic_vector(4 downto 0);
		      jaren:    			in  std_logic_vector(7 downto 0);
		      parity_bits:			in  std_logic_vector(2 downto 0);
		      sync_now:			out std_logic);
	end component parity_check;

	signal dcf_rise, dcf_fall, new_bit, start_xor: std_logic;
	signal count: std_logic_vector(15 downto 0);
	signal jaar: std_logic_vector(7 downto 0);
	signal minuut: std_logic_vector(6 downto 0);
	signal uur, dag: std_logic_vector(5 downto 0);
	signal maand: std_logic_vector(4 downto 0);
	signal weekday, par: std_logic_vector(2 downto 0);

begin
	minuten <= minuut;
	uren <= uur;
	weekdag <= weekday;
	dagen <= dag;
	maanden <= maand;
	jaren <= jaar;

	edging: edge_detector	port map(clk, reset, dcf_in, dcf_rise, dcf_fall);
	counts: dcf_counter	port map(clk, reset, dcf_rise, dcf_fall, count, new_bit);
	decode: dcf_decoder	port map(clk, reset, count, new_bit, dcf_led, start_xor, minuut, uur, weekday, dag, maand, jaar, par);
	parity: parity_check 	port map(clk, reset, start_xor, minuut, uur, weekday, dag, maand, jaar, par, ready);

end structure;

