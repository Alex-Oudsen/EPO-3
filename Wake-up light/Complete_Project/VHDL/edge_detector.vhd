-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
   port(clk    :in    std_logic;	-- 32 kHz systeemklok
        reset  :in    std_logic;	-- Systeemreset
        input  :in    std_logic;	-- digitaal DCF77 signaal
        rising :out   std_logic;	-- DCF77 rising edge
        falling:out   std_logic);	-- DCF77 falling edge
end edge_detector;

