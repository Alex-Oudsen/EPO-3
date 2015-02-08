library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of debugger is

	signal outp, new_outp: std_logic_vector(7 downto 0);

begin
	output <= outp;

	process(clk)
    	begin
		if (clk'event and clk = '1') then
            			if (reset = '1') then
                				outp <= (others => '0');
            			else
                				outp <= new_outp;
            			end if;
        		end if;
    	end process;

	process(outp, switches, clk_1hz, dcf_led, menu_info, menu_state, tijd_uren, tijd_min, wek_uren, wek_min, weekdag, dag, maand, jaar)
	begin
		case switches is
			when "000" =>
				new_outp(2 downto 0) <= menu_info;
				new_outp(3) <= dcf_led;
				new_outp(4) <= clk_1hz;
				new_outp(7 downto 5) <= menu_state;
			when "001" =>
				new_outp(5 downto 0) <= tijd_uren;
				new_outp(7 downto 6) <= "00";
			when "010" =>
				new_outp(6 downto 0) <= tijd_min;
				new_outp(7) <= '0';
			when "011" =>
				new_outp(5 downto 0) <= wek_uren;
				new_outp(7 downto 6) <= "00";
			when "100" =>
				new_outp(6 downto 0) <= wek_min;
				new_outp(7) <= '0';
			when "101" =>
				new_outp(5 downto 0) <= dag;
				new_outp(7 downto 6) <= "00";
			when "110" =>
				new_outp(4 downto 0) <= maand;
				new_outp(7 downto 5) <= weekdag;
			when "111" =>
				new_outp <= jaar;
			when others =>
				new_outp <= (others => '0');
		end case;
	end process;
end behaviour;


