library IEEE;
use IEEE.std_logic_1164.ALL;

entity tijd is
   port(clk  :in    std_logic;
        reset:in    std_logic;
	uren: in std_logic_vector(5 downto 0);
	minuten : in std_logic_vector(6 downto 0);
	x    :out   std_logic_vector(6 downto 0);
        y    :out   std_logic_vector(5 downto 0);
        c    :out   std_logic_vector(6 downto 0);
        ready:in    std_logic;
	hz_sig:in std_logic
        );
end tijd;





