-- Alex Oudsen, 4325494
-- Dit is de top-level beschrijving van
-- de binaire versie van het dcf77 blok

-- Er wordt gebruik gebmaakt van de volgende subblokken:
-- synctime, klokdeler, bcd2bin en autosyncklok

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of dcf77 is
	component synctime is
    		port(clk:	in  std_logic;
	  	     reset:    	in  std_logic;
	 	     dcf_in:   	in  std_logic;
	 	     dcf_led:  	out std_logic;
		     ready:	out std_logic;
		     minuten:  	out std_logic_vector(6 downto 0);
		     uren:    	out std_logic_vector(5 downto 0);
		     weekdag:  	out std_logic_vector(2 downto 0);
		     dagen:    	out std_logic_vector(5 downto 0);
		     maanden:   out std_logic_vector(4 downto 0);
		     jaren:    	out std_logic_vector(7 downto 0));
	end component synctime;

	component klokdeler is
    		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      clk_1hz:  out std_logic);
	end component klokdeler;

	component bcd2bin is
   		port(clk    :in    std_logic;
       		     reset  :in    std_logic;
       		     start  :in    std_logic;
      		     bcd_in :in    std_logic_vector(7 downto 0);
      		     bin_out:out   std_logic_vector(6 downto 0);
      		     ready  :out   std_logic);
	end component bcd2bin;

	component autosyncklok is
    		port (clk:	in  std_logic;
		      s_clk:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      min_ref:	in  std_logic_vector(5 downto 0);
		      hr_ref:	in  std_logic_vector(4 downto 0);
	  	      minutes:  out std_logic_vector(5 downto 0);
		      hours:    out std_logic_vector(4 downto 0));
	end component autosyncklok;

	signal start, sync, s_clk, min_r, hour_r: std_logic;
	signal min_dcf, hour_dcf: std_logic_vector(7 downto 0);
	signal minuut, mins, hrs: std_logic_vector(6 downto 0);
	signal uur, min_ref: std_logic_vector(5 downto 0);
	signal hour_ref: std_logic_vector(4 downto 0);

begin
	date_ready <= start;
	clk_1hz <= s_clk;
	min_dcf <= std_logic_vector(resize(unsigned(minuut), 8));
	hour_dcf <= std_logic_vector(resize(unsigned(uur), 8));
	min_ref <= mins(5 downto 0);
	hour_ref <= hrs(4 downto 0);
	sync <= min_r and hour_r;

	sytime: synctime	port map(clk, reset, dcf_in, dcf_led, start, minuut, uur, weekday, day, month, year);
	divide: klokdeler    	port map(clk, reset, s_clk);
	cv_min: bcd2bin		port map(clk, reset, start, min_dcf, mins, min_r);
	cv_hrs: bcd2bin		port map(clk, reset, start, hour_dcf, hrs, hour_r);
	r_time: autosyncklok 	port map(clk, s_clk, reset, sync, min_ref, hour_ref, minutes, hours);

end structure;