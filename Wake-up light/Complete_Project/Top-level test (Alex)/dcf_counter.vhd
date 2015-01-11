-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity dcf_counter is
   port(clk		:in    	std_logic;	 -- 32 kHz systeemklok
        reset		:in    	std_logic;	 -- Systeemreset
        dcf_rise:in    	std_logic;	 -- DCF77 signaal - rising edge
        dcf_fall:in    	std_logic;	 -- DCF77 signaal - falling edge
        count		:out   	std_logic_vector(15 downto 0);	-- Tellerwaarde
	new_bit	:out   	std_logic);	-- Een nieuwe bit is geteld
end dcf_counter;


