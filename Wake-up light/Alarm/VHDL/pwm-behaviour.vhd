library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of pwm is
	type pwm_state is (hoog, laag, res_state);
	signal counter, new_counter: unsigned(5 downto 0);
	signal state, new_state: pwm_state;
begin
	lbl1: process(clk)
	begin
		if(clk'event and clk = '1') then
			if (reset = '1') and (licht = '0') then
				state <= res_state;
				counter <= (others => '0');
			else
				state <= new_state;
				counter <= new_counter;
			end if;
		end if;
	end process;
	lbl2: process(counter, length, state)
	begin
		case state is
			when res_state =>
				pwm_signal <= '0';
				new_counter <= (others => '0');
				new_state <= laag;
			when laag =>
				pwm_signal <= '0';
				new_counter <= counter + 1;
				if (unsigned(length) <= counter) then
					new_state <= hoog;
				else
					new_state <= laag;
				end if;
			when hoog =>
				pwm_signal <= '1';
				new_counter <= counter + 1;
				if (unsigned(length) <= counter) then
					new_state <= hoog;
				else
					new_state <= laag;
				end if;
			when others =>
				pwm_signal <= '0';
				new_counter <= counter;
				new_state <= laag;
		end case;
	end process;
end behaviour;





