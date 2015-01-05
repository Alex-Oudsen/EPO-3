-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- Deze mod60 teller telt elke rising edge van clk_in één
-- bij de huidige waarde van count op in bcd codering
-- De waarde van count wordt echter gelijk gemaakt aan ref,
-- wanneer het signaal sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod60_clk_bcd is

	type m60_state is (clear, wait_high, wait_low, synchronising);
	signal state, new_state: m60_state;

	signal s_count, new_s_count: std_logic_vector(6 downto 0);
	signal m_temp, new_m_temp: std_logic;

begin
	m_clk <= m_temp;

	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then		-- Systeemreset
				s_count <= (others => '0');
				m_temp <= '0';
				state <= clear;
			elsif(sync_now = '1') then
				s_count <= ref;
				m_temp <= new_m_temp;
				state <= synchronising;
			else
				s_count <= new_s_count;
				m_temp <= new_m_temp;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, clk_in, ref, s_count, m_temp) is
	begin
		case state is
			when clear =>			-- Reset state
				new_s_count <= (others => '0');
				new_m_temp <= '0';
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when wait_high =>		-- Er wordt geteld op de sturende klok
				if(clk_in = '1') then
					if(s_count = "1011001") then
						new_s_count <= (others => '0');
					elsif(s_count(3 downto 0) = "1001") then
						new_s_count <= s_count + 7;
					else
						new_s_count <= s_count + 1;
					end if;
					if(s_count = "0101001") then
						new_m_temp <= '0';
					elsif(s_count = "1011001") then
						new_m_temp <= '1';
					else
						new_m_temp <= m_temp;
					end if;
					new_state <= wait_low;
				else
					new_s_count <= s_count;
					new_m_temp <= m_temp;
					new_state <= wait_high;
				end if;
			when wait_low =>
				if(clk_in = '0') then
					new_s_count <= s_count;
					new_m_temp <= m_temp;
					new_state <= wait_high;
				else
					new_s_count <= s_count;
					new_m_temp <= m_temp;
					new_state <= wait_low;
				end if;
			when synchronising =>
				new_s_count <= ref;
				new_m_temp <= m_temp;
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when others =>			-- Zou nooit mogen voorkomen
				new_s_count <= (others => '0');
				new_m_temp <= '0';
				new_state <= clear;
		end case;
	end process;
end behaviour;
