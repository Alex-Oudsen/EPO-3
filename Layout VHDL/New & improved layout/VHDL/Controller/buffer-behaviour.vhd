library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of buff is

	type buff_state is (rust, one, zero);
	
	signal state, new_state: buff_state;
	signal knoppen_temp: std_logic_vector(3 downto 0);

begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				knoppen_out <= (others => '0');
				state <= rust;
			else
				knoppen_out <= knoppen_temp;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, knoppen_in)
	begin
		case state is
			when rust =>
				if (knoppen_in(0) = '1' xor knoppen_in(1) = '1' xor knoppen_in(2) = '1' xor knoppen_in(3) = '1') then
					knoppen_temp <= knoppen_in;
					new_state <= one;
				else
					knoppen_temp <= (others => '0');
					new_state <= rust;
				end if;
			when one =>
				knoppen_temp <= (others => '0');
				new_state <= zero;
			when zero =>
				knoppen_temp <= (others => '0');

				if (knoppen_in = "0000") then
					new_state <= rust;
				else
					new_state <= zero;
				end if;
			when others =>
				knoppen_temp <= (others => '0');
				new_state <= rust;
		end case;	
	end process;
end behaviour;


