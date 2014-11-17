library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

architecture behaviour of alu is

signal d    : std_logic;
signal z    : std_logic_vector (3 downto 0);

begin

lbl1: process (clk) is
begin

	if (clk'event and clk = '1') then
		r <= z;
		c <= d;
	end if;

end process;

lbl2: process (a, b, f) is

variable m  : std_logic_vector (3 downto 0);

begin

		case f is
			
			when "000" => 
				d <= '0';
				z <= not a;
			
			when "001" => 
				d <= '0';
				z <= a or b;

			when "010" => 
				d <= '0';
				z <= a and b;

			when "011" => 
				d <= '0';
				z <= a xor b;

			when "100" => 
				m := a + b;
				if ((a(3) = b(3)) and (a(3) = m(3))) or (a(3) = not b(3)) then
					d <= '0';
				else
					d <= a(3);
				end if;
				z <= m;

			when "101" => 
				m := a - b;
				if ((a(3) = not b(3)) and (a(3) = m(3))) or (a(3) = b(3)) then
					d <= '0';
				else
					d <= a(3);
				end if;
				z <= m;
			
			when "110" =>
				d    <= a(3);
				z(3) <= a(2);
				z(2) <= a(1);
				z(1) <= a(0);
				z(0) <= '0';

			when "111" =>
				d    <= '0';
				z(3) <= '0';
				z(2) <= a(3);
				z(1) <= a(2);
				z(0) <= a(1);

		end case;

end process;

end architecture behavioural;
