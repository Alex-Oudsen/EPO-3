-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity dcf_decoder is
   port(clk		:in  std_logic;	-- 32 kHz systeemklok
        reset		:in  std_logic;	-- Systeemreset
        count		:in  std_logic_vector(15 downto 0); -- Tellerwaarde
	new_bit		:in  std_logic;	-- Een nieuwe bit is geteld
	dcf_led		:out std_logic;	-- Debug signaal voor signaalontvangst
	start_xor	:out std_logic; -- Enable signaal voor parity_check
	minuten		:out std_logic_vector(6 downto 0);  -- Minuten in BCD
	uren		:out std_logic_vector(5 downto 0);  -- Uren in BCD
	weekdag		:out std_logic_vector(2 downto 0);  -- Dagen (001 is maandag, enz.)
	dagen		:out std_logic_vector(5 downto 0);  -- Dagen (de cijfers) in BCD
	maanden		:out std_logic_vector(4 downto 0);  -- Nummer van de maand in BCD
	jaren		:out std_logic_vector(7 downto 0);  -- Laatste 2 cijfers van het jaartal; in BCD
	parity_bits	:out std_logic_vector(2 downto 0)); -- De 3 parity bits uit het DCF77 signaal
end dcf_decoder;