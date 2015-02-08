library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of counter is

	type counter_state is (init, laag, hoog);

	signal state, new_state: counter_state;
	signal count, new_count: std_logic_vector(3 downto 0);
	signal lengte, new_lengte: std_logic_vector(5 downto 0);

begin
	length <= new_lengte;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				lengte <= (others => '0');
				count <= (others => '0');
				state <= init;
			else
				lengte <= new_lengte;
				count <= new_count;
				state <= new_state;
			end if;
		end if;
	end process;
	
	process(state, count, lengte, licht, sec)
	begin
		case state is
			when init =>
				new_lengte <= (others => '1');
				new_count <= (others => '0');

				if (licht = '1') then
					new_state <= laag;
				else
					new_state <= init;
				end if;
			when laag =>
				if (sec = '1' and licht = '1') then
					if (count = "1111") then
						if (lengte /= 0) then
							new_lengte <= lengte - 1;
						else
							new_lengte <= lengte;
						end if;

						new_count <= "0001";
					else
						new_lengte <= lengte;
						new_count <= count + 1;
					end if;

					new_state <= hoog;
				elsif (licht = '1') then
					new_lengte <= lengte;
					new_count <= count;
					new_state <= laag;
				else
					new_lengte <= lengte;
					new_count <= count;
					new_state <= init;
				end if;
			when hoog =>
				new_lengte <= lengte;
				new_count <= count;

				if (sec = '0' and licht = '1') then
					new_state <= laag;
				elsif (licht = '1') then
					new_state <= hoog;
				else
					new_state <= init;
				end if;
			when others =>
				new_lengte <= lengte;
				new_count <= count;
				new_state <= init;
		end case;
	end process;
end behaviour;


