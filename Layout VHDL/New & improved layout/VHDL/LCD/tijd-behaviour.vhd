library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of tijd is

	type tijd_state is (rust, selectdata, dubbele_punt, char);

	signal state, new_state: tijd_state;
	signal positie, new_positie: std_logic_vector(2 downto 0);
	signal data_buffer: std_logic_vector(3 downto 0);
	signal ready_buf, new_ready_buf: std_logic;
	signal hz_state, new_hz_state: std_logic;
	signal punt, new_punt: std_logic;

begin
	position <= positie;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= rust;
				positie <= (others => '1');
				ready_buf <= '0';
				hz_state <= '0';
				punt <= '0';
			else
				state <= new_state;
				positie <= new_positie;
				ready_buf <= new_ready_buf;
				hz_state <= new_hz_state;
				punt <= new_punt;
			end if;
		end if;
	end process;

	process(positie, minuten, uren)
	begin
		case positie is
			when "000" =>
				data_buffer(0) <= minuten(0);
				data_buffer(1) <= minuten(1);
				data_buffer(2) <= minuten(2);
				data_buffer(3) <= minuten(3);
			when "001" =>
				data_buffer(0) <= minuten(4);
				data_buffer(1) <= minuten(5);
				data_buffer(2) <= minuten(6);
				data_buffer(3) <= '0';
			when "010" =>
				data_buffer(0) <= uren(0);
				data_buffer(1) <= uren(1);
				data_buffer(2) <= uren(2);
				data_buffer(3) <= uren(3);
			when "011" =>
				data_buffer(0) <= uren(4);
				data_buffer(1) <= uren(5);
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
			when others =>
				data_buffer <= (others => '0');
		end case;
	end process;

	process(state, hz_sig, hz_state, ready, ready_buf, punt, positie, data_buffer)
	begin
		case state is
			when rust =>
				new_positie <= (others => '0');
				new_ready_buf <= ready;
				new_hz_state <= hz_sig;
				new_punt <= punt;
				lcd_tijd <= (others => '0');

				if (hz_state /= hz_sig and hz_sig = '1') then -- rising 1_hz edge
					new_state <= selectdata;
				else
					new_state <= rust;
				end if;
			when selectdata =>
				new_positie <= positie;
				new_ready_buf <= ready;
				new_hz_state <= hz_sig;
				new_punt <= punt;
				lcd_tijd <= (others => '0');

				if (positie = "100") then
					new_state <= dubbele_punt;
				elsif (positie < "100") then
					new_state <= char;
				else
					new_state <= rust;
				end if;
			when char =>
				new_ready_buf <= ready;
				new_hz_state <= hz_sig;
				new_punt <= punt;

				case (data_buffer) is 
					when "0001" =>
						lcd_tijd <= "0010"; -- char_1
					when "0010" =>
						lcd_tijd <= "0011"; -- char_2
					when "0011" =>
						lcd_tijd <= "0100"; -- char_3
					when "0100" =>
						lcd_tijd <= "0101"; -- char_4
					when "0101" =>
						lcd_tijd <= "0110"; -- char_5
					when "0110" =>
						lcd_tijd <= "0111"; -- char_6
					when "0111" =>
						lcd_tijd <= "1000"; -- char_7
					when "1000" =>
						lcd_tijd <= "1001"; -- char_8
					when "1001" =>
						lcd_tijd <= "1010"; -- char_9
					when others =>
						lcd_tijd <= "0001"; -- char_0
				end case;

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_positie <= positie + 1;
					new_state <= selectdata;
				else
					new_positie <= positie;
					new_state <= char;
				end if;
			when dubbele_punt =>
				new_ready_buf <= ready;
				new_hz_state <= hz_sig;

				if (punt = '1') then
					lcd_tijd <= "1011"; -- dubbele_punt_c_aan

					if(ready = '0' and ready_buf = '1') then -- falling edge
						new_punt <= '0';
						new_positie <= positie + 1;
						new_state <= selectdata;
					else
						new_punt <= punt;
						new_positie <= positie;
						new_state <= dubbele_punt;
					end if;
				else
					lcd_tijd <= "1100"; -- dubbele_punt_c_uit

					if(ready = '0' and ready_buf = '1') then -- falling edge
						new_punt <= '1';
						new_positie <= positie + 1;
						new_state <= selectdata;
					else
						new_punt <= punt;
						new_positie <= positie;
						new_state <= dubbele_punt;
					end if;
				end if;
			when others =>
				new_positie <= positie;
				new_ready_buf <= '0';
				new_hz_state <= '0';
				new_punt <= '0';
				lcd_tijd <= (others => '0');
				new_state <= rust;
		end case;
	end process;
end behaviour;


