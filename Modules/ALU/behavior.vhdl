library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behavioural of alu is

signal d    : std_logic;
signal z    : std_logic_vector (3 downto 0);

begin

process (clk, z) is
begin

	if (clk'event and clk = '1') then
		r <= z;
		c <= d;
	end if;

end process;

process (a, b, f) is

variable m  : std_logic_vector (3 downto 0);

begin

		case f is
			
			when "0000" => 
				d <= '0';
				z <= not a;
			
			when "0001" => 
				d <= '0';
				z <= not b;

			when "0010" => 
				d <= '0';
				z <= a or b;

			when "0011" => 
				d <= '0';
				z <= a and b;

			when "0100" => 
				d <= '0';
				z <= a xor b;

			when "0101" => 
				m := a + b;
				if ((a(3) = b(3)) and (a(3) = m(3))) or (a(3) = not b(3)) then
					d <= '0';
				else
					d <= a(3);
				end if;
				z <= m;

			when "0110" => 
				m := a - b;
				if ((a(3) = not b(3)) and (a(3) = m(3))) or (a(3) = b(3)) then
					d <= '0';
				else
					d <= a(3);
				end if;
				z <= m;

			when "0111" => 
				m := b - a;
				if ((a(3) = not b(3)) and (b(3) = m(3))) or (a(3) = b(3)) then
					d <= '0';
				else
					d <= a(3);
				end if;
				z <= m;
			
			when "1000" =>
				d    <= a(3);
				z(3) <= a(2);
				z(2) <= a(1);
				z(1) <= a(0);
				z(0) <= '0';

			when "1001" =>
				d    <= '0';
				z(3) <= '0';
				z(2) <= a(3);
				z(1) <= a(2);
				z(0) <= a(1);

			when "1010" =>
				d    <= b(3);
				z(3) <= b(2);
				z(2) <= b(1);
				z(1) <= b(0);
				z(0) <= '0';

			when "1011" =>
				d    <= '0';
				z(3) <= '0';
				z(2) <= b(3);
				z(1) <= b(2);
				z(0) <= b(1);

			when others =>
				d    <= d;
				z    <= z;

		end case;

end process;

end architecture behavioural;
