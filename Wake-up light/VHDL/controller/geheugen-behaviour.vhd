library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geheugen is
begin
geheugen_element : process (clk, reset, enable, wek_in)
begin 
	if rising_edge(clk) then
		if (reset = '1') then
			wek_out <= "00000000000000";
		else
			if (enable = '1') then
				wek_out <= wek_in;
		--	else
		--		wek_out <= wek_out;
			end if;
		end if;
	end if;
end process geheugen_element;
end behaviour;


