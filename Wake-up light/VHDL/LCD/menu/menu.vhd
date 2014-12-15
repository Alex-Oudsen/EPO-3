entity menu_scherm is
port{		clk			:	in std_logic;
				reset		:	in std_logic;	
				ready		:	in std_logic;
				menu		:	in std_logic_vector (2 downto 0);
		    x     	: out   std_logic_vector(6 downto 0);
        y     	: out   std_logic_vector(5 downto 0);
				c 			: out std_logic_vector(6 downto 0));
end menu_scherm;

architecture behaviour of menu_scherm is

type menu_state is (steady, uren, uren_ready, minuten, minuten_ready, licht, licht_ready, geluid, geluid_ready);
signal state, new_state: menu_state;

constant x_pos_uren: std_logic_vector (6 downto 0) := "1010101";
constant y_pos_uren: std_logic_vector (5 downto 0) := "010101";
constant c_uren: std_logic_vector (6 downto 0) := "0000111";
constant x_pos_min: std_logic_vector (6 downto 0) := "1010101";
constant y_pos_min: std_logic_vector (5 downto 0) := "010101";
constant c_min: std_logic_vector (6 downto 0) := "0000111";
constant x_pos_licht: std_logic_vector (6 downto 0) := "1010101";
constant y_pos_licht: std_logic_vector (5 downto 0) := "010101";
constant c_licht: std_logic_vector (6 downto 0) := "0000111";
constant x_pos_geluid: std_logic_vector (6 downto 0) := "1010101";
constant y_pos_geluid: std_logic_vector (5 downto 0) := "010101";
constant c_geluid: std_logic_vector (6 downto 0) := "0000111";

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

lbl2: process (state, menu,  ready)
begin
	case state is
		when steady =>
			x <= "0000000";
			y <= "000000";
			c <= "0000000";
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
			x <= x_pos_uren;
			y <= y_pos_uren;
			c <= c_uren;
			if (ready = 1) then
				new_state <= uren_ready;
			else
				new_state <= uren;
			end if;
		when uren_ready =>
			x <= x_pos_uren;
			y <= y_pos_uren;
			c <= c_uren;
			if (ready = 0) then
				new_state <= steady;
			else
				new_state <= uren_ready;
			end if;
		when minuten =>
			x <= x_pos_min;
			y <= y_pos_min;
			c <= c_min;
			if (ready = 1) then
				new_state <= minuten_ready;
			else
				new_state <= minuten;
			end if;
		when minuten_ready =>
			x <= x_pos_min;
			y <= y_pos_min;
			c <= c_min;
			if (ready = 0) then
				new_state <= steady;
			else
				new_state <= minuten_ready;
			end if;
		when licht =>
			x <= x_pos_licht;
			y <= y_pos_licht;
			c <= c_licht;
			if (ready = 1) then
				new_state <= licht_ready;
			else
				new_state <= licht;
			end if;
		when licht_ready =>
			x <= x_pos_licht;
			y <= y_pos_licht;
			c <= c_licht;
			if (ready = 0) then
				new_state <= steady;
			else
				new_state <= licht_ready;
			end if;
		when geluid =>
			x <= x_pos_geluid;
			y <= y_pos_geluid;
			c <= c_geluid;
			if (ready = 1) then
				new_state <= geluid_ready;
			else
				new_state <= geluid;
			end if;
		when geluid_ready =>
			x <= x_pos_geluid;
			y <= y_pos_geluid;
			c <= c_geluid;
			if (ready = 0) then
				new_state <= steady;
			else
				new_state <= geluid_ready;
			end if;
	end case;
end process;
end behaviour;