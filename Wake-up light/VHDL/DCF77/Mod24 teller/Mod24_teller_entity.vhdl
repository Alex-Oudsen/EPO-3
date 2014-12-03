-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity mod24_teller is
    port (clk:		in std_logic;				-- 32 kHz systeemklok
	  clk_in:	in  std_logic;				-- h_clk uit overzicht
	  reset:	in  std_logic;				-- Systeemreset
	  sync_now:	in  std_logic;				-- Enable signaal uit decoder
	  ref:		in  std_logic_vector(4 downto 0);	-- Tijdreferentie voor uren
	  count:	out std_logic_vector(4 downto 0));	-- Aantal uren in de huidige tijd
end entity mod24_teller;