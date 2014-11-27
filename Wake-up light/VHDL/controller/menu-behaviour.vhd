library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of menu is
type fsm_states is (rust, alarm, wekker_tijd, tijdzone, led_opties, tijd_wijz_uren, tijd_wijz_minuten, wekker_status, geluid, fade_tijd, soort_licht, licht_intensity);
signal huidige_tijd : std_logic_vector(10 downto 0);
signal current_state, new_state : fsm_state;

begin
	assign_state : process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				current_state <= rust;	
			else						-- process to assign new state
				current_state <= new_state;
			end if;
		end if;
	end process;
	
	inputs : process(current_state, reset, knoppen)
	begin
		case state is
			when rust =>
				if menu = '1' then
					new_state = wekker_tijd;
				elsif (up = '1') or (down = '1') then
					new_state = licht_intensity;
					
	end process;
	
	outputs : process(current_state)
	begin
		case state is
			when 
	end process;


end behaviour;


