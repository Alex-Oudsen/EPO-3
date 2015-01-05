-- Alex Oudsen, 4325494
-- Deze klokdeler deelt de frequentie van de ingang clk met een factor 32000
-- en wordt gebruikt om de systeemklok van 32 kHz te delen tot een 1 Hz signaal

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of klokdeler is

	type kd_state is (clear, counting, switch);		-- Declaratie van de gebruikte states
	signal state, new_state: kd_state;

	signal count, new_count: std_logic_vector(13 downto 0);	-- Voor het tellen tot 32000
	signal temp, new_temp: std_logic;			-- Interne versie van het 1 Hz signaal

begin
	clk_1hz <= temp;					-- Uitvoeren van het interne 1 Hz signaal

	process(clk) is						
	begin
		if(clk'event and clk = '1') then		-- Opgaande klokflank v.d. systeemklok
			if(reset = '1') then			-- Systeemreset
				temp <= '0';
				count <= (others => '0');
				state <= clear;
			else
				temp <= new_temp;
				count <= new_count;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, count, temp) is
	begin
		case state is
			when clear =>				-- Dit is de reset state
				new_temp <= '0';
				new_count <= (others => '0');
				new_state <= counting;
			when counting =>			-- Er wordt geteld
				new_temp <= temp;
				new_count <= count + 1;
				if(count < 15998) then
					new_state <= counting;
				else
					new_state <= switch;
				end if;
			when switch =>				-- Inverteer de uitgangswaarde
				new_temp <= not temp;
				new_count <= (others => '0');
				new_state <= counting;
			when others =>
				new_temp <= '1';
				new_count <= (others => '0');
				new_state <= clear;
		end case;
	end process;
end behaviour;
