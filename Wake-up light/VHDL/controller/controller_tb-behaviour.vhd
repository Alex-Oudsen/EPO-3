--In case of doubt, blame Kevin

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of controller_tb is
component controller is
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        knoppen:in    std_logic_vector(3 downto 0);
        wekker :out   std_logic_vector(13 downto 0);
        menu_state   :out   std_logic_vector(2 downto 0));
end component controller;

signal clk, reset	 						:	std_logic;
signal menu_signal							:	std_logic_vector(2 downto 0);
signal knoppen								: std_logic_vector (3 downto 0);
signal wekker		:	std_logic_vector (13 downto 0);

begin
	clk		<=	'1' after 0 ns,
			'0' after 20 ns when clk /= '0' else '1' after 20 ns;

	reset	<=	'1' after 0 ns,		--knoppen(0) = menu
			'0' after 62 ns;		--knoppen(1) = set
									--knoppen(2) = up
	knoppen <=	"0000" after 0 ns,	--knoppen(3) = down
			"0010" after 68 ns,	--rust -> wekker_toggle
			"0000" after 108 ns,	--knoppen(3) = down
			"0010" after 188 ns,	--wekker_toggle -> rust
			"0000" after 228 ns,	--knoppen(3) = down
			"0001" after 308 ns,	--rust -> wekkertijd
			"0000" after 348 ns,	--knoppen(3) = down
			"0001" after 428 ns,	--wekkertijd -> rust
			"0000" after 468 ns,	--knoppen(3) = down
			"0001" after 548 ns,	--rust -> wekkertijd
			"0000" after 588 ns,	--knoppen(3) = down
			"0010" after 668 ns,	--wekkertijd -> uren_set
			"0000" after 708 ns,	--knoppen(3) = down
			"0100" after 788 ns,	--uren_set -> uren_plus
			"0000" after 828 ns,	--knoppen(3) = down
			"1000" after 908 ns,	--uren_set -> uren_min
			"0000" after 948 ns,	--uren_min -> uren_set
			"0001" after 1028 ns,	--uren_set -> rust
			"0000" after 1068 ns,	--knoppen(3) = down
			"0001" after 1148 ns,	--rust -> wekkertijd
			"0000" after 1188 ns,	--knoppen(3) = down
			"0010" after 1268 ns,	--wekkertijd -> uren_set
			"0000" after 1308 ns,	--knoppen(3) = down
			"0010" after 1388 ns,	--uren_set -> minuten_set
			"0000" after 1428 ns,	--knoppen(3) = down
			"0100" after 1508 ns,	--minuten_set -> minuten_plus
			"0000" after 1548 ns,	--minuten_plus -> minuten_set
			"1000" after 1628 ns,	--minuten_set -> minuten_min
			"0000" after 1668 ns,	--minuten_min -> minuten_set
			"0001" after 1748 ns,	--minuten_set -> rust
			"0000" after 1788 ns,	--knoppen(3) = down
			"0001" after 1868 ns,	--rust -> wekkertijd
			"0000" after 1908 ns,	--knoppen(3) = down
			"0010" after 1988 ns,	--wekkertijd -> uren_set
			"0000" after 2028 ns,	--knoppen(3) = down
			"0010" after 2108 ns,	--uren_set -> minuten_set
			"0000" after 2148 ns,	--knoppen(3) = down
			"0010" after 2228 ns,	--minuten_set -> wekkertijd 	EIGENLIJK GAAT DIT NAAR RUST TOE
			"0000" after 2268 ns,	--knoppen(3) = down
			"0001" after 2348 ns,	--rust -> wekkertijd
			"0000" after 2388 ns,	--knoppen(3) = down
			"1000" after 2468 ns,	--wekkertijd -> led
			"0000" after 2508 ns,	--knoppen(3) = down
			"0001" after 2588 ns,	--led -> rust
			"0000" after 2628 ns,	--knoppen(3) = down
			"0001" after 2708 ns,	--rust -> wekkertijd
			"0000" after 2748 ns,	--knoppen(3) = down
			"0100" after 2828 ns,	--wekkertijd -> geluid
			"0000" after 2968 ns,	--knoppen(3) = down
			"0100" after 3048 ns,	--geluid -> led
			"0000" after 3088 ns,	--knoppen(3) = down
			"0100" after 3168 ns,	--led -> wekkertijd
			"0000" after 3208 ns,	--knoppen(3) = down
			"1000" after 3288 ns,	--wekkertijd -> led
			"0000" after 3328 ns,	--knoppen(3) = down
			"1000" after 3408 ns,	--led -> geluid
			"0000" after 3448 ns,	--knoppen(3) = down
			"1000" after 3528 ns,	--geluid -> wekkertijd
			"0000" after 3568 ns,	--knoppen(3) = down
			"1000" after 3648 ns,	--wekkertijd -> led
			"0000" after 3688 ns,	--knoppen(3) = down
			"0010" after 3768 ns,	--led -> led_toggle
			"0000" after 3808 ns,	--led_toggle -> led
			"1000" after 3888 ns,	--led -> geluid
			"0000" after 3928 ns,	--knoppen(3) = down
			"0010" after 4008 ns,	--geluid -> geluid_toggle
			"0000" after 4048 ns,	--geluid_toggle -> geluid
			"0001" after 4128 ns,	--geluid -> rust
			"0000" after 4168 ns; 	--done, done, done;			

	controller_pm: controller port map(clk, reset, knoppen, wekker,menu_signal);
end architecture;





