library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geheugen is
signal wek_opslag,wek_temp : std_logic_vector(15 downto 0 );
begin
assign : process(clk,reset,wek_temp,wek_in)
begin
	if rising_edge(clk) then
		if reset = '1' then
			wek_temp<= (others => '0');
		else
			if enable = '1' then
				wek_temp <= wek_in;
			else
				wek_temp <= wek_temp;
			end if;
		end if;
	end if;
	wek_out<=wek_temp;
end process assign;
end behaviour;











