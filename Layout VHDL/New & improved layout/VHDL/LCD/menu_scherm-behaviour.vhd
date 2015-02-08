library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of menu_scherm is

	type menu_state is (steady, schrijven);

	signal state, new_state: menu_state;
	signal alarm_buf, new_alarm_buf, ready_buf, new_ready_buf: std_logic;
	signal menu_buf, new_menu_buf: std_logic_vector(2 downto 0);
	signal alarm_on, new_alarm_on: std_logic_vector(1 downto 0);

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= steady;
				alarm_buf <= '0';
				ready_buf <= '0';
				menu_buf <= "000";
				alarm_on <= "00";
			else
				state <= new_state;
				alarm_buf <= new_alarm_buf;
				ready_buf <= new_ready_buf;
				menu_buf <= new_menu_buf;
				alarm_on <= new_alarm_on;
			end if;
		end if;
	end process;

	process(alarm, alarm_buf, alarm_on)
	begin
		if (alarm = '1' and alarm_buf = '0') then -- rising edge
			new_alarm_on <= "01";
		elsif (alarm = '0' and alarm_buf = '1') then -- falling edge
			new_alarm_on <= "00";
		else
			new_alarm_on <= alarm_on;
		end if;
	end process;

	process(state, menu, menu_buf, ready, ready_buf, alarm_on, alarm, alarm_buf)
	begin
		case state is
			when steady =>
				new_alarm_buf <= alarm;
				new_ready_buf <= ready;
				new_menu_buf <= menu;
				lcd_menu <= "000"; -- c_rust

				if (menu /= menu_buf or alarm /= alarm_buf) then
					new_state <= schrijven;
				else
					new_state <= steady;
				end if;
			when schrijven =>
				new_alarm_buf <= alarm;
				new_ready_buf <= ready;
				new_menu_buf <= menu;

				case menu is
					when "000" =>
						if (alarm_on = "01") then
							lcd_menu <= "110";	-- rust, alarm aan
						elsif (alarm_on = "00") then
							lcd_menu <= "111"; -- rust, alarm uit
						else
							lcd_menu <= "000"; -- c_rust
						end if;
					when "001" =>
						lcd_menu <= "001"; -- uren aanpassen, c_1
					when "010" =>
						lcd_menu <= "010"; -- minuten aanpassen, c_2
					when "011" =>
						lcd_menu <= "011"; -- licht aan/uit, c_3
					when "100" =>
						lcd_menu <= "100"; -- geluid aan/uit, c_4
					when "101" =>
						lcd_menu <= "101"; -- menu geopend/tijd aanpassen, c_5
					when others =>
						lcd_menu <= "000"; -- c_rust
				end case;

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_state <= steady;
				else
					new_state <= schrijven;
				end if;
			when others =>
				new_alarm_buf <= '0';
				new_ready_buf <= '0';
				new_menu_buf <= "000";
				lcd_menu <= "000";
				new_state <= steady;
		end case;	
	end process;
end behaviour;


