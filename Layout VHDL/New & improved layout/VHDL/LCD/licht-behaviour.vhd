library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of licht is

	type licht_state is (steady, aan, uit);

	signal state, new_state: licht_state;
	signal licht_buf, new_licht_buf, ready_buf, new_ready_buf: std_logic;

begin

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= steady;
				licht_buf <= '0';
				ready_buf <= '0';
			else
				state <= new_state;
				licht_buf <= new_licht_buf;
				ready_buf <= new_ready_buf;
			end if;
		end if;
	end process;
	
	process (state, licht_signaal, licht_buf, menu, ready, ready_buf)
	begin
		case state is
			when steady =>
				new_licht_buf <= licht_signaal;
				new_ready_buf <=  ready;
				lcd_licht <= "00";

				if (menu = "011") then
					if (licht_signaal = '0' and licht_buf = '1') then -- licht uitzetten
						new_state <= uit;
					elsif (licht_signaal = '1' and licht_buf = '0') then -- licht aanzetten
						new_state <= aan;
					else
						new_state <= steady;
					end if;
				else
					new_state <= steady;
				end if;
			when aan =>
				new_licht_buf <= licht_signaal;
				new_ready_buf <= ready;
				lcd_licht <= "01"; -- c_aan

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_state <= steady;
				else
					new_state <= aan;
				end if;
			when uit =>
				new_licht_buf <= licht_signaal;
				new_ready_buf <= ready;
				lcd_licht <= "10"; -- c_uit

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_state <= steady;
				else
					new_state <= uit;
				end if;
			when others =>
				new_licht_buf <= '0';
				new_ready_buf <= '0';
				lcd_licht <= "00";
				new_state <= steady;
		end case;
	end process;
end behaviour;


