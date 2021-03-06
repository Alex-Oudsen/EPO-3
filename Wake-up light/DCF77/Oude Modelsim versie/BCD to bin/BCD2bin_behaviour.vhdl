-- Alex Oudsen, 4325494
-- De BCD2bin module maakt van een 8-bits BCD gecodeerd
-- signaal een 7-bits binair gecodeerd signaal
-- Minimale afstand tussen het begin van twee
-- start-pulsen is tweemaal de periode van de systeemklok

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behaviour of bcd2bin is

type c_state is (waits, convert, release, pause);

signal state, new_state: c_state;
signal suma, sumb, sumc, sumd, sume, sum: std_logic_vector(6 downto 0);

begin
	bin_out <= sum;

	process(clk, reset) is
	begin
		if(reset = '1') then			-- Systeemreset
			state <= waits;
		elsif(clk'event and clk = '1') then	-- Opgaande klokflank v.d. systeemklok
			state <= new_state;
		end if;
	end process;

	process(start, state) is
	begin
		case state is
			when waits =>
				sum <= "0000000";
				suma <= "0000000";
				sumb <= "0000000";
				sumc <= "0000000";
				sumd <= "0000000";
				sume <= "0000000";
				ready <= '0';
				if(start = '1') then
					new_state <= convert;
				else
					new_state <= waits;
				end if;
			when convert =>
				sum <= sum;
				ready <= '0';
				suma <= std_logic_vector(resize(unsigned(bcd_in(3 downto 0)), 7));
				if (bcd_in(4) = '1') then
					sumb <= "0001010"; -- 10
				else
					sumb <= "0000000";
				end if;
				if (bcd_in(5) = '1') then
					sumc <= "0010100"; -- 20
				else
					sumc <= "0000000";
				end if;
				if (bcd_in(6) = '1') then
					sumd <= "0101000"; -- 40
				else
					sumd <= "0000000";
				end if;
				if (bcd_in(7) = '1') then
					sume <= "1010000"; -- 80
				else
					sume <= "0000000";
				end if;
				new_state <= release;
			when release =>
				sum <= suma + sumb + sumc + sumd + sume;
				suma <= suma;
				sumb <= sumb;
				sumc <= sumc;
				sumd <= sumd;
				sume <= sume;
				ready <= '1';
				new_state <= pause;
			when pause =>
				sum <= sum;
				suma <= suma;
				sumb <= sumb;
				sumc <= sumc;
				sumd <= sumd;
				sume <= sume;
				ready <= '0';
				if(start = '1') then
					new_state <= convert;
				else
					new_state <= pause;
				end if;
			when others =>
				sum <= "0000000";
				suma <= "0000000";
				sumb <= "0000000";
				sumc <= "0000000";
				sumd <= "0000000";
				sume <= "0000000";
				ready <= '0';
				new_state <= waits;
		end case;
	end process;
end behaviour;