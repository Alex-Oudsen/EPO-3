-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of datefix is

	signal date, new_date: std_logic_vector(21 downto 0);

begin
	datum <= date;

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				date <= (others => '0');
			else
				date <= new_date;
			end if;
		end if;
	end process;

	process(date, date_ready, jaar, maand, dag, weekdag)
	begin
		if(date_ready = '1') then
			new_date(21 downto 14) <= jaar;
			new_date(13 downto 9) <= maand;
			new_date(8 downto 3) <= dag;
			new_date(2 downto 0) <= weekdag;
		else
			new_date <= date;
		end if;
	end process;
end behaviour;
