library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of geluid is

	type geluid_state is (steady, aan, uit);
	
	signal state, new_state: geluid_state;
	signal geluid_buf, new_geluid_buf, ready_buf, new_ready_buf: std_logic;

begin

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= steady;
				geluid_buf <= '0';
				ready_buf <= '0';
			else
				state <= new_state;
				geluid_buf <= new_geluid_buf;
				ready_buf <= new_ready_buf;
			end if;
		end if;
	end process;

	process (state, geluid_signaal, geluid_buf, menu, ready, ready_buf)
	begin
		case state is
			when steady =>
				new_geluid_buf <= geluid_signaal;
				new_ready_buf <= ready;
				lcd_geluid <= "00";

				if (menu = "100") then
					if (geluid_signaal = '0' and geluid_buf = '1') then -- geluid uitzetten
						new_state <= uit;
					elsif (geluid_signaal = '1' and geluid_buf = '0') then -- geluid aanzetten
						new_state <= aan;
					else
						new_state <= steady;
					end if;
				else
					new_state <= steady;
				end if;
			when aan =>
				new_geluid_buf <= geluid_signaal;
				new_ready_buf <= ready;
				lcd_geluid <= "01"; -- c_aan

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_state <= steady;
				else
					new_state <= aan;
				end if;
			when uit =>
				new_geluid_buf <= geluid_signaal;
				new_ready_buf <= ready;
				lcd_geluid <= "10"; -- c_uit

				if (ready = '0' and ready_buf = '1') then -- falling edge
					new_state <= steady;
				else
					new_state <= uit;
				end if;
			when others =>
				new_geluid_buf <= '0';
				new_ready_buf <= '0';
				lcd_geluid <= "00";
				new_state <= steady;
		end case;
	end process;
end behaviour;


