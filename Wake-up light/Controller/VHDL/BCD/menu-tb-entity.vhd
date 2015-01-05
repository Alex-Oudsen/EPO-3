--Set the radix to hexadecimal

library IEEE;
use IEEE.std_logic_1164.ALL;

entity menu_tb is
   port(uren   :out   std_logic_vector(5 downto 0); 
        minuten:out   std_logic_vector(6 downto 0));
end menu_tb;
