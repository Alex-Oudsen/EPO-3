--In case of doubt, blame Kevin

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of menu-tb is
component menu is
	port(clk		:in		std_logic;
		reset		:in		std_logic;
		knoppen		:in		std_logic_vector(3 downto 0);
		wekdata		:in		std_logic_vector(13 downto 0);
		enable		:out	std_logic;
		wekker		:out	std_logic_vector(13 downto 0);
		toggle		:out	std_logic;
		menu		:out	std_logic_vector(2 downto 0));
end component menu;

signal clk, reset, 		:	std_logic;
signal knoppen			:	std_logic_vector (3 downto 0);
signal wekdata			:	std_logic_vector (13 downto 0);

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
			

	wekdata <= wekker after 40 ns;

	menu_pm: menu port map(clk, reset, knoppen, wekdata, enable, wekker, toggle, menu);
end behaviour;

