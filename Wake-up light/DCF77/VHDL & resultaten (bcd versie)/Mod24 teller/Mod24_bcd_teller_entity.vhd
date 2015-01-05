-- Joran Out, 4331958 & Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity mod24_tel_bcd is
   port(clk     :in    std_logic; -- 32 kHz systeemklok
        clk_in  :in    std_logic; -- 1/3600 Hz lokale klok
        reset   :in    std_logic; -- Systeemreset
        sync_now:in    std_logic; -- Enable signaal voor synchronisatie
        ref     :in    std_logic_vector(5 downto 0);	-- Tijdsreferentie (uren)
        count   :out   std_logic_vector(5 downto 0));	-- Teller met huidig aantal uren
end mod24_tel_bcd;
