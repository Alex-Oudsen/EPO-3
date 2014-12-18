library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_Std.all;

architecture behaviour of buff is
type fsm_states is (rust, one, zero);
signal state, new_state : fsm_states;
signal knopjes_temp : std_logic_vector(3 downto 0);
begin
	assign : process(clk, reset) --Daadwerkelijk alles toekennen
	begin
		if rising_edge(clk) then
			if reset = '0' then
				state <= new_state;
			else
				state <= rust;
			end if;
			knopjes <= knopjes_temp;
		end if;
	end process assign;
	actie_uitvoeren : process(knoppen,clk, reset, state) --Voer acties uit
	begin
		case state is
			when rust =>
				--knopjes <= "0000";
				if ((knoppen(0) = '1' xor knoppen(1) = '1') xor (knoppen(2) = '1' xor knoppen(3) = '1')) then
					new_state <= one;
					knopjes_temp <= knoppen;
				else
					new_state <= state;
					knopjes_temp <= "0000";
				end if;
			when zero =>
				--knopjes <= "0000";
				knopjes_temp <= "0000";
				if ((knoppen(0) = '0' and knoppen(1) = '0') and (knoppen(2) = '0' and knoppen(3) = '0')) then
					new_state <= rust;
				else
					new_state <= state;
				end if;
			when one =>
				--knopjes <= knopjes_temp;
				--knopjes_temp <= knopjes_temp;
				new_state <= zero;
				knopjes_temp<="0000";
		end case;
		
	end process actie_uitvoeren;
end behaviour;
