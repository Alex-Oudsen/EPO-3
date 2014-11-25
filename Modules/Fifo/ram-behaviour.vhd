library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of ram is
	type ram_array is array (7 downto 0) of std_logic_vector (7 downto 0);
	type ram_state is (STEADY, RESETSTATE);
	signal dOut_temp, dOut_steady : std_logic_vector (7 downto 0);
	signal new_ram, ram : ram_array;
	signal state, new_state : ram_state;
begin
	lbl1: process (clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= RESETSTATE;
			else
				ram <= new_ram;
				dOut <= dOut_temp;
				dOut_steady <= dOut_temp;
				state <= new_state;
			end if;
		end if;
	end process;
	lbl2: process (address, we, do, state, clk)
	begin
		case state is
			when RESETSTATE =>
				dOut_temp <= "00000000";
				for J in 0 to 7 loop
					new_ram(J) <= "00000000";
				end loop;
				new_state <= STEADY;
			when STEADY =>
				if (do = '0') then
					new_ram <= ram;
					dOut_temp <= dOut_steady;
					new_state <= STEADY;
				elsif (we = '0' and do = '1') then
					dOut_temp <= ram(0);
					for J in 1 to 7 loop
						new_ram(J-1) <= ram(J);
					end loop;
					new_ram(7) <= "00000000";
					new_state <= STEADY;
				elsif (we = '1' and do = '1') then
					dOut_temp <= dOut_steady;
					for J in 0 to 7 loop
						if (J = to_integer(unsigned(address))) then
							new_ram(J) <= dIn;
						else
							new_ram(J) <= ram(J);
						end if;
					end loop;
					new_state <= STEADY;
				else
					dOut_temp <= dOut_steady;
					new_ram <= ram;
					dOut_temp <= dOut_steady;
					new_state <= STEADY;
				end if;
			when others =>
				dOut_temp <= dOut_steady;
				new_ram <= ram;
				dOut_temp <= dOut_steady;
				new_state <= STEADY;
		end case;
	end process;
end behaviour;




















