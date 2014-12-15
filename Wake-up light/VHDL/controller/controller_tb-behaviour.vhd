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
			"1000" after 1008 ns,	--uren_set -> uren_min
			"0000" after 1048 ns,	--uren_min -> uren_set
			"0001" after 1128 ns,	--uren_set -> rust
			"0000" after 1168 ns,	--knoppen(3) = down
			"0001" after 1248 ns,	--rust -> wekkertijd
			"0000" after 1288 ns,	--knoppen(3) = down
			"0010" after 1368 ns,	--wekkertijd -> uren_set
			"0000" after 1408 ns,	--knoppen(3) = down
			"0010" after 1488 ns,	--uren_set -> minuten_set
			"0000" after 1528 ns,	--knoppen(3) = down
			"0100" after 1608 ns,	--minuten_set -> minuten_plus
			"0000" after 1648 ns,	--minuten_plus -> minuten_set
			"1000" after 1728 ns,	--minuten_set -> minuten_min
			"0000" after 1768 ns,	--minuten_min -> minuten_set
			"0001" after 1848 ns,	--minuten_set -> rust
			"0000" after 1888 ns,	--knoppen(3) = down
			"0001" after 1968 ns,	--rust -> wekkertijd
			"0000" after 2008 ns,	--knoppen(3) = down
			"0010" after 2088 ns,	--wekkertijd -> uren_set
			"0000" after 2128 ns,	--knoppen(3) = down
			"0010" after 2208 ns,	--uren_set -> minuten_set
			"0000" after 2248 ns,	--knoppen(3) = down
			"0010" after 2328 ns,	--minuten_set -> rust
			"0000" after 2368 ns,	--knoppen(3) = down
			"0001" after 2448 ns,	--rust -> wekkertijd
			"0000" after 2488 ns,	--knoppen(3) = down
			"1000" after 2568 ns,	--wekkertijd -> led
			"0000" after 2608 ns,	--knoppen(3) = down
			"0001" after 2688 ns,	--led -> rust
			"0000" after 2728 ns,	--knoppen(3) = down
			"0001" after 2808 ns,	--rust -> wekkertijd
			"0000" after 2848 ns,	--knoppen(3) = down
			"0100" after 2928 ns,	--wekkertijd -> geluid
			"0000" after 3068 ns,	--knoppen(3) = down
			"0100" after 3148 ns,	--geluid -> led
			"0000" after 3188 ns,	--knoppen(3) = down
			"0100" after 3268 ns,	--led -> wekkertijd
			"0000" after 3308 ns,	--knoppen(3) = down
			"1000" after 3388 ns,	--wekkertijd -> led
			"0000" after 3428 ns,	--knoppen(3) = down
			"1000" after 3508 ns,	--led -> geluid
			"0000" after 3548 ns,	--knoppen(3) = down
			"1000" after 3628 ns,	--geluid -> wekkertijd
			"0000" after 3668 ns,	--knoppen(3) = down
			"1000" after 3748 ns,	--wekkertijd -> led
			"0000" after 3788 ns,	--knoppen(3) = down
			"0010" after 3868 ns,	--led -> led_toggle
			"0000" after 3908 ns,	--led_toggle -> led
			"1000" after 3988 ns,	--led -> geluid
			"0000" after 4028 ns,	--knoppen(3) = down
			"0010" after 4108 ns,	--geluid -> geluid_toggle
			"0000" after 4148 ns,	--geluid_toggle -> geluid
			"0001" after 4228 ns,	--geluid -> rust
			"0000" after 4268 ns; 	--done, done, done;			

	controller_pm: controller port map(clk, reset, knoppen, wekker,menu_signal);
end architecture;





