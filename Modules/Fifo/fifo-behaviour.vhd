library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of fifo is
	type fifo_state is (RES, PUSHSTATE, POPSTATE, STEADY);
	signal state, new_state: fifo_state;
	signal fullstate, emptystate: std_logic;
	signal new_address, temp_address : std_logic_vector(2 downto 0);
begin
	lbl1: process (clk)
	begin		
		if (clk'event and clk = '1') then
			if reset = '1' then
				state <= RES;
			else
				address <= new_address;
				temp_address <= new_address;
				if (new_address = "111") then
					full <= '1';
					empty <= '0';
					fullstate <= '1';
					emptystate <= '0';
				elsif (new_address = "000") then
					empty <= '1';
					full <= '0';
					emptystate <= '1';
					fullstate <= '0';
				else
					empty <= '0';
					full <= '0';
					emptystate <= '0';
					fullstate <= '0';
				end if;
				state <= new_state;
			end if;
		end if;
	end process;
	lbl2: process (state, pop, push, temp_address)
	begin
		case state is
			when RES =>
				do <= '0';
				we <= '0';
				nopop <= '0';
				nopush <= '0';
				new_address <= "000";
				new_state <= STEADY;
			when STEADY =>
				if (push = '1') and (pop = '0') then
					if (fullstate = '1') then
						do <= '0';
						we <= '0';
						nopush <= '1';
						nopop <= '0';
						new_address <= temp_address;
						new_state <= STEADY;
					else
						nopush <= '0';
						nopop <= '0';
						do <= '1';
						we <= '1';
						new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) + 1, 3));
						new_state <= PUSHSTATE;
					end if;
				elsif (push = '0') and (pop = '0') then
					do <= '0';
					we <= '0';
					nopush <= '0';
					nopop <= '0';
					new_address <= temp_address;
					new_state <= STEADY;
				elsif (pop = '1') then
					if (emptystate = '1') then
						nopop <= '1';
						if (push = '1') then
							do <= '1';
							we <= '1';
							nopush <= '0';
							new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) + 1, 3));
							new_state <= PUSHSTATE;
						else
							do <= '0';
							we <= '0';
							nopush <= '0';
							new_address <= temp_address;
							new_state <= STEADY;
						end if;
					else
						do <= '1';
						we <= '0';
						if (push = '1') then
							nopush <= '1';
						else
							nopush <= '0';
						end if;
						nopop <= '0';
						new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) - 1, 3));
						new_state <= POPSTATE;
					end if;
				else
					new_address <= temp_address;
					new_state <= STEADY;
				end if;
			when PUSHSTATE =>
				if (push = '1') and (pop = '0') then
					if (fullstate = '1') then
						do <= '0';
						we <= '0';
						nopush <= '1';
						nopop <= '0';
						new_address <= temp_address;
						new_state <= STEADY;
					else
						do <= '1';
						we <= '1';
						nopush <= '0';
						nopop <= '0';
						new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) + 1, 3));
						new_state <= PUSHSTATE;
					end if;
				elsif (push = '0') and (pop = '0') then
					do <= '0';
					we <= '0';
					nopush <= '0';
					nopop <= '0';
					new_address <= temp_address;
					new_state <= STEADY;
				elsif (pop = '1') then
					do <= '1';
					we <= '0';
					if (push = '1') then
						nopush <= '1';
					else
						nopush <= '0';
					end if;
					nopop <= '0';
					new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) - 1, 3));
					new_state <= POPSTATE;
				else
					do <= '0';
					we <= '0';
					new_address <= temp_address;
					new_state <= STEADY;
				end if;
			when POPSTATE =>
				if (push = '1') and (pop = '0') then
					if (fullstate = '1') then
						do <= '0';
						we <= '0';
						nopush <= '1';
						nopop <= '0';
						new_address <= temp_address;
						new_state <= STEADY;
					else
						do <= '1';
						we <= '1';
						nopush <= '0';
						nopop <= '0';
						new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) + 1, 3));
						new_state <= PUSHSTATE;
					end if;
				elsif (push = '0') and (pop = '0') then
					do <= '0';
					we <= '0';
					nopush <= '0';
					nopop <= '0';
					new_address <= temp_address;
					new_state <= STEADY;
				elsif (pop = '1') then
					if (emptystate = '1') then
						nopop <= '1';
						if (push = '1') then
							do <= '1';
							we <= '1';
							nopush <= '0';
							new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) + 1, 3));
							new_state <= PUSHSTATE;
						else
							do <= '0';
							we <= '0';
							nopush <= '0';
							new_address <= temp_address;
							new_state <= STEADY;
						end if;
					else
						do <= '1';
						we <= '0';
						if (push = '1') then
							nopush <= '1';
						else
							nopush <= '0';
						end if;
						nopop <= '0';
						new_address <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_address)) - 1, 3));
						new_state <= POPSTATE;
					end if;
				else
					do <= '0';
					we <= '0';
					new_address <= temp_address;
					new_state <= STEADY;
				end if;
			when others =>
				do <= '0';
				new_address <= temp_address;
				new_state <= STEADY;
		end case;
	end process;
end behaviour;








































