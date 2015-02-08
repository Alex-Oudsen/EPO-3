library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of dcf_lcd is

	type dcf_state is (steady, aan, uit);

	signal state, new_state: dcf_state;
	signal dcf_buf, new_dcf_buf, ready_buf, new_ready_buf: std_logic;

begin
	process(clk)
    	begin
		if (clk'event and clk= '1') then
            			if (reset = '1') then
                				state <= steady;
				ready_buf <= '0';
                				dcf_buf <= '0';
            			else
                				state <= new_state;
				ready_buf <= new_ready_buf;
                				dcf_buf <= new_dcf_buf;
            			end if;
        		end if;
    	end process;

	process (state, dcf_debug, dcf_buf, ready, ready_buf)
   	begin
        case state is
            when steady =>
		new_ready_buf <= ready;
		new_dcf_buf <= dcf_debug;
                lcd_dcf <= "00";

                if (dcf_debug = '0') and (dcf_buf = '1') then -- falling edge
                    new_state <= uit;
                elsif (dcf_debug = '1') and (dcf_buf ='0') then -- rising edge
                    new_state <= aan;
                else
                    new_state <= steady;
                end if;
            when aan =>
		new_ready_buf <= ready;
		new_dcf_buf <= dcf_debug;
                lcd_dcf <= "01"; -- c_aan

                if (ready = '0' and ready_buf = '1') then -- falling edge
                    new_state <= steady;
                else
                    new_state <= aan;
                end if;
            when uit =>
		new_ready_buf <= ready;
		new_dcf_buf <= dcf_debug;
                lcd_dcf <= "10"; -- c_uit

                if (ready = '0' and ready_buf = '1') then -- falling edge
                    new_state <= steady;
                else
                    new_state <= uit;
                end if;
            when others =>
		new_ready_buf <= '0';
		new_dcf_buf <= '0';
                lcd_dcf <= "00";
                new_state <= steady; 
        end case;
    end process;
end behaviour;


