-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity bcd2bin is
   port(clk    :in    std_logic;	-- 32 kHz systeemklok
        reset  :in    std_logic;	-- Systeemreset
        start  :in    std_logic;	-- Enable signaal voor bcd2bin
        bcd_in :in    std_logic_vector(7 downto 0);
        bin_out:out   std_logic_vector(6 downto 0);
        ready  :out   std_logic);	-- Ready signaal van bcd2bin
end bcd2bin;
