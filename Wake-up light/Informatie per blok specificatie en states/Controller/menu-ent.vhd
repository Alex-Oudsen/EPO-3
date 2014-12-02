library IEEE;
use IEEE.std_logic_1164.ALL;

entity menu is
   port(clk			:in    std_logic;
        reset		:in    std_logic;
		knoppen		:in    std_logic_vector(3 downto 0);
		wekminuten	:in    std_logic_vector(5 downto 0);
		wekuren		:in	 std_logic_vector(4 downto 0);
		wekker_geh	:in	 std_logic;
		geluid_led	:in   std_logic_vector(1 downto 0)
        wektijdmin	:out   std_logic_vector(5 downto 0);
		wektijduren	:out   std_logic_vector(4 downto 0);
        wekker		:out   std_logic;
        select_bit	:out   std_logic;
        data_out	:out   std_logic_vector(1 downto 0));
end menu;


