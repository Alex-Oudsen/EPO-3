
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of send_top is

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
			ready_5			: out 	std_logic;

			x_in_6			: in 	std_logic_vector(6 downto 0);
			y_in_6			: in 	std_logic_vector(5 downto 0);
			c_in_6			: in 	std_logic_vector(6 downto 0);
			ready_6			: out 	std_logic
			);
	end component send_bus;

	component send_control is
	   	port(	clk       		: in    std_logic;
	   		reset     		: in    std_logic;
	        	x         		: in    std_logic_vector(6 downto 0);
	        	y         		: in    std_logic_vector(5 downto 0);
	        	c         		: in    std_logic_vector(6 downto 0);
			data_out  		: out   std_logic_vector(6 downto 0);
	        	clk_out   		: out   std_logic;
			selector  		: out   std_logic_vector(2 downto 0)
	       		);
	end component send_control;
	--signal ready_tijd, ready_menu, ready_geluid, ready_def, ready_dcf, ready_datum, ready_wek, ready_licht	: std_logic;
	signal sel	: std_logic_vector(2 downto 0);
	--signal x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_f	: std_logic_vector(6 downto 0);
    --    signal y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_f	: std_logic_vector(5 downto 0);
    --    signal c_0, c_1, c_2, c_3, c_4, c_5, c_6, c_f	: std_logic_vector(6 downto 0);
	signal x_f,c_f : std_logic_vector(6 downto 0);
	signal y_f	: std_logic_vector(5 downto 0);
begin
	sbus: send_bus			port map(clk, reset, sel, x_f, y_f, c_f, x_in_0, y_in_0, c_in_0, ready_0, x_in_1, y_in_1, c_in_1, ready_1, x_in_2, y_in_2, c_in_2, ready_2, x_in_3, y_in_3, c_in_3, ready_3, x_in_4, y_in_4, c_in_4, ready_4, x_in_5, y_in_5, c_in_5, ready_5, x_in_6, y_in_6, c_in_6, ready_6);
	scontrol: send_control		port map(clk, reset, x_f, y_f, c_f, data_out, clk_out, sel) ;
end structure;












