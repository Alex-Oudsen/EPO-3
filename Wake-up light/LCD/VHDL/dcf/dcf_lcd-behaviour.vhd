library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of dcf_lcd is
type dcf_state is (steady, aan, aan_ready, uit, uit_ready);
signal state, new_state: dcf_state;
signal buf: std_logic;

constant x_pos: std_logic_vector (6 downto 0) := "0000001";
constant y_pos: std_logic_vector (5 downto 0) := "000001";
constant c_aan: std_logic_vector (6 downto 0) := "0100100";
constant c_uit: std_logic_vector (6 downto 0) := "0100101";

begin

lbl1: process(clk)
	begin
		if (clk'event and clk='1') then
			if reset = '1' then
				state <= steady;
				buf <= dcf_debug;
			else
				state <= new_state;
				buf <= dcf_debug;
			end if;
		end if;
	end process;

lbl2: process (state, dcf_debug, ready)
	begin
		case state is
			when steady =>
				x <= "0000000";
				y <= "000000";
				c <= "0000000";
				if (dcf_debug = '0') and (buf = '1') then
					new_state <= uit;
				elsif (dcf_debug = '1') and (buf ='0') then
					new_state <= aan;
				else
					new_state <= state;
				end if;
			when aan =>
				x <= x_pos;
				y <= y_pos;
				c <= c_aan;
				if (ready = '1') then
					new_state <= aan_ready;
				elsif (dcf_debug ='0') then
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
				elsif (dcf_debug = '0') then
					new_state <= uit;
				else
					new_state <= aan_ready;
				end if;
			when uit =>
				x <= x_pos;
				y <= y_pos;
				c <= c_uit;
				if (ready = '1') then
					new_state <= uit_ready;
				elsif (dcf_debug ='1') then
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
				elsif (dcf_debug = '1') then
					new_state <= aan;
				else
					new_state <= uit_ready;
				end if;
		end case;
	end process;
end behaviour;


