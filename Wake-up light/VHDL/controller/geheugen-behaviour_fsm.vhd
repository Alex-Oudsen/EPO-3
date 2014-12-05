library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geheugen is
type geheugen_state is (read,write,state_reset);
signal state,new_state : geheugen_state;
signal wek_temp : std_logic_vector(13 downto 0 );
begin
assign : process(clk,reset,new_state)
begin
	if rising_edge(clk) then
		if reset = '1' then
			state <= state_reset;
		else
			state <= new_state;
		end if;
	end if;
end process assign;

actie : process(clk,reset,new_state,enable,wek_in)
begin
	case state is
		when state_reset =>
			wek_temp <= (others => '0');
			wek_out <= wek_temp;
		when read =>
			wek_out <= wek_temp;
		when write =>
			wek_temp <= wek_in;
			wek_out <= wek_temp;
	end case;
end process actie;
next_state : process(clk,reset,enable,wek_in)
begin
	if enable = '1' then
		new_state <= write;
	else 
		new_state <= read;
	end if;
end process next_state;

--geheugen_element : process (clk, reset, enable, wek_in)
--begin 
	--if rising_edge(clk) then
		--if (reset = '1') then
			--wek_out <= "00000000000000";
--		else
--			if (enable = '1') then
--				wek_out <= wek_in;
		--	else
		--		wek_out <= wek_out;
		--	end if;
	--	end if;
--	end if;
--end process geheugen_element;
end behaviour;





