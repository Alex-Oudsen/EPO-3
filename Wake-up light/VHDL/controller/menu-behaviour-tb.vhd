--In case of doubt, blame Kevin

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of menu_tb is
component menu is
	port(clk		:in		std_logic;
		reset		:in		std_logic;
		knoppen		:in		std_logic_vector(3 downto 0);
		wekdata		:in		std_logic_vector(13 downto 0);
		enable		:out	std_logic;
		wekker		:out	std_logic_vector(13 downto 0);
		menu_signal		:out	std_logic_vector(2 downto 0));
end component menu;

signal clk, reset, enable 						:	std_logic;
signal menu_signal								: std_logic_vector (2 downto 0);
signal knoppen								: std_logic_vector (3 downto 0);
signal wekdata, wekker		:	std_logic_vector (13 downto 0);

begin
	clk		<=	'1' after 0 ns,
			'0' after 20 ns when clk /= '0' else '1' after 20 ns;

	reset	<=	'1' after 0 ns,		--knoppen(0) = menu
			'0' after 62 ns;		--knoppen(1) = set
									--knoppen(2) = up
	knoppen <=	"0000" after 0 ns,	--knoppen(3) = down
			"0010" after 68 ns,		--rust -> wekker_toggle
			"0010" after 108 ns,	--wekker_toggle -> rust
			"0001" after 148 ns,	--rust -> wekkertijd
			"0001" after 188 ns,	--wekkertijd -> rust
			"0001" after 228 ns,	--rust -> wekkertijd
			"0010" after 268 ns,	--wekkertijd -> uren_set
			"0100" after 308 ns,	--uren_set -> uren_plus
			"0000" after 348 ns,	--uren_plus -> uren_set
			"1000" after 388 ns,	--uren_set -> uren_min
			"0000" after 428 ns,	--uren_min -> uren_set
			"0001" after 468 ns,	--uren_set -> rust
			"0001" after 508 ns,	--rust -> wekkertijd
			"0010" after 548 ns,	--wekkertijd -> uren_set
			"0010" after 588 ns,	--uren_set -> minuten_set
			"0100" after 628 ns,	--minuten_set -> minuten_plus
			"0000" after 668 ns,	--minuten_plus -> minuten_set
			"1000" after 708 ns,	--minuten_set -> minuten_min
			"0000" after 748 ns,	--minuten_min -> minuten_set
			"0001" after 788 ns,	--minuten_set -> rust
			"0001" after 828 ns,	--rust -> wekkertijd
			"0010" after 868 ns,	--wekkertijd -> uren_set
			"0010" after 908 ns,	--uren_set -> minuten_set
			"0010" after 948 ns,	--minuten_set -> wekkertijd 	EIGENLIJK GAAT DIT NAAR RUST TOE
			"0001" after 988 ns,	--rust -> wekkertijd
			"1000" after 1028 ns,	--wekkertijd -> led
			"0001" after 1068 ns,	--led -> rust
			"0001" after 1108 ns,	--rust -> wekkertijd
			"0100" after 1148 ns,	--wekkertijd -> geluid
			"0100" after 1188 ns,	--geluid -> led
			"0100" after 1228 ns,	--led -> wekkertijd
			"1000" after 1268 ns,	--wekkertijd -> led
			"1000" after 1308 ns,	--led -> geluid
			"1000" after 1348 ns,	--geluid -> wekkertijd
			"1000" after 1388 ns,	--wekkertijd -> led
			"0010" after 1428 ns,	--led -> led_toggle
			"0000" after 1468 ns,	--led_toggle -> led
			"1000" after 1508 ns,	--led -> geluid
			"0010" after 1548 ns,	--geluid -> geluid_toggle
			"0000" after 1588 ns,	--geluid_toggle -> geluid
			"0001" after 1628 ns,	--geluid -> rust
			"0000" after 1668 ns; 	--done, done, done;			

	wekdata <= "00000000000000" after 20 ns;

	menu_pm: menu port map(clk, reset, knoppen, wekdata, enable, wekker, menu_signal);
end architecture;




