library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_Std.all;

architecture behaviour of menu is
type fsm_states is (rust, wekkertijd, led, led_toggle, geluid, geluid_toggle, wekker_toggle, uren_set, uren_plus, uren_min, minuten_set, minuten_plus, minuten_min);
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
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "000";

			when wekker_toggle =>
				enable <= '1';
				wekker(14 downto 0) <= wekdata(14 downto 0);
				wekker(15) <= not wekdata(15);
				menu_signal <= "000";

			when wekkertijd =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "000";

			when led =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "011";

			when led_toggle =>
				enable <= '1';
				wekker(13 downto 0) <= wekdata(13 downto 0);
				wekker(14) <= not wekdata(14);
				wekker(15) <= wekdata(15);
				menu_signal <= "011";

			when geluid =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "100";

			when geluid_toggle =>
				enable <= '1';
				wekker(12 downto 0) <= wekdata(12 downto 0);
				wekker(13) <= not wekdata(13);
				wekker(15 downto 14) <= wekdata(15 downto 14);
				menu_signal <= "100";

			when uren_set =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "001";

			when uren_plus =>
				enable <= '1';
				menu_signal <= "101";
				if wekdata(12 downto 7) = "100011" then --23
					wekker(12 downto 7) <= "000000"; --Bij de 23 uur weer opnieuw beginnen
				else
					if (wekdata(10 downto 7) = "1001") then --Bij x9 uur 1 op tellen bij de x en enkele weer terug naar 0
						wekker(10 downto 7) <= "0000";
						wekker(12 downto 11) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(12 downto 11))) + 1 , 2));
					else
						wekker(10 downto 7) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(10 downto 7))) + 1 , 4)); -- 1 minuut erbij optellen
						wekker(12 downto 11) <= wekdata(12 downto 11); -- Tientallen blijven constant
					end if;
				end if;
				wekker(15 downto 13) <= wekdata(15 downto 13); -- Af
				wekker(6 downto 0) <= wekdata(6 downto 0); --Af

			when uren_min =>
				if wekdata(12 downto 7) = "000000" then
					wekker(12 downto 7) <= "100011"; --23
				else
					if wekdata(10 downto 7) = "0000" then
						wekker(10 downto 7) <= "1001";
						wekker(12 downto 11) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(12 downto 11))) - 1 , 2));
					else
						wekker(10 downto 7) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(10 downto 7))) - 1 , 4));
						wekker(12 downto 11) <= wekdata(12 downto 11);
					end if;
				end if;
				wekker(15 downto 13) <= wekdata(15 downto 13);
				wekker(6 downto 0) <= wekdata(6 downto 0);
				enable <= '1';
				menu_signal <= "101";

			when minuten_set =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "010";

			when minuten_plus =>
				enable <= '1';
				if wekdata(6 downto 0) = "1011001" then --59
					wekker(6 downto 0) <= "0000000"; --Bij de 59 minuten gaan weer op nieuw beginnen
				else
					if wekdata(3 downto 0) = "1001" then --Bij x9 minuten 1 op tellen bij de x en enkele weer terug naar 0
						wekker(3 downto 0) <= "0000";
						wekker(6 downto 4) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(6 downto 4))) + 1 , 3));
					else
						wekker(3 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(3 downto 0))) + 1 , 4)); -- 1 minuut erbij optellen
						wekker(6 downto 4) <= wekdata(6 downto 4); -- Tientallen blijven constant
					end if;
				end if;
				menu_signal <= "111";
				wekker(15 downto 7) <= wekdata(15 downto 7); --Af

			when minuten_min =>
				enable <= '1';
				if wekdata (6 downto 0) = "0000000" then
					wekker(6 downto 0) <= "1011001"; --59
				else
					if wekdata(3 downto 0) = "0000" then --Bij x0 minuten 1 van de tientallen afhalen en de enkele getal op 9 zetten
						wekker(3 downto 0) <= "1001"; --9
						wekker(6 downto 4) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(6 downto 4))) - 1 , 3));
					else
						wekker(3 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(wekdata(3 downto 0))) - 1 , 4));
						wekker(6 downto 4) <= wekdata(6 downto 4);
					end if;
				end if;
				menu_signal <= "111";
				wekker(15 downto 7) <= wekdata(15 downto 7); --Af
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
			when others =>
				new_state <= rust;
		end case;
	end process next_state;
end behaviour;


















