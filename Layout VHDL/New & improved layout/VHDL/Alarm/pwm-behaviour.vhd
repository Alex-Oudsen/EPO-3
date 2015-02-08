library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of pwm is

	type pwm_state is (hoog, laag, res_state);

	signal state, new_state: pwm_state;
	signal counter, new_counter: std_logic_vector(5 downto 0);

begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if (reset = '1') then
				counter <= (others => '0');
				state <= res_state;
			else
				counter <= new_counter;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, counter, length, licht)
	begin
		case state is
			when res_state =>
				pwm_signal <= '0';
				new_counter <= (others => '0');

				if (licht = '1') then
					new_state <= laag;
				else
					new_state <= res_state;
				end if;
			when laag =>
				pwm_signal <= '0';
				new_counter <= counter + 1;

				if (length <= counter and licht = '1') then
					new_state <= hoog;
				elsif (licht = '1') then
					new_state <= laag;
				else
					new_state <= res_state;
				end if;
			when hoog =>
				pwm_signal <= '1';
				new_counter <= counter + 1;

				if (length <= counter and licht = '1') then
					new_state <= hoog;
				elsif (licht = '1') then
					new_state <= laag;
				else
					new_state <= res_state;
				end if;
			when others =>
				pwm_signal <= '0';
				new_counter <= counter;
				new_state <= res_state;
		end case;
	end process;
end behaviour;





