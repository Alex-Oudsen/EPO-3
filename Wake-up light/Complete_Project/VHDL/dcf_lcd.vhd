library IEEE;
use IEEE.std_logic_1164.ALL;

entity dcf_lcd is
   port(clk      :in    std_logic;
        reset    :in    std_logic;
        ready    :in    std_logic;
        dcf_debug:in    std_logic;
        x        :out   std_logic_vector(6 downto 0);
        y        :out   std_logic_vector(5 downto 0);
        c        :out   std_logic_vector(6 downto 0));
end dcf_lcd;


