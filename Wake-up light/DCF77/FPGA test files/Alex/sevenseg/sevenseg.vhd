library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sevenseg is
port (clk 		 : in  std_logic;
		reset		 : in  std_logic;
      minuten   : in  std_logic_vector(6 downto 0);  --minuten input
      uren		 : in  std_logic_vector(5 downto 0);  --minuten input
      seg7_min1 : out std_logic_vector(6 downto 0);  -- 7 bit decoded output.
      seg7_min2 : out std_logic_vector(6 downto 0);  -- 7 bit decoded output.
      seg7_uur1 : out std_logic_vector(6 downto 0);  -- 7 bit decoded output.
      seg7_uur2 : out std_logic_vector(6 downto 0)); -- 7 bit decoded output.
    
end sevenseg;

architecture Behavioral of sevenseg is

signal minuten1: std_logic_vector(3 downto 0);
signal minuten2: std_logic_vector(2 downto 0);
signal uren1: std_logic_vector(3 downto 0);
signal uren2: std_logic_vector(1 downto 0);
begin
minuten1 <= minuten(3 downto 0);
minuten2 <= minuten(6 downto 4);
uren1 <= uren(3 downto 0);
uren2 <= uren(5 downto 4);
 

process (clk, reset)
begin
if (clk'event and clk='1') then
	if(reset = '1') then
		seg7_min1 <= (others => '0');
		seg7_min2 <= (others => '0');
		seg7_uur1 <= (others => '0');
		seg7_uur2 <= (others => '0');
	else
		case  minuten1 is
			when "0000"=> seg7_min1 <="0000001";  -- '0'
			when "0001"=> seg7_min1 <="1001111";  -- '1'
			when "0010"=> seg7_min1 <="0010010";  -- '2'
			when "0011"=> seg7_min1 <="0000110";  -- '3'
			when "0100"=> seg7_min1 <="1001100";  -- '4'
			when "0101"=> seg7_min1 <="0100100";  -- '5'
			when "0110"=> seg7_min1 <="0100000";  -- '6'
			when "0111"=> seg7_min1 <="0001111";  -- '7'
			when "1000"=> seg7_min1 <="0000000";  -- '8'
			when "1001"=> seg7_min1 <="0000100";  -- '9'
			--nothing is displayed when a number more than 9 is given as input.
			when others=> seg7_min1 <="1111111";
		end case;

		case minuten2 is
			when "000"=> seg7_min2 <="0000001";  -- '0'
			when "001"=> seg7_min2 <="1001111";  -- '1'
			when "010"=> seg7_min2 <="0010010";  -- '2'
			when "011"=> seg7_min2 <="0000110";  -- '3'
			when "100"=> seg7_min2 <="1001100";  -- '4'
			when "101"=> seg7_min2 <="0100100";  -- '5'
			when "110"=> seg7_min2 <="0100000";  -- '6'
			--nothing is displayed when a number more than 6 is given as input.
			when others=> seg7_min2 <="1111111";
		end case;

		case  uren1 is
			when "0000"=> seg7_uur1 <="0000001";  -- '0'
			when "0001"=> seg7_uur1 <="1001111";  -- '1'
			when "0010"=> seg7_uur1 <="0010010";  -- '2'
			when "0011"=> seg7_uur1 <="0000110";  -- '3'
			when "0100"=> seg7_uur1 <="1001100";  -- '4'
			when "0101"=> seg7_uur1 <="0100100";  -- '5'
			when "0110"=> seg7_uur1 <="0100000";  -- '6'
			when "0111"=> seg7_uur1 <="0001111";  -- '7'
			when "1000"=> seg7_uur1 <="0000000";  -- '8'
			when "1001"=> seg7_uur1 <="0000100";  -- '9'
			--nothing is displayed when a number more than 9 is given as input.
			when others=> seg7_uur1 <="1111111";
		end case;

		case  uren2 is
			when "00"=> seg7_uur2 <="0000001";  -- '0'
			when "01"=> seg7_uur2 <="1001111";  -- '1'
			when "10"=> seg7_uur2 <="0010010";  -- '2'
			--nothing is displayed when a number more than 2 is given as input.
			when others=> seg7_uur2 <="1111111";
		end case;
	end if;
end if;
end process;

end Behavioral;
