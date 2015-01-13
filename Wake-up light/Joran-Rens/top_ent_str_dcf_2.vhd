library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of top_top_entity is
--componenten
component alarm is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        sec       :in    std_logic;
        licht     :in    std_logic;
        pwm_signal:out   std_logic);
end component;

component datefix is
	port(clk	:in  std_logic;
	     reset	:in  std_logic;
	     date_ready	:in  std_logic;
	     jaar	:in  std_logic_vector(7 downto 0);
	     maand	:in  std_logic_vector(4 downto 0);
	     dag	:in  std_logic_vector(5 downto 0);
	     weekdag	:in  std_logic_vector(2 downto 0);
	     datum	:out std_logic_vector(21 downto 0));
end component;

component compare is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        tijd_uur_l :in    std_logic_vector(3 downto 0);
	   		tijd_uur_h :in	std_logic_vector(1 downto 0);
        tijd_min_l :in    std_logic_vector(3 downto 0);
				tijd_min_h :in	std_logic_vector(2 downto 0);
        wekker_uur_l:in    std_logic_vector(3 downto 0);
				wekker_uur_h:in    std_logic_vector(1 downto 0);
        wekker_min_l:in    std_logic_vector(3 downto 0);
				wekker_min_h:in    std_logic_vector(2 downto 0);
        stop_alarm:in    std_logic;
        geluid    :out   std_logic;
        licht     :out   std_logic);
end component;

component controller is
   port(clk    :in    std_logic;
        reset  :in    std_logic;
        knoppen:in    std_logic_vector(3 downto 0);
        wekker :out   std_logic_vector(15 downto 0);
        menu_state   :out   std_logic_vector(2 downto 0));
end component;

--component dcf77_bcd is
  --  port (clk:	    	  in  std_logic;
--	  reset:     	in  std_logic;
--	  dcf_in:   	 in  std_logic;
--	  dcf_led:   	out std_logic;
--	  clk_1hz:  	 out std_logic;
--	  minutes:  	 out std_logic_vector(6 downto 0);
--	  hours:     	out std_logic_vector(5 downto 0);
--	  weekday:   	out std_logic_vector(2 downto 0);
--	  day:	      out std_logic_vector(5 downto 0);
--	  month:    	 out std_logic_vector(4 downto 0);
--	  year:	      out std_logic_vector(7 downto 0);
--	  date_ready:	out std_logic);
--end component;

--component synctime is
    		--port(clk:		in  std_logic;
	  --	     reset:    	in  std_logic;
	 --	     dcf_in:   	in  std_logic;
	 --	     dcf_led:  	out std_logic;
	--	     ready:	    out std_logic;
	--	     minuten:  	out std_logic_vector(6 downto 0);
	--	     uren:    	 out std_logic_vector(5 downto 0);
	--	     weekdag:  	out std_logic_vector(2 downto 0);
	--	     dagen:    	out std_logic_vector(5 downto 0);
	--	     maanden:   out std_logic_vector(4 downto 0);
	--	     jaren:    	out std_logic_vector(7 downto 0));
	--end component synctime;

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

	component klokdeler is
    		port (clk:		in  std_logic;
		      reset:		in  std_logic;
		      clk_1hz:  out std_logic);
	end component klokdeler;

	component ausy_klok_bcd is
    		port (clk:		in  std_logic;
		      s_clk:		in  std_logic;
		      reset:		in  std_logic;
		      sync_now: in  std_logic;
		      min_ref:		in  std_logic_vector(6 downto 0);
		      hr_ref:		in  std_logic_vector(5 downto 0);
	  	      minutes:  out std_logic_vector(6 downto 0);
		      hours:    out std_logic_vector(5 downto 0));
	end component ausy_klok_bcd;




component lcd_top is
    	port (	clk		: in	std_logic;
		reset			: in	std_logic;
		uren			: in 	std_logic_vector(5 downto 0);
		minuten 		: in 	std_logic_vector(6 downto 0);
		dagvdweek		: in 	std_logic_vector (2 downto 0);
		dagvdmaand 		: in 	std_logic_vector (5 downto 0);
		maand			: in 	std_logic_vector (4 downto 0);
		jaar 			: in 	std_logic_vector (7 downto 0);
		dcf_debug		: in   	std_logic;
		alarm			: in	std_logic;
		menu			: in 	std_logic_vector (2 downto 0);
		geluid_signaal	: in   	std_logic;
		licht_signaal 	: in	std_logic;
		hz_1			: in 	std_logic;
		wektijd_uren	: in	std_logic_vector (5 downto 0);
		wektijd_min	: in	std_logic_vector (6 downto 0);
    	data_out  		: out   std_logic_vector (6 downto 0);
    	clk_out   		: out   std_logic);
end component;


--signalen
signal clk_1hz, dcf_led, date_ready, beep, licht_sg, lichtje,sound:	std_logic;
signal tijd_tijd_tijd : std_logic_vector (12 downto 0);
signal wekkeur : std_logic_vector (15 downto 0);
signal weekdag, menu_plek,par : std_logic_vector (2 downto 0);
signal dag : std_logic_vector (5 downto 0);
signal maand	:	std_logic_vector (4 downto 0);
signal jaar		:	std_logic_vector (7 downto 0);
signal datum	:	std_logic_vector (21 downto 0);
	signal sync, s_clk: std_logic;
	signal minuut: std_logic_vector(6 downto 0);
	signal uur: std_logic_vector(5 downto 0);
	
signal dcf_rise, dcf_fall, new_bit, start_xor: std_logic;
	signal count: std_logic_vector(15 downto 0);
	--signal jaar: std_logic_vector(7 downto 0);
	--signal minuut: std_logic_vector(6 downto 0);
	--signal uur, dag: std_logic_vector(5 downto 0);
	--signal maand: std_logic_vector(4 downto 0);
	--signal weekday, par: std_logic_vector(2 downto 0);

begin
--port maps
	alarm_1 : alarm port map (clk, reset, clk_1hz, licht_sg, led_lamp);

	compare_1 : compare port map (clk, reset, tijd_tijd_tijd(10 downto 7), tijd_tijd_tijd(12 downto 11), tijd_tijd_tijd(3 downto 0), tijd_tijd_tijd(6 downto 4), wekkeur(10 downto 7), wekkeur(12 downto 11), wekkeur(3 downto 0), wekkeur(6 downto 4), knoppen(4), sound, lichtje);

	kontroller_1 : controller port map (clk, reset, knoppen(3 downto 0), wekkeur(15 downto 0), menu_plek);

	--dcf_1 : dcf77_bcd port map (clk, reset, dcf, dcf_led, clk_1hz, tijd_tijd_tijd(6 downto 0), tijd_tijd_tijd(12 downto 7), weekdag, dag, maand, jaar, date_ready);
	
	date_ready <= sync;
	clk_1hz <= s_clk;

	--sytime: synctime	port map(clk, reset, dcf, dcf_led, sync, minuut, uur, weekdag, dag, maand, jaar);
	
	
	--	minuten <= minuut;
	--uren <= uur;
	--weekdag <= weekday;
	--dagen <= dag;
	--maanden <= maand;
	--jaren <= jaar;

	edging: edge_detector	port map(clk, reset, dcf, dcf_rise, dcf_fall);
	counts: dcf_counter	port map(clk, reset, dcf_rise, dcf_fall, count, new_bit);
	decode: dcf_decoder	port map(clk, reset, count, new_bit, dcf_led, start_xor, minuut, uur, weekdag, dag, maand, jaar, par);
	parity: parity_check 	port map(clk, reset, start_xor, minuut, uur, weekdag, dag, maand, jaar, par, date_ready);
	
	
	divide: klokdeler    			port map(clk, reset, s_clk);
	r_time: ausy_klok_bcd			port map(clk, s_clk, reset, sync, minuut, uur, tijd_tijd_tijd(6 downto 0), tijd_tijd_tijd(12 downto 7));

	quickfix1: datefix	port map (clk, reset, date_ready, jaar, maand, dag, weekdag, datum);

	lcd_toppie : lcd_top port map (clk, reset, tijd_tijd_tijd(12 downto 7), tijd_tijd_tijd(6 downto 0), datum(2 downto 0), datum(8 downto 3), datum (13 downto 9), datum(21 downto 14), dcf_led, wekkeur(15), menu_plek, wekkeur(13), wekkeur(14), clk_1hz, wekkeur(12 downto 7), wekkeur(6 downto 0), data_out, clk_out);

-- AND port
	licht_sg <= (lichtje AND wekkeur(15) and wekkeur(14));
	buzzer <= (sound AND wekkeur(15) AND wekkeur(13));
	


end structural;











