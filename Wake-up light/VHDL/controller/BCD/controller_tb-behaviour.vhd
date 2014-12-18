--In case of doubt, blame Kevin

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
			'0' after 40 ns when clk /= '0' else '1' after 40 ns;

	reset	<=	'1' after 0 ns,		--knoppen(0) = menu
			'0' after 124 ns;		--knoppen(1) = set
									--knoppen(2) = up
	knoppen <=	"0000" after 0 ns,	--knoppen(3) = down
			"0010" after 128 ns,	--rust -> wekker_toggle
			"0000" after 208 ns,	--knoppen(3) = down
			"0010" after 368 ns,	--wekker_toggle -> rust
			"0000" after 448 ns,	--knoppen(3) = down
			"0001" after 608 ns,	--rust -> wekkertijd
			"0000" after 688 ns,	--knoppen(3) = down
			"0001" after 848 ns,	--wekkertijd -> rust
			"0000" after 928 ns,	--knoppen(3) = down
			"0001" after 1088 ns,	--rust -> wekkertijd
			"0000" after 1168 ns,	--knoppen(3) = down
			"0010" after 1328 ns,	--wekkertijd -> uren_set
			"0000" after 1408 ns,	--knoppen(3) = down
			"0100" after 1568 ns,	--uren_set -> uren_plus
			"0000" after 1648 ns,	--knoppen(3) = down
			"1000" after 2008 ns,	--uren_set -> uren_min
			"0000" after 2088 ns,	--uren_min -> uren_set
			"0001" after 2248 ns,	--uren_set -> rust
			"0000" after 2328 ns,	--knoppen(3) = down
			"0001" after 2488 ns,	--rust -> wekkertijd
			"0000" after 2568 ns,	--knoppen(3) = down
			"0010" after 2768 ns,	--wekkertijd -> uren_set
			"0000" after 2808 ns,	--knoppen(3) = down
			"0010" after 2968 ns,	--uren_set -> minuten_set
			"0000" after 3048 ns,	--knoppen(3) = down
			"0100" after 3208 ns,	--minuten_set -> minuten_plus
			"0000" after 3288 ns,	--minuten_plus -> minuten_set
			"1000" after 3448 ns,	--minuten_set -> minuten_min
			"0000" after 3528 ns,	--minuten_min -> minuten_set
			"0001" after 3688 ns,	--minuten_set -> rust
			"0000" after 3768 ns,	--knoppen(3) = down
			"0001" after 3928 ns,	--rust -> wekkertijd
			"0000" after 4008 ns,	--knoppen(3) = down
			"0010" after 4168 ns,	--wekkertijd -> uren_set
			"0000" after 4248 ns,	--knoppen(3) = down
			"0010" after 4408 ns,	--uren_set -> minuten_set
			"0000" after 4488 ns,	--knoppen(3) = down
			"0010" after 4648 ns,	--minuten_set -> rust
			"0000" after 4728 ns,	--knoppen(3) = down
			"0001" after 4888 ns,	--rust -> wekkertijd
			"0000" after 4968 ns,	--knoppen(3) = down
			"1000" after 5128 ns,	--wekkertijd -> led
			"0000" after 5208 ns,	--knoppen(3) = down
			"0001" after 5368 ns,	--led -> rust
			"0000" after 5448 ns,	--knoppen(3) = down
			"0001" after 5608 ns,	--rust -> wekkertijd
			"0000" after 5688 ns,	--knoppen(3) = down
			"0100" after 5848 ns,	--wekkertijd -> geluid
			"0000" after 6128 ns,	--knoppen(3) = down
			"0100" after 6288 ns,	--geluid -> led
			"0000" after 6368 ns,	--knoppen(3) = down
			"0100" after 6528 ns,	--led -> wekkertijd
			"0000" after 6608 ns,	--knoppen(3) = down
			"1000" after 6768 ns,	--wekkertijd -> led
			"0000" after 6848 ns,	--knoppen(3) = down
			"1000" after 7008 ns,	--led -> geluid
			"0000" after 7088 ns,	--knoppen(3) = down
			"1000" after 7248 ns,	--geluid -> wekkertijd
			"0000" after 7328 ns,	--knoppen(3) = down
			"1000" after 7488 ns,	--wekkertijd -> led
			"0000" after 7568 ns,	--knoppen(3) = down
			"0010" after 7728 ns,	--led -> led_toggle
			"0000" after 7808 ns,	--led_toggle -> led
			"1000" after 7968 ns,	--led -> geluid
			"0000" after 8048 ns,	--knoppen(3) = down
			"0010" after 8208 ns,	--geluid -> geluid_toggle
			"0000" after 8288 ns,	--geluid_toggle -> geluid
			"0001" after 8448 ns,	--geluid -> rust
			"0000" after 8528 ns; 	--done, done, done;			

	controller_pm: controller port map(clk, reset, knoppen, wekker,menu_signal);
end architecture;
