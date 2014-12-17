-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity klokdeler is
    port (clk:	    in  std_logic;	-- 32 kHz systeemklok
	  reset:    in  std_logic;	-- Algemene reset v.h. systeem
	  clk_1hz:  out std_logic);	-- Signaal met een periode van 1 Hz
end klokdeler;