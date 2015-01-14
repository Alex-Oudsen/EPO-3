library IEEE;
use IEEE.std_logic_1164.ALL;

entity buff is
   port(clk		:	in std_logic;
		  reset	:	in std_logic;
		  switch8:	in std_logic;
		  date_r	:  in std_logic;
		  ready  : out std_logic);
end buff;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of buff is

	signal red, new_red: std_logic;

begin

ready <= red;

	process(clk, reset) is
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				red <= '0';
			else
				red <= new_red;
			end if;
		end if;
	end process;

	process(date_r, red, switch8) is
	begin
		if(date_r = '1') then
			new_red <= '1';
		elsif(switch8 = '1') then
			new_red <= '0';
		else
			new_red <= red;
		end if;
	end process;
end behaviour;
