library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of klokdeler is

	type kd_state is (clear, counting, switch);
	signal state, new_state: kd_state;

	signal count, new_count: std_logic_vector(13 downto 0);
	signal temp, new_temp: std_logic;

begin
	clk_1hz <= temp;

	process(clk) is						
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				temp <= '0';
				count <= (others => '0');
				state <= clear;
			else
				temp <= new_temp;
				count <= new_count;
				state <= new_state;
			end if;
		end if;
	end process;

	process(state, count, temp) is
	begin
		case state is
			when clear =>	
				new_temp <= '0';
				new_count <= (others => '0');
				new_state <= counting;
			when counting =>
				new_temp <= temp;
				new_count <= count + 1;
				if (count < 15998) then
					new_state <= counting;
				else
					new_state <= switch;
				end if;
			when switch =>
				new_temp <= not temp;
				new_count <= (others => '0');
				new_state <= counting;
			when others =>
				new_temp <= '1';
				new_count <= (others => '0');
				new_state <= clear;
		end case;
	end process;
end behaviour;


