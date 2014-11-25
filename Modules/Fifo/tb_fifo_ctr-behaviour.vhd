library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tb_fifo_ctr is
	component fifo
		port (push  :in    std_logic;
        			pop   :in    std_logic;
        			reset :in    std_logic;
        			clk   :in    std_logic;
			address:out	std_logic_vector(2 downto 0);
			we	:out	std_logic;
			do	:out	std_logic;
        			full  :out   std_logic;
        			empty :out   std_logic;
        			nopop :out   std_logic;
        			nopush:out   std_logic);
	end component;
	signal push:  std_logic;
        signal pop :      std_logic;
        signal reset :    std_logic;
        signal clk   :   std_logic;
	signal address:	std_logic_vector(2 downto 0);
	signal we	:	std_logic;
	signal do	:	std_logic;
        signal full  :   std_logic;
        signal empty :   std_logic;
        signal nopop :   std_logic;
        signal nopush:   std_logic;
begin
	lbl1: fifo port map (push, pop, reset, clk, address, we, do, full, empty, nopop, nopush);
	clk <=  '1' after 0 ns,
		'0' after 100 ns when clk /= '0' else '1' after 100 ns;
	reset <= '1' after 0 ns,
		'0' after 200 ns;
	push <= '0' after 0 ns,
		'1' after 550 ns,
		'0' after 950 ns,
		'1' after 1950 ns;
	pop <= 	'0' after 0 ns,
		'1' after 950 ns,
		'0' after 1750 ns,
		'1' after 3050 ns;
end behaviour;


