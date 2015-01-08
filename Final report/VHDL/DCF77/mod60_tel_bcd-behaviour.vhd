-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- Deze mod60 teller telt elke rising edge van clk_in 1
-- bij de huidige waarde van count op in bcd codering
-- De waarde van count wordt echter gelijk gemaakt aan ref,
-- wanneer het signaal sync_now hoog wordt

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of mod60_tel_bcd is

	type m60_state is (clear, wait_high, wait_low, synchronising);
	signal state, new_state: m60_state;

	signal m_count, new_m_count: std_logic_vector(6 downto 0);
	signal h_temp, new_h_temp: std_logic;

begin
	count <= m_count;
	h_clk <= h_temp;

	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then				-- Systeemreset
				m_count <= (others => '0');
				h_temp <= '0';
				state <= clear;
			elsif(sync_now = '1') then
				m_count <= ref;
				h_temp <= new_h_temp;
				state <= synchronising;
			else
				m_count <= new_m_count;
				h_temp <= new_h_temp;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, clk_in, ref, m_count, h_temp) is
	begin
		case state is
			when clear =>				-- Reset state
				new_m_count <= (others => '0');
				new_h_temp <= '0';
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when wait_high =>				-- Er wordt geteld op de sturende klok
				if(clk_in = '1') then
					if(m_count = "1011001") then
						new_m_count <= (others => '0');
					elsif(m_count(3 downto 0) = "1001") then
						new_m_count <= m_count + 7;
					else
						new_m_count <= m_count + 1;
					end if;
					if(m_count = "0101001") then
						new_h_temp <= '0';
					elsif(m_count = "1011001") then
						new_h_temp <= '1';
					else
						new_h_temp <= h_temp;
					end if;
					new_state <= wait_low;
				else
					new_m_count <= m_count;
					new_h_temp <= h_temp;
					new_state <= wait_high;
				end if;
			when wait_low =>
				if(clk_in = '0') then
					new_m_count <= m_count;
					new_h_temp <= h_temp;
					new_state <= wait_high;
				else
					new_m_count <= m_count;
					new_h_temp <= h_temp;
					new_state <= wait_low;
				end if;
			when synchronising =>
				new_m_count <= ref;
				new_h_temp <= h_temp;
				if(clk_in = '1') then
					new_state <= wait_low;
				else
					new_state <= wait_high;
				end if;
			when others =>				-- Zou nooit mogen voorkomen
				new_m_count <= (others => '0');
				new_h_temp <= '0';
				new_state <= clear;
		end case;
	end process;
end behaviour;




