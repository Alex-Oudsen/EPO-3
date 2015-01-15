library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of counter is
	type counter_state is (init, laag, hoog);
	signal count, new_count: unsigned(3 downto 0);
	signal length2, new_length2: unsigned(5 downto 0);
	signal state, new_state: counter_state;
begin
	length <= std_logic_vector(new_length2);
	lbl1: process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') or (licht = '0') then
				state <= init;
				count <= (others => '0');
			else
				state <= new_state;
				count <= new_count;
			end if;
			length2 <= new_length2;
		end if;
	end process;
	lbl2: process(sec, count, length2, state)
	begin
		case state is
			when init =>
				new_length2 <= (others => '1');
				new_count <= (others => '0');
				new_state <= laag;
			when laag =>
				if (sec = '1') then
					if (count = "1111") then
						new_count <= "0001";
						if (length2 /= 0) then
							new_length2 <= length2 -1;
						else
							new_length2 <= length2;
						end if;
					else
						new_count <= count + 1;
						new_length2 <= length2;
					end if;
					new_state <= hoog;
				else
					new_count <= count;
					new_length2 <= length2;
					new_state <= laag;
				end if;
			when hoog =>
				if (sec = '0') then
					new_state <= laag;
				else
					new_state <= hoog;
				end if;
				new_count <= count;
				new_length2 <= length2;
			when others =>
				new_count <= count;
				new_length2 <= length2;
				new_state <= hoog;
		end case;
	end process;
end behaviour;


