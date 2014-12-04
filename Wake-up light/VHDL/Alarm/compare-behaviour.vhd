library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of compare is
	type comp_state is (steady, start, final);
	signal state, new_state: comp_state;
	signal alarm_uur: std_logic_vector(4 downto 0);
	signal alarm_min: std_logic_vector(5 downto 0);
begin
	lbl1: process (clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') or (stop_alarm = '1') then
				state <= steady;
			else
				if (to_integer(unsigned(wekker_min)) > 14) then
					alarm_min <= std_logic_vector(to_unsigned(to_integer(unsigned(wekker_min)) - 15, 6));
					alarm_uur <= wekker_uur;
				else
					alarm_min <= std_logic_vector(to_unsigned(60 - (15-to_integer(unsigned(wekker_min))),6));
					if (to_integer(unsigned(wekker_uur)) = 0) then
						alarm_uur <= std_logic_vector(to_unsigned(23, 5));
					else
						alarm_uur <= std_logic_vector(to_unsigned(to_integer(unsigned(wekker_uur)) - 1, 5));
					end if;
				end if;
				state <= new_state;
			end if;
		end if;
	end process;
	lbl2: process (state, tijd_min, tijd_uur, wekker_min, wekker_uur)
	begin
		case state is
			when steady =>
				if (alarm_uur = tijd_uur) and (alarm_min = tijd_min) then
					geluid <= '0';
					licht <= '1';					
					new_state <= start;
				else
					geluid <= '0';
					licht <= '0';
					new_state <= steady;
				end if;
			when start =>
				if (wekker_uur = tijd_uur) and (wekker_min = tijd_min) then
					geluid <= '1';
					licht <= '1';					
					new_state <= final;
				else
					geluid <= '0';
					licht <= '1';
					new_state <= start;
				end if;
			when final =>
				geluid <= '1';
				licht <= '1';
				new_state <= final;
			when others =>
				new_state <= state;
		end case;
	end process;
end behaviour;
