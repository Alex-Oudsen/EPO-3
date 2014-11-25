library IEEE;
use IEEE.std_logic_1164.ALL;

entity fifo is
   port(push  :in    std_logic;
        pop   :in    std_logic;
        reset :in    std_logic;
        clk   :in    std_logic;
       	address:out	std_logic_vector(2 downto 0);
	we	:out	std_logic;
	do	:out	std_logic;
        full  :out   std_logic;
        empty :out   std_logic;
        nopop :out   std_logic;
        nopush:out   std_logic);
end fifo;


