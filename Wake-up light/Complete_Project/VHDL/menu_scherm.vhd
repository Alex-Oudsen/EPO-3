library IEEE;
use IEEE.std_logic_1164.ALL;

entity menu_scherm is
   port(clk     :in    std_logic;
        reset   :in    std_logic;
        ready   :in    std_logic;
        menu    :in    std_logic_vector(2 downto 0);
		alarm	:in    std_logic;
        x_menu  :out   std_logic_vector(6 downto 0);
        y_menu  :out   std_logic_vector(5 downto 0);
        c_menu  :out   std_logic_vector(6 downto 0));
end menu_scherm;












