-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- Deze mod24 teller telt elke rising edge van clk_in één
-- bij de huidige waarde van count op in bcd codering
-- De waarde van count wordt echter gelijk gemaakt aan ref,
-- wanneer het signaal sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod24_tel_bcd is

	type m24_state is (clear, wait_high, wait_low, synchronising);
	signal state, new_state: m24_state;

	signal h_count, new_h_count: std_logic_vector(5 downto 0);

begin
	count <= h_count;

	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then		-- Systeemreset
				h_count <= (others => '0');
				state <= clear;
			elsif(sync_now = '1') then
				h_count <= ref;
				state <= synchronising;
			else
				h_count <= new_h_count;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, clk_in, ref, h_count) is
	begin
		case state is
			when clear =>			-- Reset state
				new_h_count <= (others => '0');
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when wait_high =>		-- Er wordt geteld op de sturende klok
				if(clk_in = '1') then
					if(h_count = "100011") then
						new_h_count <= (others => '0');
					elsif(h_count(3 downto 0) = "1001") then
						new_h_count <= h_count + 7;
					else
						new_h_count <= h_count + 1;
					end if;
					new_state <= wait_low;
				else
					new_h_count <= h_count;
					new_state <= wait_high;
				end if;
			when wait_low =>
				if(clk_in = '0') then
					new_h_count <= h_count;
					new_state <= wait_high;
				else
					new_h_count <= h_count;
					new_state <= wait_low;
				end if;
			when synchronising =>
				new_h_count <= ref;
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when others =>			-- Zou nooit mogen voorkomen
				new_h_count <= (others => '0');
				new_state <= clear;
		end case;
	end process;
end behaviour;

