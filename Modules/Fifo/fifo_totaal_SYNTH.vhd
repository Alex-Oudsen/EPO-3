
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of fifo_totaal is

   component ram
      port( dIn : in std_logic_vector (7 downto 0);  we, do : in std_logic;  
            address : in std_logic_vector (2 downto 0);  reset, clk : in 
            std_logic;  dOut : out std_logic_vector (7 downto 0));
   end component;
   
   component fifo
      port( push, pop, reset, clk : in std_logic;  address : out 
            std_logic_vector (2 downto 0);  we, do, full, empty, nopop, nopush 
            : out std_logic);
   end component;
   
   signal address_2_port, address_1_port, address_0_port, we, do : std_logic;

begin
   
   fifo_1 : fifo port map( push => push, pop => pop, reset => reset, clk => clk
                           , address(2) => address_2_port, address(1) => 
                           address_1_port, address(0) => address_0_port, we => 
                           we, do => do, full => full, empty => empty, nopop =>
                           nopop, nopush => nopush);
   ram_1 : ram port map( dIn(7) => dIn(7), dIn(6) => dIn(6), dIn(5) => dIn(5), 
                           dIn(4) => dIn(4), dIn(3) => dIn(3), dIn(2) => dIn(2)
                           , dIn(1) => dIn(1), dIn(0) => dIn(0), we => we, do 
                           => do, address(2) => address_2_port, address(1) => 
                           address_1_port, address(0) => address_0_port, reset 
                           => reset, clk => clk, dOut(7) => dOut(7), dOut(6) =>
                           dOut(6), dOut(5) => dOut(5), dOut(4) => dOut(4), 
                           dOut(3) => dOut(3), dOut(2) => dOut(2), dOut(1) => 
                           dOut(1), dOut(0) => dOut(0));

end synthesised;



