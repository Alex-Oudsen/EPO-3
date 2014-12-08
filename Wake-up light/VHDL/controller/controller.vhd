library IEEE;
use IEEE.std_logic_1164.ALL;

entity controller is
   port(clk    :in    std_logic;
        reset  :in    std_logic;
        knoppen:in    std_logic_vector(3 downto 0);
        wekker :out   std_logic_vector(13 downto 0);
        menu   :out   std_logic_vector(2 downto 0));
end controller;

