library IEEE;
use IEEE.std_logic_1164.ALL;

entity dcf_lcd is
	port(clk		: in  std_logic;
             reset			: in  std_logic;
             ready			: in  std_logic;
             dcf_debug		: in  std_logic;
             lcd_dcf  		: out std_logic_vector(1 downto 0));
end dcf_lcd;


