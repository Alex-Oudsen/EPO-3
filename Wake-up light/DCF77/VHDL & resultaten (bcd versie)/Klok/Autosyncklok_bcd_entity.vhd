-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity ausy_klok_bcd is
    port (clk:		in  std_logic;	-- 32 kHz systeemklok
	  s_clk:	in  std_logic;	-- 1 Hz klok uit klokdeler
	  reset:	in  std_logic;	-- Systeemreset
	  sync_now:	in  std_logic;	-- Enable signaal voor synchronisatie
	  min_ref:	in  std_logic_vector(6 downto 0);  -- Referentietijd (minuten bcd)
	  hr_ref:	in  std_logic_vector(5 downto 0);  -- Referentietijd (uren bcd)
	  minutes:	out std_logic_vector(6 downto 0);  -- Huidige tijd (minuten bcd)
	  hours:	out std_logic_vector(5 downto 0)); -- Huidige tijd (uren bcd)
end ausy_klok_bcd;
