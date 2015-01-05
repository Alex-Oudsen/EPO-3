library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.all;

architecture behaviour of tijd is
--Constants declaration
constant dubbele_punt_x : std_logic_vector(6 downto 0) := "0010001";
constant dubbele_punt_y : std_logic_vector(5 downto 0) := "010001";
constant dubbele_punt_c_aan : std_logic_vector(6 downto 0) := "0000001";
constant dubbele_punt_c_uit : std_logic_vector(6 downto 0) := "0000010";

--Posities
constant char_0_x : std_logic_vector(6 downto 0) := "0000001";
constant char_0_y : std_logic_vector(5 downto 0) := "000001";

constant char_1_x : std_logic_vector(6 downto 0) := "0000011";
constant char_1_y : std_logic_vector(5 downto 0) := "000011";

constant char_2_x : std_logic_vector(6 downto 0) := "0000101";
constant char_2_y : std_logic_vector(5 downto 0) := "000101";

constant char_3_x : std_logic_vector(6 downto 0) := "0001001";
constant char_3_y : std_logic_vector(5 downto 0) := "001001";

--Characters
constant char_0 : std_logic_vector(6 downto 0) := "0001100";
constant char_1 : std_logic_vector(6 downto 0) := "0000011";
constant char_2 : std_logic_vector(6 downto 0) := "0000100";
constant char_3 : std_logic_vector(6 downto 0) := "0000101";
constant char_4 : std_logic_vector(6 downto 0) := "0000110";
constant char_5 : std_logic_vector(6 downto 0) := "0000111";
constant char_6 : std_logic_vector(6 downto 0) := "0001000";
constant char_7 : std_logic_vector(6 downto 0) := "0001001";
constant char_8 : std_logic_vector(6 downto 0) := "0001010";
constant char_9 : std_logic_vector(6 downto 0) := "0001011";

--Signals
type states is (rust, char_0_state,char_1_state, char_2_state, char_3_state, dubbele_punt);
signal state, new_state : states;
signal hz_state, new_hz_state : std_logic;
signal ready_sig : std_logic;
signal minuten_tijd, new_minuten_tijd : unsigned(5 downto 0);
signal uren_tijd, new_uren_tijd : unsigned(4 downto 0);
signal minner : unsigned(5 downto 0);
signal punt, new_punt: std_logic;

begin
process(clk, state, new_state, reset)--process om van state te veranderen en voor de reset
begin
	if(reset = '1') then
		state <= rust;
	else
		if(rising_edge(clk)) then
			state <= new_state;
			minuten_tijd <= new_minuten_tijd;
			uren_tijd <= new_uren_tijd;
			hz_state <= new_hz_state;
			punt <= new_punt;
			ready_sig <= ready;
		end if;
	end if;
end process;

process(ready, hz_sig, uren, minuten, state)--process voor rekenen
begin
	case(state) is
		when rust =>
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
			--ready_sig <= ready;
			minner <= "000000";
			new_punt <= punt;
			if (minuten(0) /= minuten_tijd(0)) then
				new_minuten_tijd <= unsigned(minuten);
				new_uren_tijd <= unsigned(uren);
				new_hz_state <= hz_sig;
				new_state <= char_0_state;
			elsif(hz_state /= hz_sig) then
				new_hz_state <= hz_sig;
				new_minuten_tijd <= unsigned(minuten);
				new_uren_tijd <= unsigned(uren);
				if(hz_sig = '1') then
					new_state <= dubbele_punt;
				else
					new_state <= rust;
				end if;
			else
				new_minuten_tijd <= unsigned(minuten);
				new_uren_tijd <= unsigned(uren);
				new_hz_state <= hz_sig;
				new_state <= rust;
			end if;
		when dubbele_punt =>
			new_minuten_tijd <= minuten_tijd;
			new_uren_tijd <= uren_tijd;
			new_hz_state <= hz_sig;
			minner <= "000000";
			if(punt = '1') then
				x <= dubbele_punt_x;
				y <= dubbele_punt_y;
				c <= dubbele_punt_c_aan;
				if(ready = '0') then
					if(ready_sig = '1') then
						--ready_sig <= '0';
						new_punt <= '0';
						new_state <= rust;
					else
						--ready_sig <= ready;
						new_punt <= punt;
						new_state <= dubbele_punt;
					end if;
				else
					new_punt <= punt;
					new_state <= dubbele_punt;
					--ready_sig <= ready;
				end if;
			else
				x <= dubbele_punt_x;
				y <= dubbele_punt_y;
				c <= dubbele_punt_c_uit;
				if(ready = '0') then
					if(ready_sig = '1') then
						--ready_sig<= '0';
						new_punt <= '1';
						new_state <= rust;
					else
						--ready_sig <= ready;
						new_punt <= punt;
						new_state <= dubbele_punt;
					end if;
				else
					new_punt <= punt;
					new_state <= dubbele_punt;
					--ready_sig <= ready;
				end if;
			end if;
		when char_0_state =>
			new_minuten_tijd <= minuten_tijd;
			new_hz_state <= hz_sig;
			x <= char_0_x;
			y <= char_0_y;
			new_punt <= punt;
			if(uren_tijd < 10) then
				--new_uren_tijd <= uren_tijd;
				minner <= "000000";
				c <= char_0;
			elsif(uren_tijd < 20) then
				--new_uren_tijd <= uren_tijd - 10;
				minner <= "001010";
				c <= char_1;
			else
				--new_uren_tijd <= uren_tijd - 20;
				minner <= "010100";
				c <= char_2;
			end if;
			if(ready = '0') then
				if(ready_sig = '1') then
					--ready_sig<= '0';
					new_uren_tijd <= uren_tijd - minner(4 downto 0);
					new_state <= char_1_state;
				else
					--ready_sig <= ready;
					new_state <= char_0_state;
					new_uren_tijd <= uren_tijd;
				end if;
			else
				new_uren_tijd <= uren_tijd;
				--ready_sig <= ready;
				new_state <= char_0_state;
			end if;
		when char_1_state =>
			new_minuten_tijd <= minuten_tijd;
			new_uren_tijd <= uren_tijd;
			new_hz_state <= hz_sig;
			x <= char_1_x;
			y <= char_1_y;
			new_punt <= punt;
			minner <= "000000";
			if(ready = '0') then
				if(ready_sig = '1') then
					--ready_sig<= '0';
					new_state <= char_2_state;
				else
					--ready_sig <= ready;
					new_state <= char_1_state;
				end if;
			else
				new_state <= char_1_state;
				--ready_sig <= ready;
			end if;
			case (uren_tijd) is 
				when "00001" =>
					c <= char_1;
				when "00010" =>
					c <= char_2;
				when "00011" =>
					c <= char_3;
				when "00100" =>
					c <= char_4;
				when "00101" =>
					c <= char_5;
				when "00110" =>
					c <= char_6;
				when "00111" =>
					c <= char_7;
				when "01000" =>
					c <= char_8;
				when "01001" =>
					c <= char_9;
				when others =>
					c <= char_0;
			end case;
		when char_2_state =>
			new_uren_tijd <= uren_tijd;
			new_hz_state <= hz_sig;
			x <= char_2_x;
			y <= char_2_y;
			new_punt <= punt;
			if(minuten_tijd < 10) then
				--new_minuten_tijd <= minuten_tijd;
				minner <= "000000";
				c <= char_0;
			elsif(minuten_tijd < 20) then
				--new_minuten_tijd <= minuten_tijd - 10;
				minner <= "001010";
				c <= char_1;
			elsif(minuten_tijd < 30) then
				--new_minuten_tijd <= minuten_tijd - 20;
				minner <= "010100";
				c <= char_2;
			elsif(minuten_tijd < 40) then
				--new_minuten_tijd <= minuten_tijd - 30;
				minner <= "011110";
				c <= char_3;
			elsif(minuten_tijd < 50) then
				--new_minuten_tijd <= minuten_tijd - 40;
				minner <= "101000";
				c <= char_4;
			else
				--new_minuten_tijd <= minuten_tijd - 50;
				minner <= "110010";
				c <= char_5;
			end if;
			if(ready = '0') then
				if(ready_sig = '1') then
					--ready_sig<= '0';
					new_minuten_tijd <= minuten_tijd - minner;
					new_state <= char_3_state;
				else
					--ready_sig <= ready;
					new_minuten_tijd <= minuten_tijd;
					new_state <= char_2_state;
				end if;
			else
				new_state <= char_2_state;
				new_minuten_tijd <= minuten_tijd;
				--ready_sig <= ready;
			end if;
			
		when char_3_state =>
			new_minuten_tijd <= minuten_tijd;
			new_uren_tijd <= uren_tijd;
			new_hz_state <= hz_sig;
			x <= char_3_x;
			y <= char_3_y;
			new_punt <= punt;
			minner <= "000000";
			case (minuten_tijd) is 
				when "000001" =>
					c <= char_1;
				when "000010" =>
					c <= char_2;
				when "000011" =>
					c <= char_3;
				when "000100" =>
					c <= char_4;
				when "000101" =>
					c <= char_5;
				when "000110" =>
					c <= char_6;
				when "000111" =>
					c <= char_7;
				when "001000" =>
					c <= char_8;
				when "001001" =>
					c <= char_9;
				when others =>
					c <= char_0;
			end case;
			if(ready = '0') then
				if(ready_sig = '1') then
					--ready_sig<= '0';
					new_state <= rust;
				else
					--ready_sig <= ready;
					new_state <= char_3_state;
				end if;
			else
				new_state <= char_3_state;
				--ready_sig <= ready;
			end if;
		when others =>
			new_minuten_tijd <= unsigned(minuten);
			new_uren_tijd <= unsigned(uren);
			new_hz_state <= hz_sig;
			new_state <= rust;
			new_punt <= punt;
			minner <= "000000";
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
	end case;
end process;
end behaviour;




















