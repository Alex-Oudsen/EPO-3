--In case of doubt, blame Kevin.
--
--In case of no-doubt, follow the following procedure:
--Assume the state of no-mind using ancient Japanese techniques,
--If that does not take away no-doubt, beat the shit out of a brick (or stone) wall;
--If that does not work, acquaintance one´s face with a heavy metal object, preferably a chair.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of menu_tb is
component menu is		--component initialiseren, met de volgende in/uitgangen:
	port(clk		:in		std_logic;
		reset		:in		std_logic;
		knoppen		:in		std_logic_vector	(3 downto 0);	--dit zijn de fysieke knoppen
		wekdata		:in		std_logic_vector	(15 downto 0);	--komt bij het register vandaan
		enable		:out	std_logic;
		wekker		:out	std_logic_vector	(15 downto 0);
		menu_signal	:out	std_logic_vector	(2 downto 0)); --voor de LCD'
end component menu;

signal clk, reset, enable	:	std_logic;
signal menu_signal			:	std_logic_vector (2 downto 0);
signal knoppen				:	std_logic_vector (3 downto 0);		--signalen voor de port map
signal wekdata, wekker		:	std_logic_vector (15 downto 0);

begin
	clk		<=	'1' after 0 ns,
			'0' after 80 ns when clk /= '0' else '1' after 80 ns;

	reset	<=	'1' after 0 ns,			--knoppen(0) = menu;
			'0' after 62 ns;			--knoppen(1) = set;
										--knoppen(2) = up;
	knoppen <=	"0000" after 0 ns,		--knoppen(3) = down.
	knoppen <=



	menu_pm: menu port map(clk, reset, knoppen, wekdata, enable, wekker, menu_signal); --de daadwerkelijke port map
end architecture;







