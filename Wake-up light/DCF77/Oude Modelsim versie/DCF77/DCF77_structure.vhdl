-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of dcf77 is
	component dcf_decoder is
		port (clk:	   	in  std_logic;
		      reset:    	in  std_logic;
		      dcf_rise:   	in  std_logic;
		      dcf_fall:		in  std_logic;
		      dcf_led:  	out std_logic;
		      start_xor:	out std_logic;
		      minuten:  	out std_logic_vector(6 downto 0);
		      uren:     	out std_logic_vector(5 downto 0);
		      weekdag:  	out std_logic_vector(2 downto 0);
		      dagen:   		out std_logic_vector(5 downto 0);
		      maanden:  	out std_logic_vector(4 downto 0);
		      jaren:    	out std_logic_vector(7 downto 0);
		      parity_bits:	out std_logic_vector(2 downto 0));
	end component dcf_decoder;

	component bcd2bin is
 		port (clk:	in  std_logic;
	  	      reset:	in  std_logic;
	  	      start:	in  std_logic;
	  	      bcd_in:	in  std_logic_vector(7 downto 0);
	  	      bin_out:	out std_logic_vector(6 downto 0);
		      ready:	out std_logic);
	end component bcd2bin;

	component klokdeler is
    		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      clk_1hz:  out std_logic);
	end component klokdeler;

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

	component edge_detector is
		port(clk:	in  std_logic;
	 	     reset:	in  std_logic;
            	     input:	in  std_logic;
          	     rising:	out std_logic;
	  	     falling:	out std_logic);
	end component edge_detector;

	component parity_check is
    		port (clk:	   	in  std_logic;
		      reset:    	in  std_logic;
		      start_xor:	in  std_logic;
		      minuten:  	in  std_logic_vector(6 downto 0);
		      uren:     	in  std_logic_vector(5 downto 0);
		      weekdag:  	in  std_logic_vector(2 downto 0);
		      dagen:   		in  std_logic_vector(5 downto 0);
		      maanden:  	in  std_logic_vector(4 downto 0);
		      jaren:    	in  std_logic_vector(7 downto 0);
		      parity_bits:	in  std_logic_vector(2 downto 0);
		      sync_now:		out std_logic);
	end component parity_check;

	signal dcf_r, dcf_f, s_clk, start, sync_now, min_r, hour_r, time_ready: std_logic;
	signal min_dcf, hour_dcf, jaar: std_logic_vector(7 downto 0);
	signal minuten, mins, hrs: std_logic_vector(6 downto 0);
	signal uren, min_ref, dag: std_logic_vector(5 downto 0);
	signal weekdag, p_bits: std_logic_vector(2 downto 0);
	signal hr_ref, maand: std_logic_vector(4 downto 0);

begin
	date_ready <= sync_now;
	clk_1hz <= s_clk;
	min_dcf <= std_logic_vector(resize(unsigned(minuten), 8));
	hour_dcf <= std_logic_vector(resize(unsigned(uren), 8));
	min_ref <= mins(5 downto 0);
	hr_ref <= hrs(4 downto 0);
	time_ready <= min_r and hour_r;

	weekday <= weekdag;
	day <= dag;
	month <= maand;
	year <= jaar;

	decode: dcf_decoder	port map(clk, reset, dcf_r, dcf_f, dcf_led, start, minuten, uren, weekdag, dag, maand, jaar, p_bits);
	edging: edge_detector	port map(clk, reset, dcf_in, dcf_r, dcf_f);
	parity: parity_check 	port map(clk, reset, start, minuten, uren, weekdag, dag, maand, jaar, p_bits, sync_now);
	cv_min: bcd2bin      	port map(clk, reset, sync_now, min_dcf, mins, min_r);
	cv_hrs: bcd2bin      	port map(clk, reset, sync_now, hour_dcf, hrs, hour_r);
	divide: klokdeler    	port map(clk, reset, s_clk);
	r_time: autosyncklok 	port map(clk, s_clk, reset, time_ready, min_ref, hr_ref, minutes, hours);

end structure;