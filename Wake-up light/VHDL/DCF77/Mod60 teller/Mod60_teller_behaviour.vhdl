-- Alex Oudsen, 4325494
-- Deze mod60 teller wordt tweemaal gebruikt in de klok,
-- eenmaal voor minuten en eenmaal voor seconden,
-- en wordt gesynchroniseerd met het DCF signaal
-- wanneer het signaal sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod60_teller is

type m60_state is (clear, counting, switch);

signal state, new_state: m60_state;
signal t_count: std_logic_vector(5 downto 0);
signal t_temp: std_logic;

begin
	count <= t_count;
	t_clk <= t_temp;

	process(clk, clk_in, sync_now, reset, state) is
	begin
		if(reset = '1') then				-- Systeemreset
			t_count <= "000000";
			state <= clear;
		elsif(clk_in'event and clk_in = '1') then
			state <= new_state;
			if(state = counting) then
				t_count <= t_count + 1;		-- Tellen gebeurt op de sturende klok
			else
				t_count <= "000000";
			end if;
		elsif(clk'event and clk = '1') then		-- Opgaande klokflank v.d. systeemklok
			if(sync_now = '1') then
				t_count <= ref;
			else
				t_count <= t_count;
			end if;
		elsif(reset = '0' and state = clear) then
			t_count<= "000000";
			state <= counting;
		end if;
	end process;

	process(reset, t_count, state) is
	begin
		case state is
			when clear =>				-- Er wordt gereset
				t_temp <= '1';
				new_state <= counting;
			when counting =>			-- Er wordt getelt
				if(t_count = 0 or t_count = 30) then
					t_temp <= not t_temp;
				end if;
				if(t_count < 58) then
					new_state <= counting;
				else
					new_state <= switch;
				end if;
			when switch =>
				t_temp <= t_temp;
				new_state <= counting;
			when others =>				-- Dummy state, zou nooit mogen voorkomen
				t_temp <= '0';
				new_state <= clear;
		end case;
	end process;
end architecture behaviour;