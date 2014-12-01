library IEEE;
use IEEE.std_logic_1164.ALL;

entity menu is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        knoppen   :in    std_logic_vector(3 downto 0);
        wekdata_in:in    std_logic_vector(13 downto 0);
        wektijd   :out   std_logic_vector(10 downto 0);
        wekker    :out   std_logic;
        select_bit:out   std_logic;
        data_out  :out   std_logic_vector(1 downto 0));
end menu;


