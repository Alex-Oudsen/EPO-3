library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of geluid is
type geluid_state is (steady, aan, uit, uit_ready, aan_ready);
signal state, new_state: geluid_state;

constant x_pos: std_logic_vector (6 downto 0) := "0000001";
constant y_pos: std_logic_vector (5 downto 0) := "010111";
constant c_aan: std_logic_vector (6 downto 0) := "0100000";
constant c_uit: std_logic_vector (6 downto 0) := "0100001";

begin

lbl1: process(clk)
	begin
		if (clk'event and clk='1') then
			if reset = '1' then
				state <= steady;
			else
				state <= new_state;
			end if;
		end if;
	end process;

lbl2: process (state, menu, geluid_signaal, ready)
begin
	case state is
		when steady =>
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
			if (geluid_signaal = '0') and (menu = "100") then
				new_state <= uit;
			elsif (geluid_signaal = '1') and (menu = "100") then
				new_state <= aan;
			else
				new_state <= steady;
			end if;
		when aan =>
			x <= x_pos;
			y <= y_pos;
			c <= c_aan;
			if (ready = '1') then
				new_state <= aan_ready;
			elsif (menu = "100") and (geluid_signaal = '0') then
				new_state <= uit;
			else
				new_state <= aan;
			end if;
		when aan_ready =>
			x <= x_pos;
			y <= y_pos;
			c <= c_aan;
			if (ready = '0') then
				new_state <= steady;
			elsif (menu = "100") and (geluid_signaal = '0') then
				new_state <= uit;
			else
				new_state <=  aan_ready;
			end if;
		when uit =>
			x <= x_pos;
			y <= y_pos;
			c <= c_uit;
			if (ready = '1') then
				new_state <= uit_ready;
			elsif (menu = "100") and (geluid_signaal = '1') then
				new_state <= aan;
			else
				new_state <= uit;
			end if;
		when uit_ready =>
			x <= x_pos;
			y <= y_pos;
			c <= c_uit;
			if (ready = '0') then
				new_state <= steady;
			elsif (menu = "100") and (geluid_signaal = '1') then
				new_state <= aan;
			else
				new_state <= uit_ready;
			end if;
	end case;
end process;
end behaviour;







