-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture structural of wake_up is

component alarm is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        sec       :in    std_logic;
        licht     :in    std_logic;
        pwm_signal:out   std_logic);
end component alarm;

component compare is
   port(clk       	:in  std_logic;
        reset     	:in  std_logic;
        tijd_uur_l 	:in  std_logic_vector(3 downto 0);
	tijd_uur_h 	:in  std_logic_vector(1 downto 0);
        tijd_min_l 	:in  std_logic_vector(3 downto 0);
	tijd_min_h 	:in  std_logic_vector(2 downto 0);
        wekker_uur_l	:in  std_logic_vector(3 downto 0);
	wekker_uur_h	:in  std_logic_vector(1 downto 0);
        wekker_min_l	:in  std_logic_vector(3 downto 0);
	wekker_min_h	:in  std_logic_vector(2 downto 0);
        stop_alarm	:in  std_logic;
        geluid    	:out std_logic;
        licht     	:out std_logic);
end component compare;

component controller is
   port(clk    		:in  std_logic;
        reset  		:in  std_logic;
        knoppen		:in  std_logic_vector(3 downto 0);
        wekker 		:out std_logic_vector(15 downto 0);
        menu_state   	:out std_logic_vector(2 downto 0));
end component controller;

component datefix is
	port(clk	:in  std_logic;
	     reset	:in  std_logic;
	     date_ready	:in  std_logic;
	     jaar	:in  std_logic_vector(7 downto 0);
	     maand	:in  std_logic_vector(4 downto 0);
	     dag	:in  std_logic_vector(5 downto 0);
	     weekdag	:in  std_logic_vector(2 downto 0);
	     datum	:out std_logic_vector(21 downto 0));
end component datefix;

component dcf77_bcd is
    port (clk		:in  std_logic;
	  reset		:in  std_logic;
	  dcf_in	:in  std_logic;
	  dcf_led	:out std_logic;
	  clk_1hz	:out std_logic;
	  minutes	:out std_logic_vector(6 downto 0);
	  hours		:out std_logic_vector(5 downto 0);
	  weekday	:out std_logic_vector(2 downto 0);
	  day		:out std_logic_vector(5 downto 0);
	  month		:out std_logic_vector(4 downto 0);
	  year		:out std_logic_vector(7 downto 0);
	  date_ready	:out std_logic);
end component dcf77_bcd;

component lcd_top is
    port (clk		:in  std_logic;
	  reset		:in  std_logic;
	  uren		:in  std_logic_vector(5 downto 0);
	  minuten 	:in  std_logic_vector(6 downto 0);
	  dagvdweek	:in  std_logic_vector(2 downto 0);
	  dagvdmaand 	:in  std_logic_vector(5 downto 0);
	  maand		:in  std_logic_vector(4 downto 0);
	  jaar 		:in  std_logic_vector(7 downto 0);
	  dcf_debug	:in  std_logic;
	  alarm		:in  std_logic;
	  menu		:in  std_logic_vector(2 downto 0);
	  geluid_signaal:in  std_logic;
	  licht_signaal :in  std_logic;
	  hz_1		:in  std_logic;
	  wektijd_uren	:in  std_logic_vector(5 downto 0);
	  wektijd_min	:in  std_logic_vector(6 downto 0);
    	  data_out  	:out std_logic_vector(6 downto 0);
    	  clk_out   	:out std_logic);
end component lcd_top;

signal clk_1hz, alarmlicht, licht_enable, dcf_led, date_ready: std_logic;
signal minuten: 	std_logic_vector(6 downto 0);
signal uren: 		std_logic_vector(5 downto 0);
signal wekkerdata: 	std_logic_vector(15 downto 0);
signal menu_state: 	std_logic_vector(2 downto 0);
signal weekdag: 	std_logic_vector(2 downto 0);
signal dag: 		std_logic_vector(5 downto 0);
signal maand:		std_logic_vector(4 downto 0);
signal jaar:		std_logic_vector(7 downto 0);
signal datum:		std_logic_vector(21 downto 0);

begin
	tijd_min <= minuten;
	tijd_uur <= uren;
	wek_min <= wekkerdata(6 downto 0);
	wek_uur <= wekkerdata(12 downto 7);
	m_state <= menu_state;
	menu_info <= wekkerdata(15 downto 13);
	clk1hz <= clk_1hz;
	dcfled <= dcf_led;
	date <= datum;

	alarmlicht <= (licht_enable and wekkerdata(15) and wekkerdata(14));
	buzzer <= (sound and wekkerdata(15) and wekkerdata(13));

alarmblok: alarm 	port map (clk, reset, clk_1hz, alarmlicht, led_lamp);
comparing: compare 	port map (clk, reset, uren(3 downto 0), uren(5 downto 4), minuten(3 downto 0), minuten(6 downto 4), wekkerdata(10 downto 7), wekkerdata(12 downto 11), wekkerdata(3 downto 0), wekkerdata(6 downto 4), snooze, sound, licht_enable);
menu_blok: controller 	port map (clk, reset, knoppen, wekkerdata(15 downto 0), menu_state);
quickfix1: datefix	port map (clk, reset, date_ready, jaar, maand, dag, weekdag, datum);
dcf77sync: dcf77_bcd 	port map (clk, reset, dcf_in, dcf_led, clk_1hz, minuten(6 downto 0), uren(5 downto 0), weekdag, dag, maand, jaar, date_ready);
lcdoutput: lcd_top 	port map (clk, reset, uren(5 downto 0), minuten(6 downto 0), datum(2 downto 0), datum(8 downto 3), datum(13 downto 9), datum(21 downto 14), dcf_led, wekkerdata(15), menu_state, wekkerdata(13), wekkerdata(14), clk_1hz, wekkerdata(12 downto 7), wekkerdata(6 downto 0), data_out, clk_out);

end structural;
