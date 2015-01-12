library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tb_compare is
	component compare
		port(	clk       :in    std_logic;
        		reset     :in    std_logic;
        		tijd_uur_l :in    std_logic_vector(3 downto 0);
			tijd_uur_h :in	std_logic_vector(3 downto 0);
        		tijd_min_l :in    std_logic_vector(3 downto 0);
			tijd_min_h :in	std_logic_vector(3 downto 0);
        		wekker_uur_l:in    std_logic_vector(3 downto 0);
			wekker_uur_h:in    std_logic_vector(3 downto 0);
       		 	wekker_min_l:in    std_logic_vector(3 downto 0);
			wekker_min_h:in    std_logic_vector(3 downto 0);
        		stop_alarm:in    std_logic;
        		geluid    :out   std_logic;
        		licht     :out   std_logic);
	end component;
	signal clk:       std_logic;
        signal reset:     std_logic;
        signal tijd_uur_l:  std_logic_vector(3 downto 0);
	signal tijd_uur_h:  std_logic_vector(3 downto 0);
	signal tijd_min_l:  std_logic_vector(3 downto 0);
        signal tijd_min_h:  std_logic_vector(3 downto 0);
        signal wekker_uur_l: std_logic_vector(3 downto 0);
	signal wekker_uur_h: std_logic_vector(3 downto 0);
        signal wekker_min_l: std_logic_vector(3 downto 0);
	signal wekker_min_h: std_logic_vector(3 downto 0);
        signal stop_alarm: std_logic;
        signal geluid:    std_logic;
        signal licht:     std_logic;
begin
	lbl1: compare port map (clk, reset, tijd_uur_l, tijd_uur_h, tijd_min_l, tijd_min_h, wekker_uur_l, wekker_uur_h, wekker_min_l, wekker_min_h, stop_alarm, geluid, licht);
	clk <=  	'1' after 0 ns,
			'0' after 100 ns when clk /= '0' else '1' after 100 ns;
	reset <= 	'1' after 0 ns,
			'0' after 350 ns;
	tijd_uur_l <=	"0011" after 0 ns;
	tijd_uur_h <=	"0000" after 0 ns;
	tijd_min_l <=	"0010" after 0 ns,
			"0011" after 550 ns,
			"0100" after 1050 ns,
			"0101" after 1550 ns,
			"0110" after 2050 ns,
			"0111" after 2550 ns,
			"1000" after 3050 ns,
			"1001" after 3550 ns,
			"0000" after 4050 ns,
			"0001" after 4550 ns,
			"0010" after 5050 ns,
			"0011" after 5550 ns,
			"0100" after 6050 ns,
			"0101" after 6550 ns,
			"0110" after 7050 ns,
			"0111" after 7550 ns,
			"1000" after 8050 ns,
			"1001" after 8550 ns;
	tijd_min_h <=	"0010" after 0 ns,
			"0011" after 4050 ns;
	wekker_uur_l <=	"0011" after 0 ns;
	wekker_uur_h <= "0000" after 0 ns;
	wekker_min_l <=	"1000" after 0 ns;
	wekker_min_h <= "0011" after 0 ns;
	stop_alarm <=	'0' after 0 ns,
			'1' after 9050 ns;
end behaviour;











