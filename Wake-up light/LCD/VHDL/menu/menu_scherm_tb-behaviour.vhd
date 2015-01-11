library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of menu_scherm_tb is
component menu_scherm
   port(clk     :in    std_logic;
        reset   :in    std_logic;
        ready   :in    std_logic;
        menu    :in    std_logic_vector(2 downto 0);
	alarm	:in    std_logic;
        x_menu  :out   std_logic_vector(6 downto 0);
        y_menu  :out   std_logic_vector(5 downto 0);
        c_menu  :out   std_logic_vector(6 downto 0));
end component;

signal clk, reset, ready: std_logic;
signal menu: std_logic_vector (2 downto 0);
signal x_menu, c_menu: std_logic_vector (6 downto 0);
signal y_menu: std_logic_vector (5 downto 0);
signal alarm : std_logic;

begin
lbl1: menu_scherm port map (clk, reset, ready, menu, alarm, x_menu, y_menu, c_menu);

clk <=	'1' after 0 ns,
	'0' after 100 ns when clk /= '0' else '1' after 100 ns;
reset <='1' after 0 ns,
	'0' after 200 ns;
ready <='1' after 0 ns,
	'0' after 250 ns when ready /= '0' else '1' after 250 ns;
menu <=	"001" after 0 ns,
	"010" after 350 ns,
	"001" after 750 ns,
	"011" after 950 ns,
	"100" after 1550 ns,
	"000" after 1850 ns,
	"010" after 2050 ns;
alarm <= '0';
end behaviour;

