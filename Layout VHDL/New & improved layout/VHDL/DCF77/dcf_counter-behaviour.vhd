library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of dcf_counter is

	type count_state is (idle, rising, dcf_high, hold);

	signal state, new_state: count_state;
	signal next_bit, new_next_bit: std_logic;
	signal counter, new_counter: std_logic_vector(15 downto 0);

begin
	count <= counter;
	new_bit <= next_bit;

	process(clk) is
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				counter <= (others => '0');
				next_bit <= '0';
				state <= idle;
			else
				counter <= new_counter;
				next_bit <= new_next_bit;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, dcf_rise, dcf_fall, counter, next_bit) is
	begin
		case state is
			when idle =>
				if(dcf_rise = '1') then
					new_counter <= (others => '0');
					new_next_bit <= '0';
					new_state <= rising;
				else
					new_counter <= counter + 1;
					new_next_bit <= '0';
					new_state <= idle;
				end if;
			when rising =>
				new_counter <= counter + 1;
				new_next_bit <= '0';

				if(counter > 640) then
					new_state <= dcf_high;
				elsif(dcf_fall = '1') then
					new_state <= idle;
				else
					new_state <= rising;
				end if;
			when dcf_high =>
				if(dcf_fall = '1' and counter > 2560) then
					new_counter <= counter;
					new_next_bit <= '1';
					new_state <= hold;
				else
					new_counter <= counter + 1;
					new_next_bit <= '0';
					new_state <= dcf_high;
				end if;
			when hold =>
				new_counter <= counter;
				new_next_bit <= next_bit;
				new_state <= idle;
			when others =>
				new_counter <= (others => '0');
				new_next_bit <= '0';
				new_state <= idle;
		end case;
	end process;
end behaviour;


