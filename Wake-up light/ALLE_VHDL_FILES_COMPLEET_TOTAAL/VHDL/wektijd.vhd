library IEEE;
use IEEE.std_logic_1164.ALL;

entity wektijd is
   port(clk         :in    std_logic;
        reset       :in    std_logic;
	ready       :in    std_logic;
	menu	    :in    std_logic_vector(2 downto 0);
        wektijd_uren:in    std_logic_vector(5 downto 0);
        wektijd_min :in    std_logic_vector(6 downto 0);
        x           :out   std_logic_vector(6 downto 0);
        y           :out   std_logic_vector(5 downto 0);
        c           :out   std_logic_vector(6 downto 0));
end wektijd;


