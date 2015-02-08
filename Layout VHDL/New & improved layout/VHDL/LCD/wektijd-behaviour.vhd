library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of wektijd is

	type wektijd_state is (rust, selectdata, char_u, char_m);

	signal state, new_state: wektijd_state;
	signal ready_buf, new_ready_buf: std_logic;
	signal positie, new_positie: std_logic_vector(2 downto 0);
	signal data_buffer: std_logic_vector(3 downto 0);
	signal min_buf, new_min_buf: std_logic_vector(6 downto 0);
	signal uren_buf, new_uren_buf: std_logic_vector(5 downto 0);

begin
	position <= positie;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= rust;
				ready_buf <= '0';
				positie <= (others => '1');
				min_buf <= (others => '0');
				uren_buf <= (others => '0');
			else
				state <= new_state;
				ready_buf <= new_ready_buf;
				positie <= new_positie;
				min_buf <= new_min_buf;
				uren_buf <= new_uren_buf;
			end if;
		end if;
	end process;

	process(positie, wektijd_min, wektijd_uren)
	begin
		case positie is
			when "000" =>
				data_buffer(0) <= wektijd_min(0);
				data_buffer(1) <= wektijd_min(1);
				data_buffer(2) <= wektijd_min(2);
				data_buffer(3) <= wektijd_min(3);
			when "001" =>
				data_buffer(0) <= wektijd_min(4);
				data_buffer(1) <= wektijd_min(5);
				data_buffer(2) <= wektijd_min(6);
				data_buffer(3) <= '0';
			when "010" =>
				data_buffer(0) <= wektijd_uren(0);
				data_buffer(1) <= wektijd_uren(1);
				data_buffer(2) <= wektijd_uren(2);
				data_buffer(3) <= wektijd_uren(3);
			when "011" =>
				data_buffer(0) <= wektijd_uren(4);
				data_buffer(1) <= wektijd_uren(5);
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
			when others =>
				data_buffer <= (others => '0');
		end case;
	end process;

	process(state, menu, ready, ready_buf, positie, data_buffer, wektijd_min, min_buf, wektijd_uren, uren_buf)
	begin
		case state is
			when rust =>
				if (menu = "001") then
					new_positie <= "010";
				elsif (menu = "010") then
					new_positie <= "000";
				else
					new_positie <= "111";
				end if;

				new_ready_buf <= ready;
				new_min_buf <= wektijd_min;
				new_uren_buf <= wektijd_uren;
				lcd_wektijd <= (others => '0');

				if (wektijd_min /= min_buf or wektijd_uren /= uren_buf) then
					new_state <= selectdata;
				else
					new_state <= rust;
				end if;
			when selectdata =>
				new_positie <= positie;
				new_ready_buf <= ready;
				new_min_buf <= wektijd_min;
				new_uren_buf <= wektijd_uren;
				lcd_wektijd <= (others => '0');

				if (menu = "010" and (positie = "000" or positie = "001")) then
					new_state <= char_u;
				elsif (menu = "001" and (positie = "010" or positie = "011")) then
					new_state <= char_m;
				else
					new_state <= rust;
				end if;
			when char_u =>
				new_ready_buf <= ready;
				new_min_buf <= wektijd_min;
				new_uren_buf <= wektijd_uren;

				case (data_buffer) is 
					when "0001" =>
						lcd_wektijd <= "0010"; -- char_1
					when "0010" =>
						lcd_wektijd <= "0011"; -- char_2
					when "0011" =>
						lcd_wektijd <= "0100"; -- char_3
					when "0100" =>
						lcd_wektijd <= "0101"; -- char_4
					when "0101" =>
						lcd_wektijd <= "0110"; -- char_5
					when "0110" =>
						lcd_wektijd <= "0111"; -- char_6
					when "0111" =>
						lcd_wektijd <= "1000"; -- char_7
					when "1000" =>
						lcd_wektijd <= "1001"; -- char_8
					when "1001" =>
						lcd_wektijd <= "1010"; -- char_9
					when others =>
						lcd_wektijd <= "0001"; -- char_0
				end case;

				if(ready = '0' and ready_buf = '1') then -- falling edge
					if (positie = "000" or menu = "001") then
						new_positie <= positie + 1;
						new_state <= selectdata;
					else
						new_positie <= "111";
						new_state <= rust;
					end if;
				else
					new_positie <= positie;
					new_state <= char_u;
				end if;
			when char_m =>
				new_ready_buf <= ready;
				new_min_buf <= wektijd_min;
				new_uren_buf <= wektijd_uren;

				case (data_buffer) is 
					when "0001" =>
						lcd_wektijd <= "0010"; -- char_1
					when "0010" =>
						lcd_wektijd <= "0011"; -- char_2
					when "0011" =>
						lcd_wektijd <= "0100"; -- char_3
					when "0100" =>
						lcd_wektijd <= "0101"; -- char_4
					when "0101" =>
						lcd_wektijd <= "0110"; -- char_5
					when "0110" =>
						lcd_wektijd <= "0111"; -- char_6
					when "0111" =>
						lcd_wektijd <= "1000"; -- char_7
					when "1000" =>
						lcd_wektijd <= "1001"; -- char_8
					when "1001" =>
						lcd_wektijd <= "1010"; -- char_9
					when others =>
						lcd_wektijd <= "0001"; -- char_0
				end case;

				if (ready = '0' and ready_buf = '1') then -- falling edge
					if (positie = "010") then
						new_positie <= positie + 1;
						new_state <= selectdata;
					elsif (menu = "010") then
						new_positie <= "000";
						new_state <= selectdata;
					else
						new_positie <= "111";
						new_state <= rust;
					end if;
				else
					new_positie <= positie;
					new_state <= char_m;
				end if;
			when others =>
				new_positie <= "111";
				new_ready_buf <= '0';
				new_min_buf <= (others => '0');
				new_uren_buf <= (others => '0');
				lcd_wektijd <= (others => '0');
				new_state <= rust;
		end case;
	end process;
end behaviour;


