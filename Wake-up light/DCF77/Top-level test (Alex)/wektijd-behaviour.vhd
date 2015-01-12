library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.all;

architecture behaviour of wektijd is
constant char_0_x : std_logic_vector(6 downto 0) := "1011100";
constant char_0_y : std_logic_vector(5 downto 0) := "010010";

constant char_1_x : std_logic_vector(6 downto 0) := "1100010";
constant char_1_y : std_logic_vector(5 downto 0) := "010010";

constant char_2_x : std_logic_vector(6 downto 0) := "1101010";
constant char_2_y : std_logic_vector(5 downto 0) := "010010";

constant char_3_x : std_logic_vector(6 downto 0) := "1110000";
constant char_3_y : std_logic_vector(5 downto 0) := "010010";

--Characters
constant char_0 : std_logic_vector(6 downto 0) := "0000000";
constant char_1 : std_logic_vector(6 downto 0) := "0000001";
constant char_2 : std_logic_vector(6 downto 0) := "0000010";
constant char_3 : std_logic_vector(6 downto 0) := "0000011";
constant char_4 : std_logic_vector(6 downto 0) := "0000100";
constant char_5 : std_logic_vector(6 downto 0) := "0000101";
constant char_6 : std_logic_vector(6 downto 0) := "0000110";
constant char_7 : std_logic_vector(6 downto 0) := "0000111";
constant char_8 : std_logic_vector(6 downto 0) := "0001000";
constant char_9 : std_logic_vector(6 downto 0) := "0001001";

--Signals
type states is (rust, char_0_state,char_1_state, char_2_state, char_3_state);
signal state, new_state : states;

signal ready_sig, new_ready_sig : std_logic;
--signal minuten_tijd, new_minuten_tijd : unsigned(6 downto 0);
--signal uren_tijd, new_uren_tijd : unsigned(5 downto 0);


begin
process(clk, state, new_state, reset)--process om van state te veranderen en voor de reset
begin
	
	if(rising_edge(clk)) then
		if(reset = '1') then
			state <= rust;
			ready_sig <= '0';
		else
			state <= new_state;
			ready_sig <= new_ready_sig;
		end if;
	end if;
end process;

process(ready, wektijd_uren, wektijd_min, state, menu)--process voor rekenen
begin
	case(state) is
		when rust =>
			new_ready_sig <= ready;
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
			if (menu = "010") then
				new_state <= char_0_state;
			else
				new_state <= rust;
			end if;
		when char_0_state =>
			new_ready_sig <= ready;
			x <= char_0_x;
			y <= char_0_y;
			case(wektijd_uren(5 downto 4)) is
				when "00" =>
					c <= char_0;
				when "01" =>
					c <= char_1;
				when "10" =>
					c <= char_2;
				when others =>
					c <= char_0;
			end case;
			if(ready = '0') then
				if(ready_sig = '1') then
					new_state <= char_1_state;
				else
					new_state <= char_0_state;
				end if;
			else
				new_state <= char_0_state;
			end if;
		when char_1_state =>
			new_ready_sig <= ready;
			x <= char_1_x;
			y <= char_1_y;
			if(ready = '0') then
				if(ready_sig = '1') then
					new_state <= char_2_state;
				else
					new_state <= char_1_state;
				end if;
			else
				new_state <= char_1_state;
			end if;
			case (wektijd_uren(3 downto 0)) is 
				when "0001" =>
					c <= char_1;
				when "0010" =>
					c <= char_2;
				when "0011" =>
					c <= char_3;
				when "0100" =>
					c <= char_4;
				when "0101" =>
					c <= char_5;
				when "0110" =>
					c <= char_6;
				when "0111" =>
					c <= char_7;
				when "1000" =>
					c <= char_8;
				when "1001" =>
					c <= char_9;
				when others =>
					c <= char_0;
			end case;
		when char_2_state =>
			new_ready_sig <= ready;
			x <= char_2_x;
			y <= char_2_y;
			case(wektijd_min(6 downto 4)) is
				when "000" =>
					c <= char_0;
				when "001" =>
					c <= char_1;
				when "010" =>
					c <= char_2;
				when "011" =>
					c <= char_3;
				when "100" =>
					c <= char_4;
				when "101" =>
					c <= char_5;
				when others =>
					c <= char_0;
			end case;
			if(ready = '0') then
				if(ready_sig = '1') then
					new_state <= char_3_state;
				else
					new_state <= char_2_state;
				end if;
			else
				new_state <= char_2_state;
			end if;
			
		when char_3_state =>
			new_ready_sig <= ready;
			x <= char_3_x;
			y <= char_3_y;
			case(wektijd_min(3 downto 0)) is
				when "0001" =>
					c <= char_1;
				when "0010" =>
					c <= char_2;
				when "0011" =>
					c <= char_3;
				when "0100" =>
					c <= char_4;
				when "0101" =>
					c <= char_5;
				when "0110" =>
					c <= char_6;
				when "0111" =>
					c <= char_7;
				when "1000" =>
					c <= char_8;
				when "1001" =>
					c <= char_9;
				when others =>
					c <= char_0;
			end case;
			if(ready = '0') then
				if(ready_sig = '1') then
					new_state <= rust;
				else
					new_state <= char_3_state;
				end if;
			else
				new_state <= char_3_state;
			end if;
		when others =>
			new_ready_sig <= ready;
			new_state <= rust;
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
	end case;
end process;
end behaviour;









