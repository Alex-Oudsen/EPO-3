library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_Std.all;

architecture behaviour of buff is
type fsm_states is (rust, one, zero);
signal state, new_state : fsm_states;
begin
	assign : process(clk, reset) --Daadwerkelijk alles toekennen
	begin
		if rising_edge(clk) then
			if reset = '0' then
				state <= new_state;
			else
				state <= rust;
			end if;
		end if;
	end process assign;
	actie_uitvoeren : process(knoppen, wekdata, clk, reset, state) --Voer acties uit
	begin
		case state is
			when rust =>
				knopjes <= "0000";
				if ((knoppen(0) = '1' or knoppen(1) = '1') or (knoppen(2) = '1' or knoppen(3) = '1'))
					next_state <= one;
				else
					next_state <= state;
			when zero =>
				knopjes <= "0000";
				if ((knoppen(0) = '0' and knoppen(1) = '0') and (knoppen(2) = '0' and knoppen(3) = '0'))
					next_state <= rust;
				else
					next_state <= state;
			when one =>
				knopjes <= knoppen;
				next_state <= zero;
		end case;
	end process actie_uitvoeren;
end behaviour;












