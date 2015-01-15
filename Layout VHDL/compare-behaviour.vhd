library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of compare is

	type comp_state is (steady, start, final);
	signal state, new_state: comp_state;
	signal alarm_uur_l, alarm_min_l: std_logic_vector(3 downto 0);
	signal alarm_uur_h : std_logic_vector(1 downto 0);
	signal alarm_min_h : std_logic_vector (2 downto 0);

begin

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1' or stop_alarm = '1') then
				state <= steady;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	process(wekker_min_h, wekker_min_l, wekker_uur_l, wekker_uur_h)
	begin
		if((wekker_min_h = 1 and wekker_min_l > 4) or (wekker_min_h > 1)) then
			alarm_uur_l <= wekker_uur_l;
			alarm_uur_h <= wekker_uur_h;
		elsif(wekker_uur_l = 0 and wekker_uur_h = 0) then
			alarm_uur_l <= "0011";
			alarm_uur_h <= "10";
		elsif(wekker_uur_l = 0) then
			alarm_uur_l <= "1001";
			alarm_uur_h <= wekker_uur_h - 1;
		else
			alarm_uur_l <= wekker_uur_l - 1;
			alarm_uur_h <= wekker_uur_h;
		end if;

		if(wekker_min_l > 4 and wekker_min_h > 0) then
			alarm_min_l <= wekker_min_l - 5;
			alarm_min_h <= wekker_min_h - 1;
		elsif(wekker_min_l > 4 and wekker_min_h = 0) then
			alarm_min_l <= wekker_min_l - 5;
			alarm_min_h <= "101";
		elsif(wekker_min_l < 5 and wekker_min_h = 0) then
			alarm_min_l <= wekker_min_l + 5;
			alarm_min_h <= "100";
		elsif(wekker_min_l < 5 and wekker_min_h = 1) then
			alarm_min_l <= wekker_min_l + 5;
			alarm_min_h <= "101";
		else
			alarm_min_l <= wekker_min_l + 5;
			alarm_min_h <= wekker_min_h - 2;
		end if;
	end process;

	process (state, alarm_min_l, alarm_min_h, alarm_uur_l, alarm_uur_h, wekker_uur_l, wekker_uur_h, wekker_min_l, wekker_min_h, tijd_min_l, tijd_min_h, tijd_uur_l, tijd_uur_h)
	begin
		case state is
			when steady =>
				geluid <= '0';
				licht <= '0';
				if (alarm_min_l = tijd_min_l) and (alarm_min_h = tijd_min_h) and 
				   (alarm_uur_l = tijd_uur_l) and (alarm_uur_h = tijd_uur_h) then
					new_state <= start;
				else
					new_state <= steady;
				end if;
			when start =>
				geluid <= '0';
				licht <= '1';
				if (wekker_uur_l = tijd_uur_l) and (wekker_uur_h = tijd_uur_h) and
				   (wekker_min_l = tijd_min_l) and (wekker_min_h = tijd_min_h) then
					new_state <= final;
				else
					new_state <= start;
				end if;
			when final =>
				geluid <= '1';
				licht <= '1';
				new_state <= final;
			when others =>
				geluid <= '0';
				licht <= '1';
				new_state <= state;
		end case;
	end process;
end behaviour;
