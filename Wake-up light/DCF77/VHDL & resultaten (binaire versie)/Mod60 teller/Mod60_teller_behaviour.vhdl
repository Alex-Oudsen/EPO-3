-- Alex Oudsen, 4325494
-- Deze mod60 teller wordt tweemaal gebruikt in de klok, eenmaal
-- voor het tellen van seconden en eenmaal voor het tellen van minuten
-- De teller telt elke rising edge van clk_in één
-- bij de huidige waarde van count op
-- De waarde van count wordt echter gelijk gemaakt aan
-- ref wanneer het signaal sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod60_teller is

	type m60_state is (clear, wait_high, wait_low, synchronising);
	signal state, new_state: m60_state;

	signal t_count, new_t_count: std_logic_vector(5 downto 0);
	signal t_temp, new_t_temp: std_logic;

begin
	count <= t_count;
	t_clk <= t_temp;

	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then		-- Systeemreset
				t_count <= (others => '0');
				t_temp <= '0';
				state <= clear;
			elsif(sync_now = '1') then
				t_count <= ref;
				t_temp <= new_t_temp;
				state <= synchronising;
			else
				t_count <= new_t_count;
				t_temp <= new_t_temp;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, clk_in, ref, t_count, t_temp) is
	begin
		case state is
			when clear =>			-- Reset state
				new_t_count <= (others => '0');
				new_t_temp <= '0';
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when wait_high =>		-- Er wordt geteld op de sturende klok
				if(clk_in = '1') then
					if(t_count = 59) then
						new_t_count <= (others => '0');
					else
						new_t_count <= t_count + 1;
					end if;
					if(t_count = 29) then
						new_t_temp <= '0';
					elsif(t_count = 59) then
						new_t_temp <=  '1';
					else
						new_t_temp <= t_temp;
					end if;
					new_state <= wait_low;
				else
					new_t_count <= t_count;
					new_t_temp <= t_temp;
					new_state <= wait_high;
				end if;
			when wait_low =>
				if(clk_in = '0') then
					new_t_count <= t_count;
					new_t_temp <= t_temp;
					new_state <= wait_high;
				else
					new_t_count <= t_count;
					new_t_temp <= t_temp;
					new_state <= wait_low;
				end if;
			when synchronising =>
				new_t_count <= ref;
				new_t_temp <= t_temp;
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when others =>			-- Zou nooit mogen voorkomen
				new_t_count <= (others => '0');
				new_t_temp <= '0';
				new_state <= clear;
		end case;
	end process;
end behaviour;