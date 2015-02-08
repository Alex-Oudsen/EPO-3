library ieee;
use ieee.std_logic_1164.all;

library CellsLib;
use CellsLib.buf40;
use CellsLib.osc10;

architecture structural of wake_up is

	component osc10 is
	   port(e:		in  std_logic;
		f:	out std_logic;
		xi:	in  std_logic;
		xo:	inout std_logic);
	end component osc10;

	component buf40 is
	   port(a:		in  std_logic;
		y:	out std_logic);
	end component buf40;

	component debugger is
	   port(clk		  :in    std_logic;
		reset	  :in    std_logic;
		switches  :in    std_logic_vector(2 downto 0);
	     	clk_1hz	  :in	 std_logic;
	    	dcf_led	  :in	 std_logic;
            	 	menu_info :in    std_logic_vector(2 downto 0);
	     	menu_state:in    std_logic_vector(2 downto 0);
             		tijd_uren :in    std_logic_vector(5 downto 0);
             		tijd_min  :in    std_logic_vector(6 downto 0);
             		wek_uren  :in    std_logic_vector(5 downto 0);
             		wek_min   :in    std_logic_vector(6 downto 0);
             		weekdag   :in    std_logic_vector(2 downto 0);
             		dag       :in    std_logic_vector(5 downto 0);
             		maand     :in    std_logic_vector(4 downto 0);
             		jaar      :in    std_logic_vector(7 downto 0);
             		output    :out   std_logic_vector(7 downto 0));
	end component debugger;

	component alarm is
	   port(clk       			: in  std_logic;
	        reset     			: in  std_logic;
	        sec       			: in  std_logic;
		start_alarm		: in  std_logic;
		stop_alarm		: in  std_logic;
		tijd_uren		: in  std_logic_vector(5 downto 0);
		tijd_min		: in  std_logic_vector(6 downto 0);
		wek_uren		: in  std_logic_vector(5 downto 0);
		wek_min		: in  std_logic_vector(6 downto 0);
	        geluid     			: out std_logic;
	        pwm_signal			: out std_logic);
	end component alarm;

	component controller is
	   port(clk    			: in  std_logic;
	        reset  			: in  std_logic;
	        knoppen			: in  std_logic_vector(3 downto 0);
	        wekker 			: out std_logic_vector(15 downto 0);
	        menu_state   			: out std_logic_vector(2 downto 0));
	end component controller;

	component dcf77_bcd is
	    port (clk			: in  std_logic;
		  reset		: in  std_logic;
		  dcf_in		: in  std_logic;
		  dcf_led		: out std_logic;
		  clk_1hz		: out std_logic;
		  minutes		: out std_logic_vector(6 downto 0);
		  hours		: out std_logic_vector(5 downto 0);
		  weekday		: out std_logic_vector(2 downto 0);
		  day		: out std_logic_vector(5 downto 0);
		  month		: out std_logic_vector(4 downto 0);
		  year		: out std_logic_vector(7 downto 0);
		  date_ready		: out std_logic);
	end component dcf77_bcd;

	component lcd_top is
	    port (clk			: in  std_logic;
		  reset		: in  std_logic;
		  geluid_signaal: in  std_logic;
		  licht_signaal : in  std_logic;
		  alarm		: in  std_logic;
		  dcf_debug		: in  std_logic;
		  hz_1		: in  std_logic;
		  date_ready		: in  std_logic;
		  uren		: in  std_logic_vector(5 downto 0);
		  minuten 		: in  std_logic_vector(6 downto 0);
		  dagvdweek		: in  std_logic_vector(2 downto 0);
		  dagvdmaand 		: in  std_logic_vector(5 downto 0);
		  maand		: in  std_logic_vector(4 downto 0);
		  jaar 		: in  std_logic_vector(7 downto 0);
		  wektijd_uren		: in  std_logic_vector(5 downto 0);
		  wektijd_min		: in  std_logic_vector(6 downto 0);
		  menu		: in  std_logic_vector(2 downto 0);
	    	  data_out  		: out std_logic_vector(6 downto 0);
	    	  clk_out   		: out std_logic);
	end component lcd_top;

	signal clk_int, clk, clk_1hz, dcf_led, dready, led_pwm, sound: std_logic;
	signal wekkerdata: std_logic_vector(15 downto 0);
	signal menu_state: std_logic_vector(2 downto 0);
	signal minuten: 	  std_logic_vector(6 downto 0);
	signal uren: 		   std_logic_vector(5 downto 0);
	signal weekdag:    std_logic_vector(2 downto 0);
	signal dag: 		   std_logic_vector(5 downto 0);
	signal maand: 	    std_logic_vector(4 downto 0);
	signal jaar:		   std_logic_vector(7 downto 0);

begin
	led_lamp <= led_pwm and wekkerdata(14);
	buzzer <= sound and wekkerdata(13);

	clkristal: osc10		    port map ('1', clk, clk_int, xo);
	buffertje: buf40		    port map (xi, clk_int);
	debug_mux: debugger	  port map (clk, reset, schakelaars, clk_1hz, dcf_led, wekkerdata(15 downto 13), menu_state, uren, minuten, wekkerdata(12 downto 7), wekkerdata(6 downto 0), weekdag, dag, maand, jaar, debug_out);
	alarmblok: alarm 		   port map (clk, reset, clk_1hz, wekkerdata(15), snooze, uren, minuten, wekkerdata(12 downto 7), wekkerdata(6 downto 0), sound, led_pwm);
	menu_blok: controller port map (clk, reset, knoppen, wekkerdata, menu_state);
	dcf77sync: dcf77_bcd 	port map (clk, reset, dcf_in, dcf_led, clk_1hz, minuten, uren, weekdag, dag, maand, jaar, dready);
	lcdoutput: lcd_top 		 port map (clk, reset, wekkerdata(13), wekkerdata(14), wekkerdata(15), dcf_led, clk_1hz, dready, uren, minuten, weekdag, dag, maand, jaar, wekkerdata(12 downto 7), wekkerdata(6 downto 0), menu_state, data_out, clk_out);

end structural;


