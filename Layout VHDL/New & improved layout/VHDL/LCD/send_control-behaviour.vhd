library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of send_control is

type control_state is (rust, send_x, send_y, send_c);

signal state, new_state: control_state;
signal selectort, new_selectort, next_selectort: std_logic_vector(2 downto 0);
signal clk_out_state, new_clk_out_state: std_logic;

begin
	selector <= new_selectort;

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				state <= rust;
				selectort <= "111";
				clk_out_state <= '1';
			else
				state <= new_state;
				selectort <= new_selectort;
				clk_out_state <= new_clk_out_state;
			end if;
		end if;
	end process;

	process(selectort)
	begin
		case(selectort) is
			when "000" =>
				next_selectort <= "001";
			when "001" =>
				next_selectort <= "010";
			when "010" =>
				next_selectort <= "011";
			when "011" =>
				next_selectort <= "100";
			when "100" =>
				next_selectort <= "101";
			when "101" =>
				next_selectort <= "110";
			when others =>
				next_selectort <= "000";
		end case;
	end process;

	process(state, selectort, next_selectort, clk_out_state, x, y, c)
	begin
		case(state) is 
			when rust =>
				send_ok <= '0';
				data_out <= (others => '0');
				clk_out <= '1';
				new_clk_out_state <= '1';

				if(c = "000000") then
					new_selectort <= next_selectort;
					new_state <= rust;
				else
					new_selectort <= selectort;
					new_state <= send_x;
				end if;
			when send_x =>
				send_ok <= '0';
				data_out <= x;
				new_selectort <= selectort;

				if (clk_out_state = '1') then
					clk_out <= '0';
					new_clk_out_state <= '0';
					new_state <= send_x;
				else
					clk_out <= '1';
					new_clk_out_state <= '1';
					new_state <= send_y;
				end if;
			when send_y =>
				send_ok <= '1';
				data_out(6) <= '0';
				data_out(5 downto 0) <= y;
				new_selectort <= selectort;

				if (clk_out_state = '1') then
					clk_out <= '0';
					new_clk_out_state <= '0';
					new_state <= send_y;
				else
					clk_out <= '1';
					new_clk_out_state <= '1';
					new_state <= send_c;
				end if;
			when send_c =>
				send_ok <= '0';
				data_out(6) <= '0';
				data_out(5 downto 0) <= c;
				new_selectort <= selectort;

				if (clk_out_state = '1') then
					clk_out <= '0';
					new_clk_out_state <= '0';
					new_state <= send_c;
				else
					clk_out <= '1';
					new_clk_out_state <= '1';
					new_state <= rust;
				end if;
			when others =>
				send_ok <= '0';
				data_out <= (others => '0');
				new_selectort <= "000";
				clk_out <= '1';
				new_clk_out_state <= '1';
				new_state <= rust;
		end case;
	end process;
end behaviour;


