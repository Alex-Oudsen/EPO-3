library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of send_control is

type states is (rust, send_x, send_x_clock, send_y, send_y_clock, send_c, send_c_clock);

signal next_state, state : states;

signal selectort, new_selectort, next_selectort : std_logic_vector(2 downto 0);
signal data : std_logic_vector(6 downto 0);


begin

process(clk, reset, next_state)
begin
if(rising_edge(clk)) then
	if(reset = '1') then
		state <= rust;
		selectort <= "000";
	else
		state <= next_state;
		selectort <= new_selectort;
	end if;
end if;
end process;

process(state, next_selectort, x, y, c)
begin
	case(state) is 
		when rust =>
			data <= "0000000";
			clk_out <= '1';
			if(c = "0000000") then
				next_state <= rust;
				new_selectort <= next_selectort;
			else
				next_state <= send_x;
				new_selectort <= selectort;
			end if;
		when send_x =>
			data <= x;
			clk_out <= '0';
			new_selectort <= selectort;
			next_state <= send_x_clock;
		when send_x_clock =>
			data <= x;
			clk_out <= '1';
			new_selectort <= selectort;
			next_state <= send_y;
		when send_y =>
			data(6) <= '0';
			data(5 downto 0) <= y;
			clk_out <= '0';
			new_selectort <= selectort;
			next_state <= send_y_clock;
		when send_y_clock =>
			data(6) <= '0';
			data(5 downto 0) <= y;
			clk_out <= '1';
			new_selectort <= selectort;
			next_state <= send_c;
		when send_c =>
			data <= c;
			clk_out <= '0';
			new_selectort <= selectort;
			next_state <= send_c_clock;
		when send_c_clock =>
			data <= c;
			clk_out <= '1';
			new_selectort <= next_selectort;
			next_state <= rust;
	end case;
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
			next_selectort <= "000";
		when others =>
			next_selectort <= "000";
	end case;
end process;

data_out <= data;
selector <= selectort;

end behaviour;





