-- Joran Out, 4331958 & Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of parity_check is

	type checks is (clear, check, output);

	signal state, new_state: checks;
	signal h_par, m_par, d_par: std_logic;

begin
	process(clk, reset) is
	begin
		if(reset = '1') then
			state <= clear;
		elsif(clk'event and clk = '1') then
			state <= new_state;
		end if;
	end process;

	process(state, start_xor) is
	begin
		case state is
			when clear =>
				m_par <= '0';
				h_par <= '0';
				d_par <= '0';
				sync_now <= '0';

				if(start_xor = '1') then
					new_state <= check;
				else
					new_state <= clear;
				end if;
			when check =>
				m_par <= minuten(6) xor minuten(5) xor minuten(4) xor
					 minuten(3) xor minuten(2) xor minuten(1) xor
					 minuten(0) xor parity_bits(0);
				h_par <= uren(5) xor uren(4) xor uren(3) xor
					 uren(2) xor uren(1) xor uren(0) xor
					 parity_bits(1);
				d_par <= weekdag(2) xor weekdag(1) xor weekdag(0) xor
					 dagen(5) xor dagen(4) xor dagen(3) xor
					 dagen(2) xor dagen(1) xor dagen(0) xor
					 maanden(4) xor maanden(3) xor maanden(2) xor
					 maanden(1) xor maanden(0) xor jaren(7) xor
					 jaren(6) xor jaren(5) xor jaren(4) xor
					 jaren(3) xor jaren(2) xor jaren(1) xor
					 jaren(0) xor parity_bits(2);
				new_state <= output;
			when output =>
				if(m_par = '1' and h_par = '1' and d_par = '1') then
					sync_now <= '1';
				else
					sync_now <= '0';
				end if;
			
				new_state <= clear;
			when others =>
				sync_now <= '0';
				new_state <= clear;
		end case;
	end process;

end behaviour;