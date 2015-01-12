-- Joran Out, 4331958 & Rens Hamburger 4292936
-- Dit is de top-level beschrijving van
-- de bcd versie van het LCD blok

-- Er wordt gebruik gebmaakt van de volgende subblokken:
-- datum, dcf, geluid, licht, menu, sender, tijd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of lcd_top is

	component sender is
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
			clk_out		   	: out   std_logic;
			selector  		: out   std_logic_vector(2 downto 0)
		);
	end component sender;


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
				alarm			: in 	std_logic;
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

	signal ready_tijd, ready_menu, ready_geluid, ready_def, ready_dcf, ready_datum, ready_wek, ready_licht	: std_logic;
	signal sel	: std_logic_vector(2 downto 0);
	signal x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_f	: std_logic_vector(6 downto 0);
        signal y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_f	: std_logic_vector(5 downto 0);
        signal c_0, c_1, c_2, c_3, c_4, c_5, c_6, c_f	: std_logic_vector(6 downto 0);
begin
	lbl_tijd: tijd			port map(clk, reset, uren, minuten, x_0, y_0, c_0, ready_tijd, hz_1);
	mscherm: menu_scherm		port map(clk, reset, ready_menu, menu, alarm, x_1, y_1, c_1);
	gel: geluid			port map(clk, reset, ready_geluid, menu, geluid_signaal, x_2, y_2, c_2);
	leddcf: dcf_lcd			port map(clk, reset, ready_dcf, dcf_debug, x_3, y_3, c_3);
	lcddat: datum			port map(clk, reset, ready_datum, uren, dagvdweek, dagvdmaand, maand, jaar, x_4, y_4, c_4);
	wktijd: wektijd			port map(clk, reset, ready_wek, menu, wektijd_uren, wektijd_min, x_5, y_5, c_5);
	lichtje: licht			port map(clk, reset, ready_licht, menu, licht_signaal, x_6, y_6, c_6);
	sender_pm: sender 		port map(clk ,reset, x_0, y_0, c_0, ready_tijd, x_1, y_1, c_1, ready_menu, x_2, y_2, c_2, ready_geluid, x_3, y_3, c_3, ready_dcf, x_4, y_4, c_4, ready_datum, x_5, y_5, c_5, ready_wek, x_6, y_6 ,ready_licht, data_out, clk_out);
end structure;








