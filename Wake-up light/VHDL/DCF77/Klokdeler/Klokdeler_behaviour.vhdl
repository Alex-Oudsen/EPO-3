-- Alex Oudsen, 4325494
-- Deze klokdeler deelt de frequentie van een periodiek signaal met een factor 32
-- en wordt gebruikt om de systeemklok van 32 kHz te delen tot een 1 Hz signaal

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of klokdeler is

type kd_state is (clear, counting, switch);

signal state, new_state: kd_state;
signal count: std_logic_vector(13 downto 0);
signal temp: std_logic;

begin
	clk_1hz <= temp;

	process(clk, reset) is
	begin
		if(reset = '1') then			-- Systeemreset
			count <= "00000000000000";
			state <= clear;
		elsif(clk'event and clk = '1') then	-- Opgaande klokflank v.d. systeemklok
			if(state = counting) then
				count <= count + 1;
			else
				count <= "00000000000000";
			end if;
			state <= new_state;
		end if;
	end process;

	process(count, state) is
	begin
		case state is
			when clear =>			-- Er wordt gereset
				temp <= '0';
				new_state <= counting;
			when counting =>		-- Er wordt getelt
				temp <= temp;
				if(count < 15998) then
					new_state <= counting;
				else
					new_state <= switch;
				end if;
			when switch =>			-- Genereerd een flank aan de uitgang
				temp <= not temp;
				new_state <= counting;
			when others =>			-- Dummy state, zou nooit mogen voorkomen
				temp <= '1';
				new_state <= clear;
		end case;
	end process;
end architecture behaviour;