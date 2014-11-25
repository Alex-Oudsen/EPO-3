library IEEE;
use IEEE.std_logic_1164.ALL;

entity fifo_totaal is
   port(push  :in    std_logic;
        pop   :in    std_logic;
        reset :in    std_logic;
        clk   :in    std_logic;
        dIn   :in    std_logic_vector(7 downto 0);
        dOut  :out   std_logic_vector(7 downto 0);
        full  :out   std_logic;
        empty :out   std_logic;
        nopop :out   std_logic;
        nopush:out   std_logic);
end fifo_totaal;


