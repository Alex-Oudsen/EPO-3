library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behaviour of dcf_decoder is

	type dcf_state is (idle, newbit, hold_on);

	signal led, new_led: std_logic;
	signal state, new_state: dcf_state;
	signal minute, new_minute: std_logic;
	signal bit_storage, new_bit_storage: std_logic_vector(58 downto 0);
	signal bits_received, new_bits_received: std_logic_vector(5 downto 0);

begin
	dcf_led 		<= led;
	parity_bits(2)		<= bit_storage(58);
	parity_bits(1)		<= bit_storage(35);
	parity_bits(0)		<= bit_storage(28);
	minuten 		<= bit_storage(27 downto 21);
	uren		<= bit_storage(34 downto 29);
	weekdag 		<= bit_storage(44 downto 42);
	dagen		<= bit_storage(41 downto 36);
	maanden 		<= bit_storage(49 downto 45);
	jaren		<= bit_storage(57 downto 50);

	process(clk) is
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				bits_received <= (others => '0');
				bit_storage <= (others => '0');
				minute <= '0';
				led <= '0';
				state <= idle;
			else
				bits_received <= new_bits_received;
				bit_storage <= new_bit_storage;
				minute <= new_minute;
				led <= new_led;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, count, new_bit, minute, bits_received, bit_storage, led) is
	
	variable location: natural range 0 to 59;

	begin
		location := to_integer(unsigned(bits_received));
		new_bit_storage <= bit_storage;

		case state is
			when idle =>
				if(new_bit = '1') then
					new_bits_received <= bits_received;
					new_minute <= minute;
					new_led <= led;
					start_xor <= '0';
					new_state <= newbit;
				elsif(count > 32000 and count < 48000) then
					new_bits_received <= (others => '0');

					if(bits_received = 59) then
						new_minute <= '1';
						new_led <= '1';
					else
						new_minute <= minute;
						new_led <= '0';
					end if;

					start_xor <= '0';
					new_state <= idle;
				else
					new_bits_received <= bits_received;
					new_minute <= minute;
					new_led <= led;
					start_xor <= '0';
					new_state <= idle;
				end if;
			when newbit =>
				if(count <= 7040 and count >= 5760) then
					new_bits_received <= bits_received + 1;
					new_bit_storage(location) <= '1';
				elsif(count <= 3840 and count >= 2560) then
					new_bits_received <= bits_received + 1;
					new_bit_storage(location) <= '0';
				else
					new_bits_received <= (others => '0');
				end if;

				new_minute <= minute;
				new_led <= '1';
				
				if(minute = '1') then
					start_xor <= '1';
				else
					start_xor <= '0';
				end if;

				new_state <= hold_on;
			when hold_on =>
				new_bits_received <= bits_received;
				new_minute <= '0';
				new_led <= '1';
				start_xor <= '0';
				new_state <= idle;
			when others =>
				new_bits_received <= bits_received;
				new_minute <= '0';
				new_led <= '0';
				start_xor <= '0';
				new_state <= idle;
		end case;
	end process;
end behaviour;


