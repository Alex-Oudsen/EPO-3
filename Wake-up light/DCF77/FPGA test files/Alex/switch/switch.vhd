library IEEE;
use IEEE.std_logic_1164.ALL;

entity switch is
   port(day		:  in std_logic_vector(5 downto 0);
		  month	:  in std_logic_vector(4 downto 0);
		  year   :  in std_logic_vector(7 downto 0);
		  switch0:	in std_logic;
		  switch1:	in std_logic;
		  switch2:	in std_logic;
		  output : out std_logic_vector(7 downto 0));
end switch;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of switch is

begin

process(switch0, switch1, switch2, day, month, year) is

begin
   if(switch0 = '1' and switch1 = '0' and switch2 = '0') then
		output <= year;
	elsif(switch0 = '0' and switch1 = '1' and switch2 = '0') then
		output(7 downto 5) <= (others => '0');
		output(4 downto 0) <= month;
	elsif(switch0 = '0' and switch1 = '0' and switch2 = '1') then
		output(7 downto 6) <= (others => '0');
		output(5 downto 0) <= day;
	else
		output <= (others => '0');
	end if;
end process;
end behaviour;
