library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of fifo_totaal is
component fifo
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
end component;
component ram
	 port(dIn    :in    std_logic_vector(7 downto 0);
        we     :in    std_logic;
        do     :in    std_logic;
        address:in    std_logic_vector(2 downto 0);
	reset  :in	   std_logic;
	clk    :in	   std_logic;
        dOut   :out   std_logic_vector(7 downto 0));
end component;
signal we,do : std_logic;
signal address : std_logic_vector (2 downto 0);
begin
	fifo_1 : fifo port map (push => push, pop => pop, reset => reset, clk => clk, full => full, empty => empty, nopop => nopop, nopush => nopush, we => we, do => do, address => address);
	ram_1 : ram port map (dIn => dIn, we => we, do => do, address => address, reset => reset, clk => clk, dOut => dOut);

end behaviour;





