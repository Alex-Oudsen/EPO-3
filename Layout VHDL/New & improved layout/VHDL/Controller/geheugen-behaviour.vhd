library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of geheugen is

	signal wek_opslag: std_logic_vector(15 downto 0);

begin
	wek_out <= wek_opslag;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				wek_opslag <= (others => '0');
			else
				if (enable = '1') then
					wek_opslag <= wek_in;
				else
					wek_opslag <= wek_opslag;
				end if;
			end if;
		end if;
	end process;
end behaviour;


