library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of menu_scherm is

type menu_state is (steady, schrijven, ready_state);
signal state, new_state: menu_state;
signal buf, new_buf: std_logic_vector (2 downto 0);
signal alarm, alarm_buf: std_logic;

constant x_pos_menu: std_logic_vector (6 downto 0) := "0011001";	-- x-positie voor menu
constant y_pos_menu: std_logic_vector (5 downto 0) := "110101";		-- y-positie voor menu
constant c_0: std_logic_vector (6 downto 0) := "0101010";	-- leeg, alarm aan
constant c_1: std_logic_vector (6 downto 0) := "0100110"; -- uren aanpassen
constant c_2: std_logic_vector (6 downto 0) := "0100111"; -- minuten aanpassen
constant c_3: std_logic_vector (6 downto 0) := "0101001"; -- licht aanpassen
constant c_4: std_logic_vector (6 downto 0) := "0101000"; -- geluid aanpassen
constant c_5: std_logic_vector (6 downto 0) := "0101011"; -- tijd aanpassen
constant c_6: std_logic_vector (6 downto 0) := "0101100"; -- leeg, alarm uit


begin

lbl1: process(clk)
	begin
		if (clk'event and clk='1') then
			if reset = '1' then
				state <= steady;
			else
				state <= new_state;
				buf <= new_buf;
				alarm_buf <= alarm;
			end if;
		end if;
	end process;


lbl2: process (state, menu, ready, buf, alarm, alarm_buf)
begin
	case state is
		when steady =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			new_buf <= buf;
			if (alarm /= alarm_buf) then
				new_state <= schrijven;
			else
				new_state <= steady;
			end if;
			if (menu /= buf) then
				new_state <= schrijven;
			else
				new_state <= steady;
			end if;
		when schrijven =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			case menu is
				when "001" =>
					c_menu <= c_1;
					new_buf <= "001";
				when "010" =>
					c_menu <= c_2;
					new_buf <= "010";
				when "011" =>
					c_menu <= c_3;
					new_buf <= "011";
				when "100" =>
					c_menu <= c_4;
					new_buf <= "100";
				when "000" =>
					c_menu <= c_0;
					new_buf <= "000";
				when "101" =>
					c_menu <= c_5;
					new_buf <= "101";
				when others =>
					if (alarm = '1') then
						c_menu <= c_0);
					else
						c_menu <= c_6);
					end if;
					new_buf <= buf;
			end case;
			if (ready = '1') then
				new_state <= ready_state;
			else
				new_state <= schrijven;
			end if;
		when ready_state =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= "0000000";
			new_buf <= buf;
			if (ready = '0') then
				new_state <= steady;
			else
				new_state <= ready_state;
			end if;
	end case;	
 end process;

end behaviour;


