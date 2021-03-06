library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of send_bus is



begin
process(selector)
begin
	case (selector) is
		when "000" =>
			x_out <= x_in_0;
			y_out <= y_in_0;
			c_out <= c_in_0;
			ready_0 <= '1';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '0';
		when "001" =>
			x_out <= x_in_1;
			y_out <= y_in_1;
			c_out <= c_in_1;
			ready_0 <= '0';
			ready_1 <= '1';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '0';
		when "010" =>
			x_out <= x_in_2;
			y_out <= y_in_2;
			c_out <= c_in_2;
			ready_0 <= '0';
			ready_1 <= '0';
			ready_2 <= '1';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '0';
		when "011" =>
			x_out <= x_in_3;
			y_out <= y_in_3;
			c_out <= c_in_3;
			ready_0 <= '0';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '1';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '0';
		when "100" =>
			x_out <= x_in_4;
			y_out <= y_in_4;
			c_out <= c_in_4;
			ready_0 <= '0';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '1';
			ready_5 <= '0';
			ready_6 <= '0';
		when "101" =>
			x_out <= x_in_5;
			y_out <= y_in_5;
			c_out <= c_in_5;
			ready_0 <= '0';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '1';
			ready_6 <= '0';
		when "110" =>
			x_out <= x_in_6;
			y_out <= y_in_6;
			c_out <= c_in_6;
			ready_0 <= '0';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '1';
		when others =>
			x_out <= x_in_0;
			y_out <= y_in_0;
			c_out <= c_in_0;
			ready_0 <= '1';
			ready_1 <= '0';
			ready_2 <= '0';
			ready_3 <= '0';
			ready_4 <= '0';
			ready_5 <= '0';
			ready_6 <= '0';
	end case;
end process;
end behaviour;





