-- Alex Oudsen, 4325494
-- Deze mod24 teller telt elk uur één bij de huidige waarde op
-- en wordt gesynchroniseerd met het aantal uren dat wordt
-- aangegeven door het DCF signaal als sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod24_teller is

type m24_state is (clear, counting, switch);

signal state, new_state: m24_state;
signal h_count: std_logic_vector(4 downto 0);

begin
	count <= h_count;

	process(clk, clk_in, sync_now, reset, h_count) is
	begin
		if(reset = '1') then				-- Systeemreset
			h_count <= "00000";
			state <= clear;
		elsif(clk_in'event and clk_in = '1') then
			state <= new_state;

			if(h_count = 23) then
				h_count <= "00000";		-- Tellen gebeurt op de sturende klok
			else
				h_count <= h_count + 1;
			end if;
		elsif(clk'event and clk = '1') then		-- Opgaande klokflank v.d. systeemklok
			if(sync_now = '1') then
				h_count <= ref;
				if(ref = 23) then
					state <= switch;
				else
					state <= counting;
				end if;
			else
				h_count <= h_count;
			end if;
		end if;
	end process;

	process(h_count, state) is
	begin
		case state is
			when clear =>				-- Er wordt gereset
				new_state <= counting;
			when counting =>			-- Er wordt getelt
				if(h_count = 22) then
					new_state <= switch;
				else
					new_state <= counting;
				end if;
			when switch =>				-- Er wordt teruggeschakeld naar 0
				new_state <= counting;
			when others =>				-- Dummy state, zou nooit mogen voorkomen
				new_state <= clear;
		end case;
	end process;
end behaviour;