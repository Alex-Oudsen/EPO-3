-- Joran Out, 4331958
-- Dit is de top-level beschrijving van
-- de bcd versie van het LCD blok

-- Er wordt gebruik gebmaakt van de volgende subblokken:
-- datum, dcf, geluid, licht, menu, sender, tijd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of lcd_top is
	component datum is	
		port(
			clk			: in 	std_logic;
			reset			: in 	std_logic;
			ready			: in 	std_logic;
			tijd_uren 		: in 	std_logic_vector (4 downto 0); 
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

	component menu_scherm is
	   	port(	clk    			: in    std_logic;
		        reset   		: in    std_logic;
		        ready   		: in    std_logic;
		        menu    		: in    std_logic_vector(2 downto 0);
		        x_menu 			: out   std_logic_vector(6 downto 0);
		        y_menu  		: out   std_logic_vector(5 downto 0);	
		        c_menu  		: out   std_logic_vector(6 downto 0)
			);
	end component vmenu_scherm;

	component send_bus is
  	 	port(	clk 	 		: in    std_logic;
        		reset			: in    std_logic;
			selector		: in 	std_logic_vector(2 downto 0);
       		 	x_out			: out   std_logic_vector(6 downto 0);
        		y_out			: out   std_logic_vector(5 downto 0);
        		c_out			: out   std_logic_vector(6 downto 0);

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
			ready_5			: out 	std_logic
			);
	end component send_bus;

	entity send_control is
	   	port(	clk       		: in    std_logic;
	   		reset     		: in    std_logic;
	        	data_out  		: out   std_logic_vector(6 downto 0);
	        	clk_out   		: out   std_logic;
			selector  		: out   std_logic_vector(2 downto 0);
	        	x         		: in    std_logic_vector(6 downto 0);
	        	y         		: in    std_logic_vector(5 downto 0);
	        	c         		: in    std_logic_vector(6 downto 0)
	       		);
	end component send_control;


	entity tijd is
   		port( 	clk  			: in    std_logic;
        		reset			: in    std_logic;
			uren			: in 	std_logic_vector(4 downto 0);
			minuten 		: in 	std_logic_vector(5 downto 0);
			x    			: out   std_logic_vector(6 downto 0);
        		y    			: out   std_logic_vector(5 downto 0);
        		c    			: out   std_logic_vector(6 downto 0);
        		ready			: in    std_logic;
			hz_sig			: in 	std_logic
        		);
end tijd;




--	signal sync, s_clk: std_logic;
--	signal minuut: std_logic_vector(6 downto 0);
--	signal uur: std_logic_vector(5 downto 0);
--
--begin
--	date_ready <= sync;
--	clk_1hz <= s_clk;
--
--	sytime: synctime			port map(clk, reset, dcf_in, dcf_led, sync, minuut, uur, weekday, day, month, year);
--	divide: klokdeler    			port map(clk, reset, s_clk);
--	r_time: ausy_klok_bcd			port map(clk, s_clk, reset, sync, minuut, uur, minutes, hours);
--
end structure;


