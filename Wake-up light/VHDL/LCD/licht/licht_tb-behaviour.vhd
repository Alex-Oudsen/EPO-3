library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of licht_tb is
	component licht
		port(	clk:	in  std_logic;
			reset:	in  std_logic;
			ready:	in  std_logic;
			menu: 	in  std_logic_vector (2 downto 0);
			licht_signaal:	in  std_logic;
			x:	out std_logic_vector (6 downto 0);
			y:	out std_logic_vector (5 downto 0);
			c:	out std_logic_vector (6 downto 0));
	end component;

	signal clk: std_logic;
	signal reset: std_logic;
	signal ready: std_logic;
	signal menu: std_logic_vector (2 downto 0);
	signal licht_signaal: std_logic;
	signal x: std_logic_vector (6 downto 0);
	signal y: std_logic_vector (5 downto 0);
	signal c: std_logic_vector (6 downto 0);


begin
lbl1: licht port map (clk, reset, ready, menu, licht_signaal, x, y, c);

clk <=	'1' after 0 ns,
	'0' after 100 ns when clk /= '0' else '1' after 100 ns;
reset <='1' after 0 ns,
	'0' after 200 ns;
licht_signaal<='1' after 0 ns,
	'0' after 450 ns,
	'1' after 950 ns,
	'0' after 1450 ns,
	'1' after 1950 ns,
	'0' after 2450 ns,
	'1' after 2950 ns;
menu<=	"000" after 0 ns,
	"011" after 250 ns,
	"001" after 1250 ns,
	"011" after 1950 ns;
ready<=	'0' after 0 ns,
	'1' after 150 ns,
	'0' after 450 ns,
	'1' after 650 ns,
	'0' after 950 ns,
	'1' after 1450 ns,
	'0' after 1950 ns,
	'1' after 2250 ns,
	'0' after 2850 ns;
end behaviour;

