-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- De dcf_decoder filtert uit het digitale dcf ingangssignaal
-- de gewenste bits waarmee datum en tijd zijn gecodeerd
-- Bovendien worden de drie bijbehorende parity_bits
-- ook meegegeven aan het volgende onderdeel
-- Het uitgangssignaal dcf_led geeft aan of
-- het dcf signaal goed wordt ontvangen
-- door aan te gaan op het moment dat
-- een bit wordt ingelezen uit het dcf signaal

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behaviour of dcf_decoder is

type dcf_state is (idle, rising, dcf_high, falling);

signal state, new_state: dcf_state;
signal minute, new_minute: std_logic;
signal counter, new_counter: std_logic_vector(15 downto 0);
signal bit_storage, new_bit_storage: std_logic_vector(58 downto 0);
signal bits_received, new_bits_received: std_logic_vector(5 downto 0);

begin
	minuten 	<= bit_storage(27 downto 21);
	uren		<= bit_storage(34 downto 29);
	weekdag 	<= bit_storage(44 downto 42);
	dagen		<= bit_storage(41 downto 36);
	maanden 	<= bit_storage(49 downto 45);
	jaren		<= bit_storage(57 downto 50);
	parity_bits(2)	<= bit_storage(58);
	parity_bits(1)	<= bit_storage(35);
	parity_bits(0)	<= bit_storage(28);

	process(clk, reset) is
	begin
		if(reset = '1') then			-- Systeemreset
			bits_received <= (others => '0');
			bit_storage <= (others => '0');
			counter <= (others => '0');
			minute <= '0';
			state <= idle;
		elsif(clk'event and clk = '1') then	-- Opgaande klokflank v.d. systeemklok
			bits_received <= new_bits_received;
			bit_storage <= new_bit_storage;
			counter <= new_counter;
			minute <= new_minute;
			state <= new_state;
		end if;
	end process;

	process(dcf_rise, dcf_fall, state, counter, minute, bits_received) is
	
	variable location: natural range 0 to 59;

	begin
		location := to_integer(unsigned(bits_received));

		-- Dit is in plaats van else statements binnen de cases
		new_bits_received <= bits_received;
		new_bit_storage <= bit_storage;
		start_xor <= '0';
		dcf_led <= '0';

		case state is
			when idle =>
				-- Controleer op een rising edge van het dcf signaal
				if(dcf_rise = '1') then
					new_counter <= (others => '0');
					new_minute <= minute;
					new_state <= rising;
				-- Controleer of er een nieuwe minuut gaat beginnen
				elsif(counter > 32000 and counter < 48000) then
					-- Initialiseer voor een nieuwe minuut
					new_bits_received <= (others => '0');

					-- Controle of er niet toevallig een seconde is gemist
					if(bits_received = 59) then
						new_minute <= '1';
					else
						new_minute <= minute;
					end if;

					new_counter <= counter + 1;
					new_state <= idle;
				else
					new_counter <= counter + 1;
					new_minute <= minute;
					new_state <= idle;
				end if;
			when rising =>
				-- Geef een seintje als een nieuwe minuut is begonnen
				if(minute = '1') then
					start_xor <= '1';
					new_minute <= minute;
				else
					start_xor <= '0';
					new_minute <= minute;
				end if;

				if(counter > 1) then
					start_xor <= '0';
				end if;

				-- Maak verschil tussen een dcf_puls en een spike/glitch
				if(counter > 640) then
					new_state <= dcf_high;
				elsif(dcf_fall = '1') then
					new_state <= idle;
				else
					new_state <= rising;
				end if;

				new_counter <= counter + 1;
			when dcf_high =>
				-- Wacht op een falling edge van het dcf signaal
				-- Reageer bovendien niet op een falling edge t.g.v. een spike/glitch
				if(dcf_fall = '1' and counter > 2560) then
					if(counter <= 7040 and counter >= 5760) then
						new_bits_received <= bits_received + 1;
						new_bit_storage(location) <= '1';
					elsif(counter <= 3840 and counter >= 2560) then
						new_bits_received <= bits_received + 1;
						new_bit_storage(location) <= '0';
					end if;

					new_state <= falling;
				else
					dcf_led <= '1';
					new_counter <= counter + 1;
					new_minute <= minute;
					new_state <= dcf_high;
				end if;
			when falling =>
				start_xor <= '0';
				new_minute <= '0';
				new_counter <= (others => '0');
				new_state <= idle;
			when others =>			-- Dummy state, zou nooit mogen voorkomen
				new_counter <= (others => '0');
				new_minute <= '0';
				start_xor <= '0';
				new_state <= idle;
		end case;
	end process;
end behaviour;