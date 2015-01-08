--Rens en Kevin

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of controller_tb is
component controller is
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        knoppen:in    std_logic_vector(3 downto 0);
        wekker :out   std_logic_vector(15 downto 0);
        menu_state   :out   std_logic_vector(2 downto 0));
end component controller;

signal clk, reset	 						:	std_logic;
signal menu_signal							:	std_logic_vector(2 downto 0);
signal knoppen								: std_logic_vector (3 downto 0);
signal wekker		:	std_logic_vector (15 downto 0);

begin
	clk		<=	'1' after 0 ns,
			'0' after 15625 ns when clk /= '0' else '1' after 15625 ns;		--32kHz

	reset	<=	'1' after 0 ns,		--knoppen(0) = menu
			'0' after 50000 ns;		--knoppen(1) = set
									--knoppen(2) = up
	knoppen <=	"0000" after 0 ns,	--knoppen(3) = down
			"0010" after 50000 ns,	--rust -> wekker_toggle	
			"0000" after 80078 ns,	--knoppen(3) = down	
			"0001" after 237500 ns,	--rust -> wekkertijd
			"0000" after 268750 ns,	--knoppen(3) = down
			"0001" after 331250 ns,	--wekkertijd -> rust
			"0000" after 362500 ns,	--knoppen(3) = down
			"0001" after 425000 ns,	--rust -> wekkertijd
			"0000" after 456250 ns,	--knoppen(3) = down
			"0010" after 518750 ns,	--wekkertijd -> uren_set
			"0000" after 550000 ns,	--knoppen(3) = down
			"0100" after 612500 ns,	--uren_set -> uren_plus
			"0000" after 643750 ns,	--knoppen(3) = down
			"1000" after 748375 ns,	--uren_set -> uren_min
			"0000" after 815625 ns,	--uren_min -> uren_set
			"0001" after 878125 ns,	--uren_set -> rust
			"0000" after 909375 ns,	--knoppen(3) = down
			"0001" after 971875 ns,	--rust -> wekkertijd
			"0000" after 1003125 ns,	--knoppen(3) = down
			"0010" after 1081250 ns,	--wekkertijd -> uren_set
			"0000" after 1096875 ns,	--knoppen(3) = down
			"0010" after 1159375 ns,	--uren_set -> minuten_set
			"0000" after 1190625 ns,	--knoppen(3) = down
			"0100" after 1253125 ns,	--minuten_set -> minuten_plus
			"0000" after 1284375 ns,	--minuten_plus -> minuten_set
			"1000" after 1346875 ns,	--minuten_set -> minuten_min
			"0000" after 1378125 ns,	--minuten_min -> minuten_set
			"0001" after 1440625 ns,	--minuten_set -> rust
			"0000" after 1471875 ns,	--knoppen(3) = down
			"0001" after 1534375 ns,	--rust -> wekkertijd
			"0000" after 1565625 ns,	--knoppen(3) = down
			"0010" after 1628125 ns,	--wekkertijd -> uren_set
			"0000" after 1659375 ns,	--knoppen(3) = down
			"0010" after 1721875 ns,	--uren_set -> minuten_set
			"0000" after 1753125 ns,	--knoppen(3) = down
			"0010" after 1815625 ns,	--minuten_set -> rust
			"0000" after 1846875 ns,	--knoppen(3) = down
			"0001" after 1909375 ns,	--rust -> wekkertijd
			"0000" after 1940625 ns,	--knoppen(3) = down
			"1000" after 2003125 ns,	--wekkertijd -> led
			"0000" after 2034375 ns,	--knoppen(3) = down
			"0001" after 2096875 ns,	--led -> rust
			"0000" after 2128125 ns,	--knoppen(3) = down
			"0001" after 2190625 ns,	--rust -> wekkertijd
			"0000" after 2221875 ns,	--knoppen(3) = down
			"0100" after 2284375 ns,	--wekkertijd -> geluid
			"0000" after 2393750 ns,	--knoppen(3) = down
			"0100" after 2456250 ns,	--geluid -> led
			"0000" after 2487500 ns,	--knoppen(3) = down
			"0100" after 2550000 ns,	--led -> wekkertijd
			"0000" after 2581250 ns,	--knoppen(3) = down
			"1000" after 2643750 ns,	--wekkertijd -> led
			"0000" after 2675000 ns,	--knoppen(3) = down
			"1000" after 2737500 ns,	--led -> geluid
			"0000" after 2768750 ns,	--knoppen(3) = down
			"1000" after 2831250 ns,	--geluid -> wekkertijd
			"0000" after 2862500 ns,	--knoppen(3) = down
			"1000" after 2925000 ns,	--wekkertijd -> led
			"0000" after 2956250 ns,	--knoppen(3) = down
			"0010" after 3018750 ns,	--led -> led_toggle
			"0000" after 3050000 ns,	--led_toggle -> led
			"1000" after 3112500 ns,	--led -> geluid
			"0000" after 3143750 ns,	--knoppen(3) = down
			"0010" after 3206250 ns,	--geluid -> geluid_toggle
			"0000" after 3237500 ns,	--geluid_toggle -> geluid
			"0001" after 3300000 ns,	--geluid -> rust
			"0000" after 3331250 ns; 	--done, done, done;			

	controller_pm: controller port map(clk, reset, knoppen, wekker,menu_signal);
end architecture;



