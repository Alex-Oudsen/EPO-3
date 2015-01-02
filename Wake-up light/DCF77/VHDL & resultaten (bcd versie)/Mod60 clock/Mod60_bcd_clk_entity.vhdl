-- Joran Out, 4331958 & Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity mod60_clk_bcd is
   port(clk     :in    std_logic;  -- 32 kHz systeemklok
        clk_in  :in    std_logic;  -- Sturende klok(lokaal gegenereerd)
        reset   :in    std_logic;  -- Systeemreset
        sync_now:in    std_logic;  -- Enable signaal voor synchronisatie
        ref     :in    std_logic_vector(6 downto 0);	-- Tijdsreferentie
	m_clk	:out   std_logic); -- Sturende klok voor volgende teller
end mod60_clk_bcd;
