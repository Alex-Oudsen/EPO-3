library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sevenseg_menu is
port (clk 		 		: in  std_logic;
			reset		 		: in  std_logic;
      menu_state  : in  std_logic_vector(6 downto 0);  --minuten input
      seg7_menu 	: out std_logic_vector(2 downto 0);  -- 3 bit decoded output.
			overig_1		: out std_logic_vector(2 downto 0);  -- 3 bit decoded output.
			overig_2		: out std_logic_vector(2 downto 0);  -- 3 bit decoded output.
			overig_3		: out std_logic_vector(2 downto 0);  -- 3 bit decoded output.
end sevenseg_menu;

architecture behavioral of sevenseg_menu is

begin
overig_1 <="0000001";  -- '0'
overig_2 <="0000001";  -- '0'
overig_3 <="0000001";  -- '0'

process (clk, reset)
begin
if (clk'event and clk='1') then
	if(reset = '1') then
		seg7_menu <= (others => '0');
	else
		case  minuten1 is
			when "000"=> seg7_menu <="0000001";  -- '0'
			when "001"=> seg7_menu <="1001111";  -- '1'
			when "010"=> seg7_menu <="0010010";  -- '2'
			when "011"=> seg7_menu <="0000110";  -- '3'
			when "100"=> seg7_menu <="1001100";  -- '4'
			when "101"=> seg7_menu <="0100100";  -- '5'
			when "110"=> seg7_menu <="0100000";  -- '6'
			when "111"=> seg7_menu <="0001111";  -- '7'
			--nothing is displayed when a number more than 7 is given as input.
			when others=> seg7_menu <="1111111";
		end case;
end process;

end behavioral;
