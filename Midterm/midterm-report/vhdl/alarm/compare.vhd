library IEEE;
use IEEE.std_logic_1164.ALL;

entity compare is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        tijd_uur  :in    std_logic_vector(4 downto 0);
        tijd_min  :in    std_logic_vector(5 downto 0);
        wekker_uur:in    std_logic_vector(4 downto 0);
        wekker_min:in    std_logic_vector(5 downto 0);
        stop_alarm:in    std_logic;
        geluid    :out   std_logic;
        licht     :out   std_logic);
end compare;


