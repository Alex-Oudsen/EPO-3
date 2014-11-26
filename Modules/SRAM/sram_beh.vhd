library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;


architecture behaviour of sram is
type mem_array is array (0 to (2**address'length) -1) of std_logic_vector((write_data'length -1) downto 0);--Het ram element definiï¿½ren als een array van de adreslengte bij de grootte van het te schrijven woord
type memory_state is (steady,state_reset);					--Het definiï¿½ren van de te gebruiken states zodat er een fsm gemaakt kan worden
signal ram : mem_array;
signal new_ram : mem_array;
signal state,new_state : memory_state;
--signal data_out : std_logic_vector(3 downto 0);
begin
	sram : process(clk)						--Bepalen van de state
	begin 
		if rising_edge(clk) then
			if (reset = '1') then
				state <= state_reset;
			else
				ram <= new_ram;
				state <= new_state;
				--read_data <= data_out;
			end if;
      		end if;
	end process sram;
	sram_state : process(state,clk,read_write_line,write_data)	--Het uit voeren van de opdrachten binnen de states
	begin
		case state is                  
			when steady =>
				if read_write_line ='1' then 		--Lezen van data
					read_data <= ram(to_integer(unsigned(address)));
					new_state <= steady;
					new_ram <= ram;
				elsif read_write_line = '0' then 	--Data schrijven
					for J in 0 to 15 loop
						if (J = to_integer(unsigned(address))) then
							new_ram(J) <= write_data;
						else
							new_ram(J) <= ram(J);
						end if;
					end loop;
					read_data <= "0000";
					new_state <= steady;
				end if;
 			when state_reset =>		-- Alles initialiseren en dus op 0 zetten 
				new_ram <= (others => (others => '0')); 
				read_data <= "0000";
				new_state <= steady;
	    end case;
	end process sram_state;
end behaviour;










