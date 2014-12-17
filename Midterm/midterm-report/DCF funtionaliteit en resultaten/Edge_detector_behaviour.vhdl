-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of edge_detector is

	type edged is (clear, find_edge, output);

	signal state, new_state: edged;
	signal temp, rise, fall: std_logic;
begin
	rising <= rise;
	falling <= fall;

	process(clk)
	begin
		if(reset = '1') then
			state <= clear;
		elsif(clk'event and clk = '1') then
			state <= new_state;
		end if;
	end process;

	process(state, input, temp, rise, fall) is

	variable r_wait, f_wait: std_logic;

	begin
		case state is
			when clear =>
				rise <= '0';
				fall <= '0';
				temp <= input;
				new_state <= find_edge;
			when find_edge =>
				rise <= (not temp) and input;
				fall <= (not input) and temp;
				new_state <= output;
			when output =>
				if(rise = '1' or fall = '1') then
					if(rise <= '1' and f_wait = '0') then
						r_wait := '0';
						f_wait := '1';
						new_state <= clear;
					elsif(fall <= '1' and r_wait = '0') then
						r_wait := '1';
						f_wait := '0';
						new_state <= clear;
					else
						r_wait := '0';
						f_wait := '0';
						new_state <= find_edge;
					end if;
				else
					r_wait := '0';
					f_wait := '0';
					new_state <= find_edge;
				end if;
			when others =>
				new_state <= clear;
		end case;
	end process;
end behaviour;