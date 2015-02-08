library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of send_bus is

	-- Posities
	constant tijd_x1:    std_logic_vector(6 downto 0) := "0010101";
	constant tijd_x2:    std_logic_vector(6 downto 0) := "0100101";
	constant tijd_x3:    std_logic_vector(6 downto 0) := "0110101";
	constant tijd_x4:    std_logic_vector(6 downto 0) := "0111000";
	constant tijd_x5:    std_logic_vector(6 downto 0) := "1001000";
	constant tijd_y1:    std_logic_vector(5 downto 0) := "000011";
	constant tijd_y2:    std_logic_vector(5 downto 0) := "000110";
	constant datum_x1:   std_logic_vector(6 downto 0) := "0010101";
	constant datum_x2:   std_logic_vector(6 downto 0) := "0101100";
	constant datum_x3:   std_logic_vector(6 downto 0) := "0110010";
	constant datum_x4:   std_logic_vector(6 downto 0) := "0111100";
	constant datum_x5:   std_logic_vector(6 downto 0) := "1000010";
	constant datum_x6:   std_logic_vector(6 downto 0) := "1001100";
	constant datum_x7:   std_logic_vector(6 downto 0) := "1010010";
	constant datum_y:    std_logic_vector(5 downto 0) := "011011";
	constant wektijd_x1: std_logic_vector(6 downto 0) := "1011100";
	constant wektijd_x2: std_logic_vector(6 downto 0) := "1100010";
	constant wektijd_x3: std_logic_vector(6 downto 0) := "1101010";
	constant wektijd_x4: std_logic_vector(6 downto 0) := "1110000";
	constant wektijd_y:  std_logic_vector(5 downto 0) := "010010";
	constant menu_x: 		  std_logic_vector(6 downto 0) := "0000011";
	constant menu_y: 		  std_logic_vector(5 downto 0) := "100011";
	constant dcf_x: 		   std_logic_vector(6 downto 0) := "0000001";
	constant dcf_y: 		   std_logic_vector(5 downto 0) := "000001";
	constant geluid_x:   std_logic_vector(6 downto 0) := "0000001";
	constant geluid_y:   std_logic_vector(5 downto 0) := "001100";
	constant licht_x:    std_logic_vector(6 downto 0) := "0000001";
	constant licht_y:    std_logic_vector(5 downto 0) := "010111";

	-- Karakters
	constant dpunt_aan: std_logic_vector(5 downto 0) := "000001";
	constant dpunt_uit: std_logic_vector(5 downto 0) := "000010";
	constant grote_1:   std_logic_vector(5 downto 0) := "000011";
	constant grote_2:   std_logic_vector(5 downto 0) := "000100";
	constant grote_3:   std_logic_vector(5 downto 0) := "000101";
	constant grote_4:   std_logic_vector(5 downto 0) := "000110";
	constant grote_5:   std_logic_vector(5 downto 0) := "000111";
	constant grote_6:   std_logic_vector(5 downto 0) := "001000";
	constant grote_7:   std_logic_vector(5 downto 0) := "001001";
	constant grote_8:   std_logic_vector(5 downto 0) := "001010";
	constant grote_9:   std_logic_vector(5 downto 0) := "001011";
	constant grote_0:   std_logic_vector(5 downto 0) := "001100";
	constant kleine_1:  std_logic_vector(5 downto 0) := "001110";
	constant kleine_2:  std_logic_vector(5 downto 0) := "001111";
	constant kleine_3:  std_logic_vector(5 downto 0) := "010000";
	constant kleine_4:  std_logic_vector(5 downto 0) := "010001";
	constant kleine_5:  std_logic_vector(5 downto 0) := "010010";
	constant kleine_6:  std_logic_vector(5 downto 0) := "010011";
	constant kleine_7:  std_logic_vector(5 downto 0) := "010100";
	constant kleine_8:  std_logic_vector(5 downto 0) := "010101";
	constant kleine_9:  std_logic_vector(5 downto 0) := "010110";
	constant kleine_0:  std_logic_vector(5 downto 0) := "010111";
	constant dag_ma:    std_logic_vector(5 downto 0) := "011000";
	constant dag_di:    std_logic_vector(5 downto 0) := "011001";
	constant dag_wo:    std_logic_vector(5 downto 0) := "011010";
	constant dag_do:    std_logic_vector(5 downto 0) := "011011";
	constant dag_vr:    std_logic_vector(5 downto 0) := "011100";
	constant dag_za:    std_logic_vector(5 downto 0) := "011101";
	constant dag_zo:    std_logic_vector(5 downto 0) := "011110";
	constant sound_on:  std_logic_vector(5 downto 0) := "100000";
	constant sound_off: std_logic_vector(5 downto 0) := "100001";
	constant light_on:  std_logic_vector(5 downto 0) := "100010";
	constant light_off: std_logic_vector(5 downto 0) := "100011";
	constant dcf_good:  std_logic_vector(5 downto 0) := "100100";
	constant dcf_bad:   std_logic_vector(5 downto 0) := "100101";
	constant m_uren:    std_logic_vector(5 downto 0) := "100110";
	constant m_min:     std_logic_vector(5 downto 0) := "100111";
	constant m_sound:   std_logic_vector(5 downto 0) := "101000";
	constant m_light:   std_logic_vector(5 downto 0) := "101001";
	constant ma_on:     std_logic_vector(5 downto 0) := "101010";
	constant m_time:    std_logic_vector(5 downto 0) := "101011";
	constant ma_off:    std_logic_vector(5 downto 0) := "101100";

	signal new_x: std_logic_vector(6 downto 0);
	signal new_y: std_logic_vector(5 downto 0);
	signal new_c: std_logic_vector(5 downto 0);

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				x_out <= (others => '0');
				y_out <= (others => '0');
				c_out <= (others => '0');
			else
				x_out <= new_x;
				y_out <= new_y;
				c_out <= new_c;
			end if;
		end if;
	end process;

	process(selector, position_0, position_1, position_2, new_c)
	begin
		case selector is
			when "000" =>
				case position_0 is
					when "000" =>
						new_x <= tijd_x5;
						new_y <= tijd_y1;
					when "001" =>
						new_x <= tijd_x4;
						new_y <= tijd_y1;
					when "010" =>
						new_x <= tijd_x2;
						new_y <= tijd_y1;
					when "011" =>
						new_x <= tijd_x1;
						new_y <= tijd_y1;
					when "100" =>
						new_x <= tijd_x3;
						new_y <= tijd_y2;
					when others =>
						new_x <= (others => '1');
						new_y <= (others => '1');
				end case;
			when "001" =>
				case position_1 is
					when "000" =>
						new_x <= datum_x1;
						new_y <= datum_y;
					when "001" =>
						new_x <= datum_x2;
						new_y <= datum_y;
					when "010" =>
						new_x <= datum_x3;
						new_y <= datum_y;
					when "011" =>
						new_x <= datum_x4;
						new_y <= datum_y;
					when "100" =>
						new_x <= datum_x5;
						new_y <= datum_y;
					when "101" =>
						new_x <= datum_x6;
						new_y <= datum_y;
					when "110" =>
						new_x <= datum_x7;
						new_y <= datum_y;
					when others =>
						new_x <= (others => '1');
						new_y <= (others => '1');
					end case;
			when "010" =>
				case position_2 is
					when "000" =>
						new_x <= wektijd_x4;
						new_y <= wektijd_y;
					when "001" =>
						new_x <= wektijd_x3;
						new_y <= wektijd_y;
					when "010" =>
						new_x <= wektijd_x2;
						new_y <= wektijd_y;
					when "011" =>
						new_x <= wektijd_x1;
						new_y <= wektijd_y;
					when others =>
						new_x <= (others => '1');
						new_y <= (others => '1');
					end case;
			when "011" =>
				new_x <= menu_x;
				new_y <= menu_y;
			when "100" =>
				new_x <= dcf_x;
				new_y <= dcf_y;
			when "101" =>
				new_x <= geluid_x;
				new_y <= geluid_y;
			when "110" =>
				new_x <= licht_x;
				new_y <= licht_y;
			when others =>
				new_x <= (others => '1');
				new_y <= (others => '1');
		end case;
	end process;

	process(selector, send_ok, c_in_0, c_in_1, c_in_2, c_in_3, c_in_4, c_in_5, c_in_6)
	begin
		case (selector) is
			when "000" =>
				case c_in_0 is
					when "0001" =>
						new_c <= grote_0;
					when "0010" =>
						new_c <= grote_1;
					when "0011" =>
						new_c <= grote_2;
					when "0100" =>
						new_c <= grote_3;
					when "0101" =>
						new_c <= grote_4;
					when "0110" =>
						new_c <= grote_5;
					when "0111" =>
						new_c <= grote_6;
					when "1000" =>
						new_c <= grote_7;
					when "1001" =>
						new_c <= grote_8;
					when "1010" =>
						new_c <= grote_9;
					when "1011" =>
						new_c <= dpunt_aan;
					when "1100" =>
						new_c <= dpunt_uit;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_0 <= '1';
				else
					ready_0 <= '0';
				end if;

				ready_1 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
			when "001" =>
				case c_in_1 is
					when "00001" =>
						new_c <= dag_ma;
					when "00010" =>
						new_c <= dag_di;
					when "00011" =>
						new_c <= dag_wo;
					when "00100" =>
						new_c <= dag_do;
					when "00101" =>
						new_c <= dag_vr;
					when "00110" =>
						new_c <= dag_za;
					when "00111" =>
						new_c <= dag_zo;
					when "01000" =>
						new_c <= kleine_0;
					when "01001" =>
						new_c <= kleine_1;
					when "01010" =>
						new_c <= kleine_2;
					when "01011" =>
						new_c <= kleine_3;
					when "01100" =>
						new_c <= kleine_4;
					when "01101" =>
						new_c <= kleine_5;
					when "01110" =>
						new_c <= kleine_6;
					when "01111" =>
						new_c <= kleine_7;
					when "10000" =>
						new_c <= kleine_8;
					when "10001" =>
						new_c <= kleine_9;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_1 <= '1';
				else
					ready_1 <= '0';
				end if;

				ready_0 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
			when "010" =>
				case c_in_2 is
					when "0001" =>
						new_c <= kleine_0;
					when "0010" =>
						new_c <= kleine_1;
					when "0011" =>
						new_c <= kleine_2;
					when "0100" =>
						new_c <= kleine_3;
					when "0101" =>
						new_c <= kleine_4;
					when "0110" =>
						new_c <= kleine_5;
					when "0111" =>
						new_c <= kleine_6;
					when "1000" =>
						new_c <= kleine_7;
					when "1001" =>
						new_c <= kleine_8;
					when "1010" =>
						new_c <= kleine_9;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_2 <= '1';
				else
					ready_2 <= '0';
				end if;

				ready_0 <= '0';
				ready_1 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
			when "011" =>
				case c_in_3 is
					when "001" =>
						new_c <= m_uren;
					when "010" =>
						new_c <= m_min;
					when "011" =>
						new_c <= m_light;
					when "100" =>
						new_c <= m_sound;
					when "101" =>
						new_c <= m_time;
					when "110" =>
						new_c <= ma_on;
					when "111" =>
						new_c <= ma_off;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_3 <= '1';
				else
					ready_3 <= '0';
				end if;

				ready_0 <= '0';
				ready_1 <= '0';
				ready_2 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
			when "100" =>
				case c_in_4 is
					when "01" =>
						new_c <= dcf_good;
					when "10" =>
						new_c <= dcf_bad;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_4 <= '1';
				else
					ready_4 <= '0';
				end if;

				ready_0 <= '0';
				ready_1 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
			when "101" =>
				case c_in_5 is
					when "01" =>
						new_c <= sound_on;
					when "10" =>
						new_c <= sound_off;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_5 <= '1';
				else
					ready_5 <= '0';
				end if;

				ready_0 <= '0';
				ready_1 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_6 <= '0';
			when "110" =>
				case c_in_6 is
					when "01" =>
						new_c <= light_on;
					when "10" =>
						new_c <= light_off;
					when others =>
						new_c <= (others => '0');
				end case;

				if (send_ok = '1') then
					ready_6 <= '1';
				else
					ready_6 <= '0';
				end if;

				ready_0 <= '0';
				ready_1 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
			when others =>
				new_c <= (others => '0');
				ready_0 <= '0';
				ready_1 <= '0';
				ready_2 <= '0';
				ready_3 <= '0';
				ready_4 <= '0';
				ready_5 <= '0';
				ready_6 <= '0';
		end case;
	end process;
end behaviour;


