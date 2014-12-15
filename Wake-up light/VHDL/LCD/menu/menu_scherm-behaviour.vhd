library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of menu_scherm is

type menu_state is (steady, uren, uren_ready, minuten, minuten_ready, licht, licht_ready, geluid, geluid_ready);
signal state, new_state: menu_state;

constant x_pos_menu: std_logic_vector (6 downto 0) := "0011001";				-- x-positie voor het balkje menu
constant y_pos_menu: std_logic_vector (5 downto 0) := "110101";				-- y-positie voor het balkje menu
constant c_tijd_aanp: std_logic_vector (6 downto 0) := "0101100";			-- "wekkertijd aanpassen"
constant c_licht_aanp: std_logic_vector (6 downto 0) := "1011100";			-- "licht aanpassen"
constant c_geluid_aanp: std_logic_vector (6 downto 0) := "0110110";		-- "geluid aanpassen"
constant x_pos_uren: std_logic_vector (6 downto 0) := "1010101";			-- x-positie voor het streepje onder het uur
constant y_pos_uren: std_logic_vector (5 downto 0) := "010101";				-- y-positie voor het streepje onder het uur
constant c_kort: std_logic_vector (6 downto 0) := "0000111";					-- char "streepje"
constant x_pos_min: std_logic_vector (6 downto 0) := "1010101";				-- x-positie voor het streepje onder de minuten
constant y_pos_min: std_logic_vector (5 downto 0) := "010101";				-- y-positie voor het streepje onder de minuten
constant x_pos_licht: std_logic_vector (6 downto 0) := "1010101";			-- x-positie voor het streepje onder het licht
constant y_pos_licht: std_logic_vector (5 downto 0) := "010101";			-- y-positie voor het streepje onder het licht
constant c_lang: std_logic_vector (6 downto 0) := "0000111";					-- char "streepje"
constant x_pos_geluid: std_logic_vector (6 downto 0) := "1010101";		-- x-positie voor het streepje onder het geluid
constant y_pos_geluid: std_logic_vector (5 downto 0) := "010101";			-- y-positie voor het streepje onder het geluid

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


lbl2: process (state, menu, ready)
begin
	case state is
		when steady =>
			x_menu <= "0000000";
			y_menu <= "000000";
			c_menu <= "0000000";
			x_streep <= "0000000";
			y_streep <= "000000";
			c_streep <= "0000000";
			if (menu = "001") then
				new_state <= uren;
			elsif (menu = "010") then
				new_state <= minuten;
			elsif (menu = "011") then
				new_state <= licht;
			elsif (menu = "100") then
				new_state <= geluid; 
			else
				new_state <= steady;
			end if;
		when uren =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_tijd_aanp;
			x_streep <= x_pos_uren;
			y_streep <= y_pos_uren;
			c_streep <= c_kort;
			if (ready = '1') then
				new_state <= uren_ready;
			else
				new_state <= uren;
			end if;
		when uren_ready =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_tijd_aanp;
			x_streep <= x_pos_uren;
			y_streep <= y_pos_uren;
			c_streep <= c_kort;
			if (ready = '0') then
				new_state <= steady;
			else
				new_state <= uren_ready;
			end if;
		when minuten =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_tijd_aanp;
			x_streep <= x_pos_min;
			y_streep <= y_pos_min;
			c_streep <= c_kort;
			if (ready = '1') then
				new_state <= minuten_ready;
			else
				new_state <= minuten;
			end if;
		when minuten_ready =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_tijd_aanp;
			x_streep <= x_pos_min;
			y_streep <= y_pos_min;
			c_streep <= c_kort;
			if (ready = '0') then
				new_state <= steady;
			else
				new_state <= minuten_ready;
			end if;
		when licht =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_licht_aanp;
			x_streep <= x_pos_licht;
			y_streep <= y_pos_licht;
			c_streep <= c_lang;
			if (ready = '1') then
				new_state <= licht_ready;
			else
				new_state <= licht;
			end if;
		when licht_ready =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_licht_aanp;
			x_streep <= x_pos_licht;
			y_streep <= y_pos_licht;
			c_streep <= c_lang;
			if (ready = '0') then
				new_state <= steady;
			else
				new_state <= licht_ready;
			end if;
		when geluid =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_geluid_aanp;
			x_streep <= x_pos_geluid;
			y_streep <= y_pos_geluid;
			c_streep <= c_lang;
			if (ready = '1') then
				new_state <= geluid_ready;
			else
				new_state <= geluid;
			end if;
		when geluid_ready =>
			x_menu <= x_pos_menu;
			y_menu <= y_pos_menu;
			c_menu <= c_geluid_aanp;
			x_streep <= x_pos_geluid;
			y_streep <= y_pos_geluid;
			c_streep <= c_lang;
			if (ready = '0') then
				new_state <= steady;
			else
				new_state <= geluid_ready;
			end if;
	end case;
end process;

end behaviour;



