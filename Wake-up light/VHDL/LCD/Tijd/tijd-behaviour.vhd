library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tijd is
--Constants declaration
constant dubbele_punt_x : std_logic_vector(6 downto 0) := "0000001";
constant dubbele_punt_y : std_logic_vector(5 downto 0) := "000001";
constant dubbele_punt_c_aan : std_logic_vector(6 downto 0) := "0000001";
constant dubbele_punt_c_uit : std_logic_vector(6 downto 0) := "0000001";

--Signals
type states is (rust, char_0,char_1, char_2, char_3, dubbele_punt);
signal state, new_state : states;
signal lsb_tijd, new_lsb_tijd : std_logic;
signal hz_state, new_hz_state : std_logic;
signal ready_sig : std_logic;
begin
process(clk, state, new_state, reset)--process om van state te veranderen en voor de reset
begin
	if(reset = '1') then
		state <= rust;
	else
		if(rising_edge(clk)) then
			state <= new_state;
		end if;
	end if;
end process;

process(ready, hz_sig, uren, minuten)--process voor rekenen
variable punt : boolean := FALSE;
begin
	case(state) is
		when rust =>
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
			if (minuten(0) /= lsb_tijd) then
				new_lsb_tijd <= minuten(0);
				new_hz_state <= hz_sig;
				new_state <= char_0;
			elsif(hz_state /= hz_sig) then
				new_hz_state <= hz_sig;
				new_lsb_tijd <= lsb_tijd;
				if(hz_sig <= '1') then
					new_state <= dubbele_punt;
				else
					new_state <= rust;
				end if;
			else
				new_lsb_tijd <= lsb_tijd;
				new_hz_state <= hz_sig;
				new_state <= rust;
			end if;
		when dubbele_punt =>
				new_lsb_tijd <= lsb_tijd;
				new_hz_state <= hz_sig;
			if(punt) then
				x <= dubbele_punt_x;
				y <= dubbele_punt_y;
				c <= dubbele_punt_c_aan;
				if(ready = '0') then
					if(ready_sig <= '1') then
						ready_sig<= '0';
						punt := FALSE;
						new_state <= rust;
					else
						ready_sig <= ready;
						new_state <= dubbele_punt;
					end if;
				else
					ready_sig <= ready;
				end if;
			else
				x <= dubbele_punt_x;
				y <= dubbele_punt_y;
				c <= dubbele_punt_c_uit;
				if(ready = '0') then
					if(ready_sig <= '1') then
						ready_sig<= '0';
						punt := TRUE;
						new_state <= rust;
					else
						ready_sig <= ready;
						new_state <= dubbele_punt;
					end if;
				else
					ready_sig <= ready;
				end if;
			end if;
		when char_0 =>
		when char_1 =>
		when char_2 =>
		when char_3 =>
		when others =>
	end case;
end process;
end behaviour;








