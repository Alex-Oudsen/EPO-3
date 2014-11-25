library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;


architecture behaviour of sram is
type mem_array is array (0 to (2**address'length) -1) of std_logic_vector((write_data'length -1) downto 0);--Het ram element definiëren als een array van de adreslengte bij de grootte van het te schrijven woord
type memory_state is (read_memory,write_memory,state_reset);					--Het definiëren van de te gebruiken states zodat er een fsm gemaakt kan worden
signal ram : mem_array;
signal new_ram : mem_array;
signal state,new_state : memory_state;
begin
	sram : process(clk)						--Bepalen van de state
	begin 
		if rising_edge(clk) then
			case read_write_line is                  
				when '1' =>
					state <= read_memory;     
				when '0' =>
		     			state <= write_memory;
	        		when others =>
	            			state <= read_memory;
	    		end case;
			if (reset = '1') then
				state <= state_reset;
			end if;
      		end if;
	end process sram;
	sram_state : process(state,clk,read_write_line,write_data)	--Het uit voeren van de opdrachten binnen de states
	begin
		if rising_edge(clk) then
			case state is
				when read_memory =>			--Lezen van data
					read_data <= ram(to_integer(unsigned(address)));
				when write_memory =>			--Data schrijven
					new_ram(to_integer(unsigned(address))) <= write_data;
					read_data <= "0000";
				when state_reset =>			-- Alles initialiseren en dus op 0 zetten
					new_ram <= (others => (others => '0')); 
					read_data <= "0000";
			end case;
			ram<=new_ram;					-- Het wegschrijven van het nieuwe ram
		end if;
	end process sram_state;
end behaviour;




