library IEEE;
use IEEE.std_logic_1164.ALL;

entity ram is
   port(dIn    :in    std_logic_vector(7 downto 0);
        we     :in    std_logic;
        do     :in    std_logic;
        address:in    std_logic_vector(2 downto 0);
	reset  :in	   std_logic;
	clk    :in	   std_logic;
        dOut   :out   std_logic_vector(7 downto 0));
end ram;





