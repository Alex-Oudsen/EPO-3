library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_Std.all;

architecture behaviour of menu is
type fsm_states is (rust, wekkertijd, led, led_toggle, geluid, geluid_toggle, wekker_toggle, uren_set, uren_plus, uren_min, minuten_set, minuten_plus, minuten_min);
signal state, new_state : fsm_states;
signal uren_tmp : std_logic_vector (4 downto 0);
signal minuten_tmp : std_logic_vector (5 downto 0);
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
				enable <= '0';
				wekker <= wekdata;
				menu <= "000";

			when wekker_toggle =>
				enable <= '1';
				wekker(12 downto 0) <= wekdata(12 downto 0);
				wekker(13) <= not wekdata(13);
				menu <= "000";

			when wekkertijd =>
				enable <= '0';
				wekker <= wekdata;
				menu <= "000";

			when led =>
				enable <= '0';
				wekker <= wekdata;
				menu <= "011";

			when led_toggle =>
				enable <= '1';
				wekker(11 downto 0) <= wekdata(11 downto 0);
				wekker(12) <= not wekdata(12);
				wekker(13) <= wekdata(13);
				menu <= "011";

			when geluid =>
				enable <= '0';
				wekker <= wekdata;
				menu <= "100";

			when geluid_toggle =>
				enable <= '1';
				wekker(10 downto 0) <= wekdata(10 downto 0);
				wekker(11) <= not wekdata(11);
				wekker(13 downto 12) <= wekdata(13 downto 12);
				menu <= "100";

			when uren_set =>
				enable <= '0';
				wekker <= wekdata;
				menu <= "001";

			when uren_plus =>
				enable <= '1';
				menu <= "001";
				if (to_integer(unsigned(wekdata(10 downto 6)))) < 23 then
					wekker(10 downto 6) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(10 downto 6))) + 1, 5));
				else
					wekker(10 downto 6) <= "00000";
				end if;

			when uren_min =>
				enable <= '1';
				menu <= "001";
				if (to_integer(unsigned(wekdata(10 downto 6)))) > 0 then
					wekker(10 downto 6) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(10 downto 6))) - 1, 5));
				else
					wekker(10 downto 6) <= "10111";
				end if;

			when minuten_set =>
				enable <= '0';
				wekker <= wekdata;
				menu <= "010";

			when minuten_plus =>
				enable <= '1';
				if (to_integer(unsigned(wekdata(5 downto 0)))) < 59 then
					wekker(5 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(5 downto 0))) + 1, 6));
				else
					wekker(5 downto 0) <= "000000";
				end if;
				menu <= "010";

			when minuten_min =>
				enable <= '1';
				if (to_integer(unsigned(wekdata(5 downto 0)))) > 0 then
					wekker(5 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(5 downto 0))) - 1, 6));
				else
					wekker(5 downto 0) <= "111011";
				end if;
				menu <= "010";
		end case;
	end process actie_uitvoeren;
	
	next_state : process (knoppen, wekdata, clk, reset, state) -- Bepaal nieuwe state
	begin
		case state is
			when rust =>
				if knoppen(0) = '1' then
					new_state <= wekkertijd;
				elsif knoppen(1) = '1' then
					new_state <= wekker_toggle;
				else
					new_state <= rust;
				end if;
			
			when wekker_toggle =>
				new_state <= rust;
			
			when wekkertijd =>
				if knoppen(0) = '1' then
					new_state <= rust;
				elsif knoppen(2) = '1' then
					new_state <= geluid;
				elsif knoppen(3) = '1' then
					new_state <= led;
				elsif knoppen(1) = '1' then
					new_state <= uren_set;
				else
					new_state <= wekkertijd;
				end if;

			when led =>
				if knoppen(0) = '1' then
					new_state <= rust;
				elsif knoppen(2) = '1' then
					new_state <= wekkertijd;
				elsif knoppen(3) = '1' then
					new_state <= geluid;
				elsif knoppen(1) = '1' then
					new_state <= led_toggle;
				else
					new_state <= led;
				end if;

			when led_toggle =>
				new_state <= led;

			when geluid =>
				if knoppen(0) = '1' then
					new_state <= rust;
				elsif knoppen(2) = '1' then
					new_state <= led;
				elsif knoppen(3) = '1' then
					new_state <= wekkertijd;
				elsif knoppen(1) = '1' then
					new_state <= geluid_toggle;
				else
					new_state <= geluid;
				end if;

			when geluid_toggle =>
				new_state <= geluid;

			when uren_set =>
				if knoppen(0) = '1' then
					new_state <= rust;
				elsif knoppen(2) = '1' then
					new_state <= uren_plus;
				elsif knoppen(3) = '1' then
					new_state <= uren_min;
				elsif knoppen(1) = '1' then
					new_state <= minuten_set;
				else
					new_state <= uren_set;
				end if;

			when uren_plus =>
				new_state <= uren_set;

			when uren_min =>
				new_state <= uren_set;

			when minuten_set =>
				if knoppen(0) = '1' then
					new_state <= rust;
				elsif knoppen(2) = '1' then
					new_state <= minuten_plus;
				elsif knoppen(3) = '1' then
					new_state <= minuten_min;
				elsif knoppen(1) = '1' then
					new_state <= rust;
				else
					new_state <= minuten_set;
				end if;

			when minuten_plus =>
				new_state <= minuten_set;

			when minuten_min =>
				new_state <= minuten_set;
		end case;
	end process next_state;
end behaviour;












