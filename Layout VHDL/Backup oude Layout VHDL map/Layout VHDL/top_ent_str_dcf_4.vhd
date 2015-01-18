library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of top_top_entity is
--componenten

component osc10 is
	port(E		: in	std_logic;
		 XI		: in	std_logic;
		 XO	: inout	std_logic;
		 F		: out	std_logic);
end component;

component buf40 is
	port (A	:	in	std_logic;
		Y	:	out	std_logic);
end component;

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

--	component ausy_klok_bcd is
  --  		port (clk:		in  std_logic;
--		      s_clk:		in  std_logic;
--		      reset:		in  std_logic;
--		      sync_now: in  std_logic;
--		      min_ref:		in  std_logic_vector(6 downto 0);
--		      hr_ref:		in  std_logic_vector(5 downto 0);
--	  	      minutes:  out std_logic_vector(6 downto 0);
--		      hours:    out std_logic_vector(5 downto 0));
--	end component ausy_klok_bcd;


component mod60_clk_bcd is
   		port(clk:		in    std_logic;
        		     clk_in:		in    std_logic;
        		     reset:		in    std_logic;
		     sync_now:		in    std_logic;
        		     ref:		in    std_logic_vector(6 downto 0);
		     m_clk:		out   std_logic);
	end component mod60_clk_bcd;

	component mod60_tel_bcd is
		port (clk:		in  std_logic;
		      clk_in:		in  std_logic;
		      reset:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(6 downto 0);
		      count:    out std_logic_vector(6 downto 0);
	  	      h_clk:    out std_logic);
	end component mod60_tel_bcd;

	component mod24_tel_bcd is
    		port (clk:		in  std_logic;
		      clk_in:		in  std_logic;
		      reset:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(5 downto 0);
	  	      count:    out std_logic_vector(5 downto 0));
	end component mod24_tel_bcd;

--component lcd_top is
 --   	port (	clk		: in	std_logic;
	--	reset			: in	std_logic;
--		uren			: in 	std_logic_vector(5 downto 0);
--		minuten 		: in 	std_logic_vector(6 downto 0);
--		dagvdweek		: in 	std_logic_vector (2 downto 0);
--		dagvdmaand 		: in 	std_logic_vector (5 downto 0);
--		maand			: in 	std_logic_vector (4 downto 0);
--		jaar 			: in 	std_logic_vector (7 downto 0);
--		dcf_debug		: in   	std_logic;
--		alarm			: in	std_logic;
--		menu			: in 	std_logic_vector (2 downto 0);
--		geluid_signaal	: in   	std_logic;
--		licht_signaal 	: in	std_logic;
--		hz_1			: in 	std_logic;
--		wektijd_uren	: in	std_logic_vector (5 downto 0);
--		wektijd_min	: in	std_logic_vector (6 downto 0);
 --   	data_out  		: out   std_logic_vector (6 downto 0);
  --  	clk_out   		: out   std_logic);
--end component;

component wektijd is
	port(	clk         :in    std_logic;
	     	reset       :in    std_logic;
		ready       :in    std_logic;
		menu	    :in    std_logic_vector(2 downto 0);
    		wektijd_uren:in    std_logic_vector(5 downto 0);
    		wektijd_min :in    std_logic_vector(6 downto 0);
    		x           :out   std_logic_vector(6 downto 0);
    		y           :out   std_logic_vector(5 downto 0);
    		c           :out   std_logic_vector(6 downto 0));
end component wektijd;

component licht is
	port(	clk          		:in    std_logic;
        	reset        		:in    std_logic;
        	ready        		:in    std_logic;
        	menu         		:in    std_logic_vector(2 downto 0);
        	licht_signaal		:in    std_logic;
        	x            		:out   std_logic_vector(6 downto 0);
        	y            		:out   std_logic_vector(5 downto 0);
        	c            		:out   std_logic_vector(6 downto 0));
end component licht;

component datum is	
	port(
		clk			: in 	std_logic;
		reset			: in 	std_logic;
		ready			: in 	std_logic;
		tijd_uren 		: in 	std_logic_vector (5 downto 0); 
		dagvdweek		: in 	std_logic_vector (2 downto 0);
		dagvdmaand 		: in 	std_logic_vector (5 downto 0);
		maand			: in 	std_logic_vector (4 downto 0);
		jaar 			: in 	std_logic_vector (7 downto 0);
		x			: out 	std_logic_vector (6 downto 0);
		y			: out 	std_logic_vector (5 downto 0);
		c			: out 	std_logic_vector (6 downto 0)
		);
end component datum; 

component dcf_lcd is
   	port(   clk      		: in   	std_logic;
        	reset    		: in   	std_logic;
        	ready    		: in   	std_logic;
        	dcf_debug		: in   	std_logic;
        	x       		: out  	std_logic_vector(6 downto 0);
        	y        		: out  	std_logic_vector(5 downto 0);
        	c        		: out  	std_logic_vector(6 downto 0)
		);
end component dcf_lcd;

component send_top is
		port(	clk			: in	std_logic;
			reset			: in	std_logic;
			x_in_0			: in 	std_logic_vector(6 downto 0);
			y_in_0			: in 	std_logic_vector(5 downto 0);
			c_in_0			: in 	std_logic_vector(6 downto 0);
			ready_0			: out 	std_logic;

			x_in_1			: in 	std_logic_vector(6 downto 0);
			y_in_1			: in 	std_logic_vector(5 downto 0);
			c_in_1			: in 	std_logic_vector(6 downto 0);
			ready_1			: out 	std_logic;

			x_in_2			: in 	std_logic_vector(6 downto 0);
			y_in_2			: in 	std_logic_vector(5 downto 0);
			c_in_2			: in 	std_logic_vector(6 downto 0);
			ready_2			: out 	std_logic;

			x_in_3			: in 	std_logic_vector(6 downto 0);
			y_in_3			: in 	std_logic_vector(5 downto 0);
			c_in_3			: in 	std_logic_vector(6 downto 0);
			ready_3			: out 	std_logic;

			x_in_4			: in 	std_logic_vector(6 downto 0);
			y_in_4			: in 	std_logic_vector(5 downto 0);
			c_in_4			: in 	std_logic_vector(6 downto 0);
			ready_4			: out 	std_logic;

			x_in_5			: in 	std_logic_vector(6 downto 0);
			y_in_5			: in 	std_logic_vector(5 downto 0);
			c_in_5			: in 	std_logic_vector(6 downto 0);
			ready_5			: out 	std_logic;

			x_in_6			: in 	std_logic_vector(6 downto 0);
			y_in_6			: in 	std_logic_vector(5 downto 0);
			c_in_6			: in 	std_logic_vector(6 downto 0);
			ready_6			: out 	std_logic;
			data_out  		: out   std_logic_vector(6 downto 0);
			clk_out		   	: out   std_logic
		);
	end component send_top;


	component tijd is
   		port( 	clk  			: in    std_logic;
        		reset			: in    std_logic;
			uren			: in 	std_logic_vector(5 downto 0);
			minuten 		: in 	std_logic_vector(6 downto 0);
			x    			: out   std_logic_vector(6 downto 0);
        		y    			: out   std_logic_vector(5 downto 0);
        		c    			: out   std_logic_vector(6 downto 0);
        		ready			: in    std_logic;
			hz_sig			: in 	std_logic
        		);
	end component tijd;
	
	component menu_scherm is
	   	port(	clk    			: in    std_logic;
		        reset   		: in    std_logic;
		        ready   		: in    std_logic;
		        menu    		: in    std_logic_vector(2 downto 0);
				alarm		: in 	std_logic;
		        x_menu 			: out   std_logic_vector(6 downto 0);
		        y_menu  		: out   std_logic_vector(5 downto 0);	
		        c_menu  		: out   std_logic_vector(6 downto 0)
			);
	end component menu_scherm;
	
	component geluid is
	   	port(	clk			: in 	std_logic;
			reset			: in 	std_logic;	
			ready			: in 	std_logic;
			menu			: in 	std_logic_vector (2 downto 0);
			geluid_signaal		: in   	std_logic;
        		x			: out  	std_logic_vector(6 downto 0);
        		y			: out  	std_logic_vector(5 downto 0);
			c			: out 	std_logic_vector(6 downto 0)
			);
	end component geluid;


--signalen
signal clk_1hz, clk, dcf_led, date_ready, beep, licht_sg, lichtje,sound, clk_intermediate:	std_logic;
signal tijd_tijd_tijd : std_logic_vector (12 downto 0);
signal wekkeur : std_logic_vector (15 downto 0);
signal weekdag, menu_plek,par : std_logic_vector (2 downto 0);
signal dag : std_logic_vector (5 downto 0);
signal maand	:	std_logic_vector (4 downto 0);
signal jaar		:	std_logic_vector (7 downto 0);
	signal sync, s_clk: std_logic;
	signal minuut: std_logic_vector(6 downto 0);
	signal uur: std_logic_vector(5 downto 0);
signal datum_datum	:	std_logic_vector (21 downto 0);
	signal ready_tijd, ready_menu, ready_geluid, ready_def, ready_dcf, ready_datum, ready_wek, ready_licht	: std_logic;
	--signal sel	: std_logic_vector(2 downto 0);
	signal x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_f	: std_logic_vector(6 downto 0);
        signal y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_f	: std_logic_vector(5 downto 0);
        signal c_0, c_1, c_2, c_3, c_4, c_5, c_6, c_f	: std_logic_vector(6 downto 0);
	
signal dcf_rise, dcf_fall, new_bit, start_xor: std_logic;
	signal count: std_logic_vector(15 downto 0);
	--signal jaar: std_logic_vector(7 downto 0);
	--signal minuut: std_logic_vector(6 downto 0);
	--signal uur, dag: std_logic_vector(5 downto 0);
	--signal maand: std_logic_vector(4 downto 0);
	--signal weekday, par: std_logic_vector(2 downto 0);
	
	
	--ignal sync, s_clk: std_logic;
	--signal minuut: std_logic_vector(6 downto 0);
	--signal uur: std_logic_vector(5 downto 0);
	signal m_clk: std_logic;
	signal h_clk: std_logic;
	signal sec_ref: std_logic_vector(6 downto 0);

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
	--r_time: ausy_klok_bcd			port map(clk, s_clk, reset, sync, minuut, uur, tijd_tijd_tijd(6 downto 0), tijd_tijd_tijd(12 downto 7));
	
	sec_ref <= "0000000";

	SEC: mod60_clk_bcd port map(clk, s_clk, reset, sync, sec_ref, m_clk);
	MIN: mod60_tel_bcd port map(clk, m_clk, reset, sync, minuut, tijd_tijd_tijd(6 downto 0), h_clk);
	HRS: mod24_tel_bcd port map(clk, h_clk, reset, sync, uur, tijd_tijd_tijd(12 downto 7));

	quickfix1: datefix	port map (clk, reset, date_ready, jaar, maand, dag, weekdag, datum_datum);

	--lcd_toppie : lcd_top port map (clk, reset, tijd_tijd_tijd(12 downto 7), tijd_tijd_tijd(6 downto 0), datum_datum(2 downto 0), datum_datum(8 downto 3), datum_datum (13 downto 9), datum_datum(21 downto 14), dcf_led, wekkeur(15), menu_plek, wekkeur(13), wekkeur(14), clk_1hz, wekkeur(12 downto 7), wekkeur(6 downto 0), data_out, clk_out);
	
	clllkk	: osc10 port map ('1', clk_intermediate, XO, clk);
	bufferd : buf40 port map (XI, clk_intermediate);
	

	lcd_tijd : tijd port map (clk, reset, tijd_tijd_tijd(12 downto 7), tijd_tijd_tijd(6 downto 0), x_0, y_0, c_0, ready_tijd, clk_1hz);
	lcd_m_sch : menu_scherm port map(clk, reset, ready_menu, menu_plek, wekkeur(15), x_1, y_1, c_1);
	lcd_geluid : geluid port map (clk, reset, ready_geluid, menu_plek, wekkeur(13), x_2, y_2, c_2);
	lcd_datum : datum port map (clk, reset, ready_datum, tijd_tijd_tijd(12 downto 7), datum_datum (2 downto 0), datum_datum(8 downto 3), datum_datum(13 downto 9), datum_datum (21 downto 14), x_4, y_4, c_4);
	lcd_wektijd : wektijd port map (clk, reset, ready_wek, menu_plek, wekkeur(12 downto 7), wekkeur(6 downto 0), x_5, y_5, c_5);
	lcd_lichtje: licht port map (clk, reset, ready_licht, menu_plek, wekkeur(14), x_6, y_6, c_6);
	lcd_send	: send_top port map (clk ,reset, x_0, y_0, c_0, ready_tijd, x_1, y_1, c_1, ready_menu, x_2, y_2, c_2, ready_geluid, x_3, y_3, c_3, ready_dcf, x_4, y_4, c_4, ready_datum, x_5, y_5, c_5, ready_wek, x_6, y_6 ,c_6, ready_licht, data_out, clk_out);

-- AND port
	licht_sg <= (lichtje AND wekkeur(15) and wekkeur(14));
	buzzer <= (sound AND wekkeur(15) AND wekkeur(13));
	


end structural;














