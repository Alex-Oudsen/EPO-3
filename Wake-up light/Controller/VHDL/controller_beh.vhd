library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of controller is
component menu is									-- Het blok waar het mooie en slimmen onderdelen van de schakeling gedaan worden
	port(clk				:in    std_logic;
        reset		:in    std_logic;
		knoppen		:in    std_logic_vector(3 downto 0);
		wekdata		:in	   std_logic_vector(13 downto 0);
		enable			:out   std_logic;
		wekker			:out		 std_logic_vector(13 downto 0);
		menu_signal			:out		 std_logic_vector(2 downto 0));
end component menu;

component geheugen is							-- 14 bit opslag
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        enable :in    std_logic;
        wek_in :in    std_logic_vector(13 downto 0);
        wek_out:out   std_logic_vector(13 downto 0));
end component geheugen;


component buff is 							--De buffer die speciaal gemaakt is voor de menu met extra eigenschappen
	port(clk		:in		std_logic;
        reset		:in		std_logic;
		knoppen		:in		std_logic_vector(3 downto 0);
		knopjes		:out	std_logic_vector(3 downto 0));
end component buff;

signal knoppen_buff : std_logic_vector(3 downto 0);
--signal menu_state 		: std_logic_vector(2 downto 0);
signal wekdata_men,wekker_men : std_logic_vector(13 downto 0);
signal write_enable : std_logic;

begin
buffer_portmap : buff port map (clk,reset,knoppen,knoppen_buff);
menu_portmap : menu port map (clk,reset,knoppen_buff,wekdata_men,write_enable,wekker_men,menu_state);
menory_portmap: geheugen port map (clk,reset,write_enable,wekker_men,wekdata_men);
wekker <= wekdata_men;

end behaviour;
