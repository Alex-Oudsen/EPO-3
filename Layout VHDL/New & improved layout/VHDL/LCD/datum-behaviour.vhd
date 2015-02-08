library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of datum is 

	type date_state is (rust, selectdata, cdvdw, cgetal);
	
	signal state, new_state: date_state;
	signal data_buffer: std_logic_vector(3 downto 0); 
	signal positie, new_positie: std_logic_vector(2 downto 0);
	signal ready_buf, new_ready_buf: std_logic;
	
begin
	position <= positie;

	process (clk)
	begin 
		if (clk'event and clk = '1') then
			if (reset= '1') then 
				positie <= (others => '1');
				state <= rust;
				ready_buf <= '0';
			else
				positie <= new_positie;
				state <= new_state;
				ready_buf <= new_ready_buf;
			end if;
		end if;		
	end process;

	process (positie, dagvdweek, dagvdmaand, maand, jaar) 
	begin
		case positie is 
			when "000" => 
				data_buffer(0) <= dagvdweek(0);
				data_buffer(1) <= dagvdweek(1);
				data_buffer(2) <= dagvdweek(2);
				data_buffer(3) <= '0';
			when "001" => 
				data_buffer(0) <= dagvdmaand(4);
				data_buffer(1) <= dagvdmaand(5);
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
			when "010" => 
				data_buffer(0) <= dagvdmaand(0);
				data_buffer(1) <= dagvdmaand(1);
				data_buffer(2) <= dagvdmaand(2);
				data_buffer(3) <= dagvdmaand(3);
			when "011" => 
				data_buffer(0) <= maand(4);
				data_buffer(1) <= '0';
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
			when "100" => 
				data_buffer(0) <= maand(0);
				data_buffer(1) <= maand(1);
				data_buffer(2) <= maand(2);
				data_buffer(3) <= maand(3);
			when "101" => 
				data_buffer(0) <= jaar(4);
				data_buffer(1) <= jaar(5);
				data_buffer(2) <= jaar(6);
				data_buffer(3) <= jaar(7);
			when "110" => 
				data_buffer(0) <= jaar(0);
				data_buffer(1) <= jaar(1);
				data_buffer(2) <= jaar(2);
				data_buffer(3) <= jaar(3);
			when others =>
				data_buffer <= (others => '0');
		end case; 
	end process;

	process (state, ready, date_ready, positie, data_buffer, ready_buf)
	begin 
		case state is
			when rust => 
				new_ready_buf <= ready;
				new_positie <= (others => '0');
				lcd_datum <= (others => '0'); -- char_rust

				if (date_ready = '1') then 
					new_state <= selectdata;
				else 
					new_state <= rust;
				end if;
			when selectdata =>
				new_ready_buf <= ready;
				new_positie <= positie;
				lcd_datum <= (others => '0'); -- char_rust

				if (positie = "000") then
					new_state <= cdvdw;
				elsif (positie /= 7) then
					new_state <= cgetal;	
				elsif (date_ready = '1') then 
					new_state <= selectdata;
				else
					new_state <= rust;
				end if;
			when cdvdw =>
				new_ready_buf <= ready;
				case (data_buffer) is 
					when "0001" => 
						lcd_datum <= "00001"; -- char_ma
					when "0010" => 
						lcd_datum <= "00010"; -- char_di
					when "0011" => 
						lcd_datum <= "00011"; -- char_wo
					when "0100" => 
						lcd_datum <= "00100"; -- char_do
					when "0101" => 	
						lcd_datum <= "00101"; -- char_vr
					when "0110" => 
						lcd_datum <= "00110"; -- char_za
					when "0111" => 
						lcd_datum <= "00111"; -- char_zo
					when others =>
						lcd_datum <= "00000"; -- char_rust
				end case;
				
				if (ready_buf = '1' and ready = '0') then -- falling edge van ready
					new_positie <= positie + 1;
					new_state <= selectdata;
				else
					new_positie <= positie;
					new_state <= cdvdw;
				end if;
			when cgetal =>	
				new_ready_buf <= ready;
				case (data_buffer) is 
					when "0000" => 
						lcd_datum <= "01000"; -- char_0
					when "0001" => 
						lcd_datum <= "01001"; -- char_1
					when "0010" => 
						lcd_datum <= "01010"; -- char_2
					when "0011" => 
						lcd_datum <= "01011"; -- char_3
					when "0100" => 
						lcd_datum <= "01100"; -- char_4
					when "0101" => 
						lcd_datum <= "01101"; -- char_5
					when "0110" => 
						lcd_datum <= "01110"; -- char_6
					when "0111" => 
						lcd_datum <= "01111"; -- char_7
					when "1000" => 
						lcd_datum <= "10000"; -- char_8
					when "1001" => 
						lcd_datum <= "10001"; -- char_9
					when others => 
						lcd_datum <= "00000"; -- char_rust
				end case; 		
	
				if (ready_buf = '1' and ready = '0') then -- falling edge van ready
					new_positie <= positie + 1;
					new_state <= selectdata;
				else 
					new_positie <= positie;
					new_state <= cgetal;
				end if;
			when others =>
				new_ready_buf <= '0';
				new_positie <= positie;
				lcd_datum <= (others => '0'); -- char_rust
				new_state <= rust;
		end case;
	end process;
end behaviour;











