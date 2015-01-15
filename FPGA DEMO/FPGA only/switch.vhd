library IEEE;
use IEEE.std_logic_1164.ALL;

entity switch is
   port(tijd_min	:in  std_logic_vector(6 downto 0);
		  tijd_uur	:in  std_logic_vector(5 downto 0);
		  wek_min	:in  std_logic_vector(6 downto 0);
		  wek_uur	:in  std_logic_vector(5 downto 0);
		  m_state	:in  std_logic_vector(2 downto 0);
		  switch0	:in  std_logic;
		  switch1	:in  std_logic;
		  switch2	:in  std_logic;
		  seg7_min1	:out std_logic_vector(6 downto 0);
		  seg7_min2	:out std_logic_vector(6 downto 0);
		  seg7_uur1	:out std_logic_vector(6 downto 0);
		  seg7_uur2	:out std_logic_vector(6 downto 0));
end switch;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of switch is

begin

process(switch0, switch1, switch2, tijd_min, tijd_uur, wek_min, wek_uur, m_state) is

begin
   if(switch0 = '1' and switch1 = '0' and switch2 = '0') then
		case tijd_min(3 downto 0) is
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

		case tijd_min(6 downto 4) is
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

		case tijd_uur(3 downto 0) is
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

		case tijd_uur(5 downto 4) is
			when "00"=> seg7_uur2 <="0000001";  -- '0'
			when "01"=> seg7_uur2 <="1001111";  -- '1'
			when "10"=> seg7_uur2 <="0010010";  -- '2'
			--nothing is displayed when a number more than 2 is given as input.
			when others=> seg7_uur2 <="1111111";
		end case;
	elsif(switch0 = '0' and switch1 = '1' and switch2 = '0') then
		case wek_min(3 downto 0) is
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

		case wek_min(6 downto 4) is
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

		case wek_uur(3 downto 0) is
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

		case wek_uur(5 downto 4) is
			when "00"=> seg7_uur2 <="0000001";  -- '0'
			when "01"=> seg7_uur2 <="1001111";  -- '1'
			when "10"=> seg7_uur2 <="0010010";  -- '2'
			--nothing is displayed when a number more than 2 is given as input.
			when others=> seg7_uur2 <="1111111";
		end case;
	elsif(switch0 = '0' and switch1 = '0' and switch2 = '1') then
		case m_state is
			when "000"=> seg7_min1 <="0000001";  -- '0'
			when "001"=> seg7_min1 <="1001111";  -- '1'
			when "010"=> seg7_min1 <="0010010";  -- '2'
			when "011"=> seg7_min1 <="0000110";  -- '3'
			when "100"=> seg7_min1 <="1001100";  -- '4'
			when "101"=> seg7_min1 <="0100100";  -- '5'
			when "110"=> seg7_min1 <="0100000";  -- '6'
			when "111"=> seg7_min1 <="0001111";  -- '7'
			when others=> seg7_min1 <="1111111";
		end case;

		seg7_min2 <="0000001";  -- '0'
		seg7_uur1 <="0000001";  -- '0'
		seg7_uur2 <="0000001";  -- '0'
	else
		seg7_min1 <="0000001";  -- '0'
		seg7_min2 <="0000001";  -- '0'
		seg7_uur1 <="0000001";  -- '0'
		seg7_uur2 <="0000001";  -- '0'
	end if;
end process;
end behaviour;
