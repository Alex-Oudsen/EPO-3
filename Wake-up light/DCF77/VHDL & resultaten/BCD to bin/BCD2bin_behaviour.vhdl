-- Alex Oudsen, 4325494
-- De BCD2bin module maakt van een 8-bits BCD gecodeerd
-- signaal een 7-bits binair gecodeerd signaal

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behaviour of bcd2bin is

	type c_state is (waits, convert, release, pause);
	signal state, new_state: c_state;

	signal new_ready: std_logic;
	signal inputbuffer: std_logic_vector(7 downto 0);
	signal sum, new_sum: std_logic_vector(6 downto 0);
	signal suma, new_suma: std_logic_vector(6 downto 0);
	signal sumb, new_sumb: std_logic_vector(6 downto 0);
	signal sumc, new_sumc: std_logic_vector(6 downto 0);
	signal sumd, new_sumd: std_logic_vector(6 downto 0);
	signal sume, new_sume: std_logic_vector(6 downto 0);

begin
	bin_out <= sum;

	process(clk) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then				-- Systeemreset
				sum <= "0000000";
				suma <= "0000000";
				sumb <= "0000000";
				sumc <= "0000000";
				sumd <= "0000000";
				sume <= "0000000";

				inputbuffer <= "00000000";
				ready <= '0';
				state <= waits;
			else
				sum <= new_sum;
				suma <= new_suma;
				sumb <= new_sumb;
				sumc <= new_sumc;
				sumd <= new_sumd;
				sume <= new_sume;

				inputbuffer <= bcd_in;
				ready <= new_ready;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, start, inputbuffer) is
	begin
		case state is					-- Reset state
			when waits =>
				new_sum <= "0000000";
				new_suma <= "0000000";
				new_sumb <= "0000000";
				new_sumc <= "0000000";
				new_sumd <= "0000000";
				new_sume <= "0000000";

				new_ready <= '0';
				if(start = '1') then
					new_state <= convert;
				else
					new_state <= waits;
				end if;
			when convert =>				-- Deelsommen opstellen
				new_sum <= sum;
				new_suma <= std_logic_vector(resize(unsigned(inputbuffer(3 downto 0)), 7));
				if (inputbuffer(4) = '1') then
					new_sumb <= "0001010"; -- 10
				else
					new_sumb <= "0000000";
				end if;
				if (inputbuffer(5) = '1') then
					new_sumc <= "0010100"; -- 20
				else
					new_sumc <= "0000000";
				end if;
				if (inputbuffer(6) = '1') then
					new_sumd <= "0101000"; -- 40
				else
					new_sumd <= "0000000";
				end if;
				if (inputbuffer(7) = '1') then
					new_sume <= "1010000"; -- 80
				else
					new_sume <= "0000000";
				end if;

				new_ready <= '0';
				new_state <= release;
			when release =>				-- Totale som en daarmee de binaire uitgang bepalen
				new_sum <= suma + sumb + sumc + sumd + sume;
				new_suma <= suma;
				new_sumb <= sumb;
				new_sumc <= sumc;
				new_sumd <= sumd;
				new_sume <= sume;

				new_ready <= '1';
				new_state <= pause;
			when pause =>				-- Uitgang vasthouden tot de volgende opdracht
				new_sum <= sum;
				new_suma <= suma;
				new_sumb <= sumb;
				new_sumc <= sumc;
				new_sumd <= sumd;
				new_sume <= sume;

				new_ready <= '0';
				if(start = '1') then
					new_state <= convert;
				else
					new_state <= pause;
				end if;
			when others =>
				new_sum <= "0000000";
				new_suma <= suma;
				new_sumb <= sumb;
				new_sumc <= sumc;
				new_sumd <= sumd;
				new_sume <= sume;

				new_ready <= '0';
				new_state <= waits;
		end case;
	end process;
end behaviour;
