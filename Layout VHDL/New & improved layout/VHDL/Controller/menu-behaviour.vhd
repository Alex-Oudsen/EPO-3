library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of menu is

	type menu_state is (rust, wekkertijd, led, led_toggle, geluid, geluid_toggle, wekker_toggle, uren_set, uren_plus, uren_min, minuten_set, minuten_plus, minuten_min);

	signal state, new_state: menu_state;

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= rust;
			else
				state <= new_state;
			end if;
		end if;
	end process;
	
	process (state, knoppen, wekdata)
	begin
		case state is
			when rust =>
				if (knoppen(0) = '1') then
					new_state <= wekkertijd;
				elsif (knoppen(1) = '1') then
					new_state <= wekker_toggle;
				else
					new_state <= rust;
				end if;
			when wekker_toggle =>
				new_state <= rust;
			when wekkertijd =>
				if (knoppen(0) = '1') then
					new_state <= rust;
				elsif (knoppen(1) = '1') then
					new_state <= uren_set;
				elsif (knoppen(2) = '1') then
					new_state <= geluid;
				elsif (knoppen(3) = '1') then
					new_state <= led;
				else
					new_state <= wekkertijd;
				end if;
			when led =>
				if (knoppen(0) = '1') then
					new_state <= rust;
				elsif (knoppen(1) = '1') then
					new_state <= led_toggle;
				elsif (knoppen(2) = '1') then
					new_state <= wekkertijd;
				elsif (knoppen(3) = '1') then
					new_state <= geluid;
				else
					new_state <= led;
				end if;
			when led_toggle =>
				new_state <= led;
			when geluid =>
				if (knoppen(0) = '1') then
					new_state <= rust;
				elsif (knoppen(1) = '1') then
					new_state <= geluid_toggle;
				elsif (knoppen(2) = '1') then
					new_state <= led;
				elsif (knoppen(3) = '1') then
					new_state <= wekkertijd;
				else
					new_state <= geluid;
				end if;
			when geluid_toggle =>
				new_state <= geluid;
			when uren_set =>
				if (knoppen(0) = '1') then
					new_state <= rust;
				elsif (knoppen(1) = '1') then
					new_state <= minuten_set;
				elsif (knoppen(2) = '1') then
					new_state <= uren_plus;
				elsif (knoppen(3) = '1') then
					new_state <= uren_min;
				else
					new_state <= uren_set;
				end if;
			when uren_plus =>
				new_state <= uren_set;
			when uren_min =>
				new_state <= uren_set;
			when minuten_set =>
				if (knoppen(0) = '1') then
					new_state <= rust;
				elsif (knoppen(1) = '1') then
					new_state <= rust;
				elsif (knoppen(2) = '1') then
					new_state <= minuten_plus;
				elsif (knoppen(3) = '1') then
					new_state <= minuten_min;
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
	end process;

	process(state, wekdata)
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
				menu_signal <= "101";
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
				wekker(14) <= wekdata(14);
				wekker(15) <= wekdata(15);
				menu_signal <= "100";
			when uren_set =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "001";
			when uren_plus =>
				enable <= '1';
				menu_signal <= "001";
				wekker(15 downto 13) <= wekdata(15 downto 13);
				wekker(6 downto 0) <= wekdata(6 downto 0);

				if (wekdata(12 downto 7) = "100011") then
					wekker(12 downto 7) <= "000000";
				elsif (wekdata(10 downto 7) = "1001") then
					wekker(10 downto 7) <= "0000";
					wekker(12 downto 11) <= wekdata(12 downto 11) + 1;
				else
					wekker(10 downto 7) <= wekdata(10 downto 7) + 1;
					wekker(12 downto 11) <= wekdata(12 downto 11);
				end if;
			when uren_min =>
				enable <= '1';
				menu_signal <= "001";
				wekker(15 downto 13) <= wekdata(15 downto 13);
				wekker(6 downto 0) <= wekdata(6 downto 0);

				if (wekdata(12 downto 7) = "000000") then
					wekker(12 downto 7) <= "100011";
				elsif (wekdata(10 downto 7) = "0000") then
					wekker(10 downto 7) <= "1001";
					wekker(12 downto 11) <= wekdata(12 downto 11) - 1;
				else
					wekker(10 downto 7) <= wekdata(10 downto 7) - 1;
					wekker(12 downto 11) <= wekdata(12 downto 11);
				end if;
			when minuten_set =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "010";
			when minuten_plus =>
				enable <= '1';
				menu_signal <= "010";
				wekker(15 downto 13) <= wekdata(15 downto 13);

				if (wekdata(6 downto 0) = "1011001") then
					if (wekdata(12 downto 7) = "100011") then
						wekker(12 downto 7) <= "000000";
					elsif (wekdata(10 downto 7) = "1001") then
						wekker(10 downto 7) <= "0000";
						wekker(12 downto 11) <= wekdata(12 downto 11) + 1;
					else
						wekker(10 downto 7) <= wekdata(10 downto 7) + 1;
						wekker(12 downto 11) <= wekdata(12 downto 11);
					end if;

					wekker(6 downto 0) <= "0000000";
				elsif (wekdata(3 downto 0) = "1001") then
					wekker(12 downto 7) <= wekdata(12 downto 7);
					wekker(6 downto 4) <= wekdata(6 downto 4) + 1;
					wekker(3 downto 0) <= "0000";
				else
					wekker(12 downto 4) <= wekdata(12 downto 4);
					wekker(3 downto 0) <= wekdata(3 downto 0) + 1;
				end if;
			when minuten_min =>
				enable <= '1';
				menu_signal <= "010";
				wekker(15 downto 13) <= wekdata(15 downto 13);

				if (wekdata (6 downto 0) = "0000000") then
					if (wekdata(12 downto 7) = "000000") then
						wekker(12 downto 7) <= "100011";
					elsif (wekdata(10 downto 7) = "0000") then
						wekker(10 downto 7) <= "1001";
						wekker(12 downto 11) <= wekdata(12 downto 11) - 1;
					else
						wekker(10 downto 7) <= wekdata(10 downto 7) - 1;
						wekker(12 downto 11) <= wekdata(12 downto 11);
					end if;

					wekker(6 downto 0) <= "1011001";
				elsif (wekdata(3 downto 0) = "0000") then
					wekker(12 downto 7) <= wekdata(12 downto 7);
					wekker(6 downto 4) <= wekdata(6 downto 4) - 1;
					wekker(3 downto 0) <= wekdata(3 downto 0);
				else
					wekker(12 downto 4) <= wekdata(12 downto 4);
					wekker(3 downto 0) <= wekdata(3 downto 0) - 1;
				end if;
			when others =>
				enable <= '0';
				wekker <= wekdata;
				menu_signal <= "111";
		end case;
	end process;
end behaviour;


