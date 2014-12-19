-- Alex Oudsen, 4325494
-- De edge detector genereert uit het dcf77 signaal
-- aparte pulsen voor de rising en falling edges

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of edge_detector is

	type edged is (clear, find_edge, output);
	signal state, new_state: edged;

	signal temp, new_temp: std_logic;
	signal rise, new_rise: std_logic;
	signal fall, new_fall: std_logic;

	signal r_wait, new_r_wait: std_logic;
	signal f_wait, new_f_wait: std_logic;
begin
	rising <= rise;	-- rising en falling zijn de daadwerkelijke uitgangen
	falling <= fall;

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then	-- Systeemreset
				rise <= '0';
				fall <= '0';
				temp <= '0';

				r_wait <= '0';
				f_wait <= '0';

				state <= clear;
			else
				rise <= new_rise;
				fall <= new_fall;
				temp <= new_temp;

				r_wait <= new_r_wait;
				f_wait <= new_f_wait;

				state <= new_state;
			end if;
		end if;
	end process;

	process(state, input, temp, rise, fall) is

	begin
		case state is
			when clear =>		-- Reset state
				new_rise <= '0';
				new_fall <= '0';
				new_temp <= input;

				new_r_wait <= '0';
				new_f_wait <= '0';

				new_state <= find_edge;
			when find_edge =>	-- Maakt gebruik van vertragingstijd van de not
				new_rise <= (not temp) and input;
				new_fall <= (not input) and temp;
				new_temp <= temp;

				new_r_wait <= '0';
				new_f_wait <= '0';

				new_state <= output;
			when output =>		-- Hier wordt gezorgd voor een bruikbare uitgangspuls
				new_rise <= rise;
				new_fall <= fall;
				new_temp <= temp;

				if(rise = '1' or fall = '1') then
					if(rise <= '1' and f_wait = '0') then
						new_r_wait <= '0';
						new_f_wait <= '1';
						new_state <= clear;
					elsif(fall <= '1' and r_wait = '0') then
						new_r_wait <= '1';
						new_f_wait <= '0';
						new_state <= clear;
					else
						new_r_wait <= '0';
						new_f_wait <= '0';
						new_state <= find_edge;
					end if;
				else
					new_r_wait <= '0';
					new_f_wait <= '0';
					new_state <= find_edge;
				end if;
			when others =>		-- Zou nooit mogen voorkomen
				new_rise <= '0';
				new_fall <= '0';
				new_temp <= '0';

				new_r_wait <= '0';
				new_f_wait <= '0';

				new_state <= clear;
		end case;
	end process;
end behaviour;
