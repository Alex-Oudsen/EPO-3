library ieee;
use ieee.std_logic_1164.all;

architecture structure of lcd_top is

	component send_bus is
		port(clk		: in  std_logic;
		     reset 		: in  std_logic;
		     send_ok		: in  std_logic;
		     selector		: in  std_logic_vector(2 downto 0);
		     position_0 : in  std_logic_vector(2 downto 0);
		     position_1 : in  std_logic_vector(2 downto 0);
		     position_2 : in  std_logic_vector(2 downto 0);
		     c_in_0		: in  std_logic_vector(3 downto 0);
		     c_in_1		: in  std_logic_vector(4 downto 0);
		     c_in_2		: in  std_logic_vector(3 downto 0);
		     c_in_3		: in  std_logic_vector(2 downto 0);
		     c_in_4		: in  std_logic_vector(1 downto 0);
		     c_in_5		: in  std_logic_vector(1 downto 0);
		     c_in_6		: in  std_logic_vector(1 downto 0);
	             x_out			: out std_logic_vector(6 downto 0);
	             y_out			: out std_logic_vector(5 downto 0);
	             c_out			: out std_logic_vector(5 downto 0);
		     ready_0		: out std_logic;
		     ready_1		: out std_logic;
		     ready_2		: out std_logic;
		     ready_3		: out std_logic;
		     ready_4		: out std_logic;
		     ready_5		: out std_logic;
		     ready_6		: out std_logic);
	end component send_bus;

	component send_control is
		port(clk		: in  std_logic;
	             reset      : in  std_logic;
	             x          : in  std_logic_vector(6 downto 0);
	             y          : in  std_logic_vector(5 downto 0);
	             c          : in  std_logic_vector(5 downto 0);
		     selector   : out std_logic_vector(2 downto 0);
	             data_out   : out std_logic_vector(6 downto 0);
	             clk_out    : out std_logic;
		     send_ok		: out std_logic);
	end component send_control;

	component tijd is
		port(clk		: in  std_logic;
   	     	     reset		: in  std_logic;
	             ready			: in  std_logic;
		     hz_sig		: in  std_logic;
		     uren		: in  std_logic_vector(5 downto 0);
		     minuten		: in  std_logic_vector(6 downto 0);
		     position		: out std_logic_vector(2 downto 0);
	             lcd_tijd			: out std_logic_vector(3 downto 0));
	end component tijd;

	component datum is	
		port(clk		: in  std_logic;
		     reset		: in  std_logic;
		     ready		: in  std_logic;
		     date_ready : in  std_logic;
		     dagvdweek		: in  std_logic_vector(2 downto 0);
		     dagvdmaand : in  std_logic_vector(5 downto 0);
		     maand		: in  std_logic_vector(4 downto 0);
		     jaar 		: in  std_logic_vector(7 downto 0);
		     position		: out std_logic_vector(2 downto 0);
		     lcd_datum		: out std_logic_vector(4 downto 0));
	end component datum; 

	component wektijd is
		port(clk         			: in  std_logic;
	             reset       				: in  std_logic;
		     ready       			: in  std_logic;
		     menu	    		: in  std_logic_vector(2 downto 0);
	             wektijd_uren				: in  std_logic_vector(5 downto 0);
	             wektijd_min 				: in  std_logic_vector(6 downto 0);
	             position       				: out std_logic_vector(2 downto 0);
	             lcd_wektijd    				: out std_logic_vector(3 downto 0));
	end component wektijd;
	
	component menu_scherm is
		port(clk		: in  std_logic;
	             reset   			: in  std_logic;
	             ready   			: in  std_logic;
		     alarm		: in  std_logic;
	             menu    			: in  std_logic_vector(2 downto 0);
	             lcd_menu			: out std_logic_vector(2 downto 0));
	end component menu_scherm;

	component dcf_lcd is
		port(clk		: in  std_logic;
	             reset			: in  std_logic;
	             ready			: in  std_logic;
	             dcf_debug		: in  std_logic;
	             lcd_dcf  		: out std_logic_vector(1 downto 0));
	end component dcf_lcd;
	
	component geluid is
		port(clk			: in  std_logic;
		     reset			: in  std_logic;	
		     ready			: in  std_logic;
		     geluid_signaal			: in  std_logic;
		     menu			: in  std_logic_vector(2 downto 0);
		     lcd_geluid 			: out std_logic_vector(1 downto 0));
	end component geluid;

	component licht is
		port(clk          	: in  std_logic;
	             reset        	: in  std_logic;
	             ready        	: in  std_logic;
	             licht_signaal	: in  std_logic;
	             menu         	: in  std_logic_vector(2 downto 0);
	             lcd_licht    	: out std_logic_vector(1 downto 0));
	end component licht;

	signal ready_tijd, ready_datum, ready_wektijd, ready_menu_scherm, ready_dcf_lcd, ready_geluid, ready_licht, ok: std_logic;
	signal sel, pos_0, pos_1, pos_2, c_3: std_logic_vector(2 downto 0);
	signal c_4, c_5, c_6: std_logic_vector(1 downto 0); 
        signal y_f, c_f: std_logic_vector(5 downto 0);
	signal c_0, c_2: std_logic_vector(3 downto 0);
	signal c_1: std_logic_vector(4 downto 0);
	signal x_f: std_logic_vector(6 downto 0);

begin
	lcd_sendbus: send_bus	   	port map(clk, reset, ok, sel, pos_0, pos_1, pos_2, c_0, c_1, c_2, c_3, c_4, c_5, c_6, x_f, y_f, c_f, ready_tijd, ready_datum, ready_wektijd, ready_menu_scherm, ready_dcf_lcd, ready_geluid, ready_licht);
	lcd_sndctrl: send_control	port map(clk, reset, x_f, y_f, c_f, sel, data_out, clk_out, ok);
	lcd_tijd: 	  tijd		  port map(clk, reset, ready_tijd, hz_1, uren, minuten, pos_0, c_0);
	lcd_datum:   datum			  port map(clk, reset, ready_datum, date_ready, dagvdweek, dagvdmaand, maand, jaar, pos_1, c_1);
	lcd_wektijd: wektijd			  port map(clk, reset, ready_wektijd, menu, wektijd_uren, wektijd_min, pos_2, c_2);
	lcd_menu:    menu_scherm	 port map(clk, reset, ready_menu_scherm, alarm, menu, c_3);
	lcd_dcf_led: dcf_lcd			  port map(clk, reset, ready_dcf_lcd, dcf_debug, c_4);
	lcd_geluid:  geluid			  port map(clk, reset, ready_geluid, geluid_signaal, menu, c_5);
	lcd_licht:   licht			  port map(clk, reset, ready_licht, licht_signaal, menu, c_6);
end structure;


