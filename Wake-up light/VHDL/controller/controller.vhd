library IEEE;
use IEEE.std_logic_1164.ALL;

entity controller is
   port(clk    :in    std_logic;
        reset  :in    std_logic;
        knoppen:in    std_logic_vector(3 downto 0);
        wekker :out   std_logic_vector(13 downto 0);
        toggle :out   std_logic;
        menu   :out   std_logic_vector(2 downto 0));
end controller;

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

component geheugen is
	port(clk    :in    std_logic;
        reset  :in    std_logic;
        enable :in    std_logic;
        wek_in :in    std_logic_vector(13 downto 0);
        wek_out:out   std_logic_vector(13 downto 0));
end component geheugen;


