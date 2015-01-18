library IEEE;
use IEEE.std_logic_1164.ALL;

entity new_switch is
   port(date:		in std_logic_vector(21 downto 0);
		  switch0:	in std_logic;
		  switch1:	in std_logic;
		  switch2:	in std_logic;
		  switch3:  in std_logic;
		  output : out std_logic_vector(7 downto 0));
end new_switch;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of new_switch is

begin

process(switch0, switch1, switch2, switch3, date) is

begin
   if(switch0 = '1' and switch1 = '0' and switch2 = '0' and switch3 = '0') then
		output <= date(21 downto 14);
	elsif(switch0 = '0' and switch1 = '1' and switch2 = '0' and switch3 = '0') then
		output(7 downto 5) <= (others => '0');
		output(4 downto 0) <= date(13 downto 9);
	elsif(switch0 = '0' and switch1 = '0' and switch2 = '1' and switch3 = '0') then
		output(7 downto 6) <= (others => '0');
		output(5 downto 0) <= date(8 downto 3);
	elsif(switch0 = '0' and switch1 = '0' and switch2 = '0' and switch3 = '1') then
		output(7 downto 3) <= (others => '0');
		output(2 downto 0) <= date(2 downto 0);
	else
		output <= (others => '0');
	end if;
end process;
end behaviour;
