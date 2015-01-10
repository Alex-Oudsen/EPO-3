-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- De parity check controleert of de bits die uit de
-- dcf decoder komen 'kloppen' volgens de parity bits,
-- welke eveneens uit de decoder komen. Indien een
-- parity bit 1 is, zou er in de bijbehorende bits
-- een even aantal enen moeten voorkomen

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of parity_check is

	type checks is (clear, check, output);
	signal state, new_state: checks;

	signal m_par, new_m_par: std_logic; -- parity minuten (correct = 0)
	signal h_par, new_h_par: std_logic; -- parity uren (correct = 0)
	signal d_par, new_d_par: std_logic; -- parity datum (correct = 0)

begin
	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then		-- Systeemreset
				m_par <= '1';
				h_par <= '1';
				d_par <= '1';
				state <= clear;
			else
				m_par <= new_m_par;
				h_par <= new_h_par;
				d_par <= new_d_par;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, start_xor, m_par, h_par, d_par, minuten, uren, weekdag, dagen, maanden,	jaren, parity_bits) is
	begin
		case state is
			when clear =>				-- Dit is de reset state
				new_m_par <= '1';
				new_h_par <= '1';
				new_d_par <= '1';

				sync_now <= '0';
				if(start_xor = '1') then
					new_state <= check;	-- Start een parity check
				else
					new_state <= clear;
				end if;
			when check =>				-- Voer de parity check uit
				new_m_par  <= 	minuten(6) xor minuten(5) xor minuten(4) xor
					 	minuten(3) xor minuten(2) xor minuten(1) xor
					 	minuten(0) xor parity_bits(0);
				new_h_par  <= 	uren(5) xor uren(4) xor uren(3) xor
					 	uren(2) xor uren(1) xor uren(0) xor
					 	parity_bits(1);
				new_d_par  <= 	weekdag(2) xor weekdag(1) xor weekdag(0) xor
						dagen(5) xor dagen(4) xor dagen(3) xor
					 	dagen(2) xor dagen(1) xor dagen(0) xor
					 	maanden(4) xor maanden(3) xor maanden(2) xor
					 	maanden(1) xor maanden(0) xor jaren(7) xor
					 	jaren(6) xor jaren(5) xor jaren(4) xor
					 	jaren(3) xor jaren(2) xor jaren(1) xor
					 	jaren(0) xor parity_bits(2);

				sync_now <= '0';
				new_state <= output;
			when output =>
				new_m_par <= m_par;
				new_h_par <= h_par;
				new_d_par <= d_par;

				if(m_par = '0' and h_par = '0' and d_par = '0') then
					sync_now <= '1';	-- Parity is correct
				else
					sync_now <= '0';	-- Parity is niet correct
				end if;
				new_state <= clear;
			when others =>				-- Zou nooit mogen voorkomen
				new_m_par <= m_par;
				new_h_par <= h_par;
				new_d_par <= d_par;

				sync_now <= '0';
				new_state <= clear;
		end case;
	end process;
end behaviour;