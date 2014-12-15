library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of menu_scherm_tb is
component menu_scherm
   port(clk     :in    std_logic;
        reset   :in    std_logic;
        ready   :in    std_logic;
        menu    :in    std_logic_vector(2 downto 0);
        x_menu  :out   std_logic_vector(6 downto 0);
        y_menu  :out   std_logic_vector(5 downto 0);
        c_menu  :out   std_logic_vector(6 downto 0);
        x_streep:out   std_logic_vector(6 downto 0);
        y_streep:out   std_logic_vector(5 downto 0);
        c_streep:out   std_logic_vector(6 downto 0));
end component;

signal clk, reset, ready: std_logic;
signal menu: std_logic_vector (2 downto 0);
signal x_menu, x_streep, c_menu, c_streep: std_logic_vector (6 downto 0);
signal y_menu, y_streep: std_logic_vector (5 downto 0);

begin



end behaviour;

