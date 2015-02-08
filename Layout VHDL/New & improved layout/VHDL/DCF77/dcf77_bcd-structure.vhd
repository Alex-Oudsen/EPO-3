library ieee;
use ieee.std_logic_1164.all;

architecture structure of dcf77_bcd is

	component synctime is
    		port(clk		: in  std_logic;
	  	     reset		: in  std_logic;
	 	     dcf_in		: in  std_logic;
	 	     dcf_led		: out std_logic;
		     ready		: out std_logic;
		     minuten		: out std_logic_vector(6 downto 0);
		     uren		: out std_logic_vector(5 downto 0);
		     weekdag		: out std_logic_vector(2 downto 0);
		     dagen		: out std_logic_vector(5 downto 0);
		     maanden		: out std_logic_vector(4 downto 0);
		     jaren		: out std_logic_vector(7 downto 0));
	end component synctime;

	component klokdeler is
    		port (clk		: in  std_logic;
		      reset		: in  std_logic;
		      clk_1hz		: out std_logic);
	end component klokdeler;

	component ausy_klok_bcd is
    		port (clk		: in  std_logic;
		      s_clk		: in  std_logic;
		      reset		: in  std_logic;
		      sync_now		: in  std_logic;
		      min_ref		: in  std_logic_vector(6 downto 0);
		      hr_ref		: in  std_logic_vector(5 downto 0);
	  	      minutes		: out std_logic_vector(6 downto 0);
		      hours		: out std_logic_vector(5 downto 0));
	end component ausy_klok_bcd;

	signal sync, s_clk: std_logic;
	signal uur: std_logic_vector(5 downto 0);
	signal minuut: std_logic_vector(6 downto 0);

begin
	date_ready <= sync;
	clk_1hz <= s_clk;

	sytime: synctime			port map(clk, reset, dcf_in, dcf_led, sync, minuut, uur, weekday, day, month, year);
	divide: klokdeler    			port map(clk, reset, s_clk);
	r_time: ausy_klok_bcd			port map(clk, s_clk, reset, sync, minuut, uur, minutes, hours);

end structure;


