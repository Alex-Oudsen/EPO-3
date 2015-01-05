library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_Std.all;

architecture behaviour of buff is
type fsm_states is (rust, one, zero);
signal state, new_state : fsm_states;
signal knoppen_temp : std_logic_vector(3 downto 0);
begin
	assign : process(clk, reset) --Daadwerkelijk alles toekennen
	begin
		if rising_edge(clk) then
			if reset = '0' then
				state <= new_state;
			else
				state <= rust;
			end if;
			knoppen_out <= knoppen_temp;
		end if;
	end process assign;
	actie_uitvoeren : process(knoppen_in,clk, reset, state) --Voer acties uit
	begin
		case state is
			when rust =>
				if ((knoppen_in(0) = '1' xor knoppen_in(1) = '1') xor (knoppen_in(2) = '1' xor knoppen_in(3) = '1')) then
					new_state <= one;
					knoppen_temp <= knoppen_in;
				else
					new_state <= state;
					knoppen_temp <= "0000";
				end if;
			when zero =>
				knoppen_temp <= "0000";
				if ((knoppen_in(0) = '0' and knoppen_in(1) = '0') and (knoppen_in(2) = '0' and knoppen_in(3) = '0')) then
					new_state <= rust;
				else
					new_state <= state;
				end if;
			when one =>
				new_state <= zero;
				knoppen_temp<="0000";
			when others =>
				new_state <= rust;
				knoppen_temp <= "0000";
		end case;	
	end process actie_uitvoeren;
end behaviour;






