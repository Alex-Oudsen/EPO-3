library IEEE;
use IEEE.std_logic_1164.ALL;

entity dcf_switch is
   port(switch9:	in std_logic;
		  dcf:	   in std_logic;
		  dcf_out: out std_logic);
end dcf_switch;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of dcf_switch is

begin

	process(switch9, dcf) is
	begin
		if(switch9 = '1') then
			dcf_out <= dcf;
		else
			dcf_out <= '0';
		end if;
	end process;
end behaviour;
