library ieee;
use ieee.std_logic_1164.all;

architecture structure of alarm is

	component compare is
		port(clk       		 : in  std_logic;
	             reset     			: in  std_logic;
		     start_alarm  : in  std_logic;
	             stop_alarm			: in  std_logic;
	             tijd_uur_l 		: in  std_logic_vector(3 downto 0);
		     tijd_uur_h 		: in	std_logic_vector(1 downto 0);
	             tijd_min_l 		: in  std_logic_vector(3 downto 0);
		     tijd_min_h 		: in	std_logic_vector(2 downto 0);
	             wekker_uur_l	: in  std_logic_vector(3 downto 0);
		     wekker_uur_h	: in  std_logic_vector(1 downto 0);
	             wekker_min_l	: in  std_logic_vector(3 downto 0);
		     wekker_min_h	: in  std_logic_vector(2 downto 0);
	             geluid    			: out std_logic;
	             licht     			: out std_logic);
	end component compare;

	component counter
		port(clk   	: in  std_logic;
        		     reset 	: in  std_logic;
        		     sec   	: in  std_logic;
		     licht 	: in  std_logic;
        		     length	: out std_logic_vector(5 downto 0));
	end component counter;

	component pwm
		port(clk   		: in  std_logic;
        		     reset 		: in  std_logic;
		     licht 		: in  std_logic;
        		     length		: in  std_logic_vector(5 downto 0);
        		     pwm_signal : out std_logic);
	end component;

	signal time_ul, time_ml, wek_ul, wek_ml: std_logic_vector(3 downto 0);
	signal time_mh, wek_mh: std_logic_vector(2 downto 0);
	signal time_uh, wek_uh: std_logic_vector(1 downto 0);
	signal lengte: std_logic_vector (5 downto 0);
	signal licht: std_logic;

begin
	time_ul <= tijd_uren(3 downto 0);
	time_uh <= tijd_uren(5 downto 4);
	time_ml <= tijd_min(3 downto 0);
	time_mh <= tijd_min(6 downto 4);
	wek_ul <= wek_uren(3 downto 0);
	wek_uh <= wek_uren(5 downto 4);
	wek_ml <= wek_min(3 downto 0);
	wek_mh <= wek_min(6 downto 4);

	compr: compare port map(clk, reset, start_alarm, stop_alarm, time_ul, time_uh, time_ml, time_mh, wek_ul, wek_uh, wek_ml, wek_mh, geluid, licht);
	count: counter port map(clk, reset, sec, licht, lengte);
	pwm_1: pwm     port map(clk, reset, licht, lengte, pwm_signal);

end structure;


