library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datum is	
	port(
		clk			: in std_logic;
		reset		: in std_logic;
		ready_buf	: IN std_logic;
		tijd_uren 	: IN std_logic_vector (4 downto 0); 
		dagvdweek	: IN std_logic_vector (2 downto 0);
		dagvdmaand 	: IN std_logic_vector (5 downto 0);
		maand		: IN std_logic_vector (4 downto 0);
		jaar 		: IN std_logic_vector (7 downto 0);
		
		x		: out std_logic_vector (6 downto 0);
		y		: out std_logic_vector (5 downto 0);
		c		: out std_logic_vector (6 downto 0)
		);
end datum; 


architecture behaviour of datum is 

--Constantes voor posities X-Y 
	constant x_rust : std_logic_vector (6 downto 0) := " " ; 
	constant y_rust : std_logic_vector (5 downto 0) := " " ; 

	constant x_1 : std_logic_vector (6 downto 0) := " " ; 
	constant y_1 : std_logic_vector (5 downto 0) := " " ; 

	constant x_2 : std_logic_vector (6 downto 0) := " " ; 
	constant y_2 : std_logic_vector (5 downto 0) := " " ; 
	
	constant x_3 : std_logic_vector (6 downto 0) := " " ;  
	constant y_3 : std_logic_vector (5 downto 0) := " " ; 

	constant x_4 : std_logic_vector (6 downto 0) := " " ; 
	constant y_4 : std_logic_vector (5 downto 0) := " " ; 	

	constant x_5 : std_logic_vector (6 downto 0) := " " ; 
	constant y_5 : std_logic_vector (5 downto 0) := " " ; 

	constant x_6 : std_logic_vector (6 downto 0) := " " ; 
	constant y_6 : std_logic_vector (5 downto 0) := " " ; 

	constant x_7 : std_logic_vector (6 downto 0) := " " ; 
	constant y_7 : std_logic_vector (5 downto 0) := " " ; 


-- Constantes voor getallen 0 tot 9
	constant char_rust : std_logic_vector(6 downto 0) :="";
	constant char_0 : std_logic_vector(6 downto 0) :="";
	constant char_1 : std_logic_vector(6 downto 0) :="";
	constant char_2 : std_logic_vector(6 downto 0) :="";
	constant char_3 : std_logic_vector(6 downto 0) :="";
	constant char_4 : std_logic_vector(6 downto 0) :="";
	constant char_5 : std_logic_vector(6 downto 0) :="";
	constant char_6 : std_logic_vector(6 downto 0) :="";
	constant char_7 : std_logic_vector(6 downto 0) :="";
	constant char_8 : std_logic_vector(6 downto 0) :="";
	constant char_9 : std_logic_vector(6 downto 0) :="";

--Constantes voor de dagen MA t/m ZO
	constant char_ma : std_logic_vector(6 downto 0) := " ";
	constant char_di : std_logic_vector(6 downto 0) := " ";
	constant char_wo : std_logic_vector(6 downto 0) := " ";
	constant char_do : std_logic_vector(6 downto 0) := " ";
	constant char_vr : std_logic_vector(6 downto 0) := " ";
	constant char_za : std_logic_vector(6 downto 0) := " ";
	constant char_zo : std_logic_vector(6 downto 0) := " ";




	type states is (sreset, selectdata, cdvdw, cgetal);
	
	signal state, next_state 		: states;
	signal x_buf 					: std_logic_vector(6 downto 0);
	signal y_buf 					: std_logic_vector(5 downto 0);
	signal positie, new_positie		: unsigned ( 2 downto 0);
	signal data_buffer				: std_logic_vector(3 downto 0); 
	signal reset_buffer, start, finish : std_logic;
	
	
begin
--proces FSM	
	
	process (clk, reset)
	begin 
		if (reset='1') then 
			positie <= (others => '0');
			state<= selectdata;
		elsif (rising_edge (clk))
			state<=next_state;
			positie <= new_positie;
		end if;		
	end process;

	process (state, ready_buf, x_buf, y_buf, reset_buffer, )
		
	begin 
		case(state) is
			
			when rust => 
				c <= char_rust;
				
				if (tijd_uren = "00000" ) then 
					next_state <= selectdata;
				else 
					next_state <= rust;
				end if;
									
--			when sreset => 
--				c <= char_rust;
--				
--				new_positie <= (others => '0');					
				--indien er is gereset, of de de uren zijn veranderd naar "00000", start verzenden
--				if (reset_buffer = '1') then 
--					next_state <= selectdata;
--				elsif (start = '1') then
--					next_state <= selectdata;
--				else 
--					next_state <= sreset;
--				end if;
												
			when selectdata =>
				c <= char_rust; -- maak uitgang C in rust stand, 
				
				-- indien positie tot 7 is geteld, ga naar sreset (rust) state. 		
				if (positie ="111" ) then 
					if (tijd_uren = "00000") then 
						next_state = selectdata; 
					else 
						next_state = rust; 
					end if;  
				-- indien positie is 0, ga character voor dag van de week schrijven
				elsif (positie = "000") then 
					next_state<= cdvdw;
				-- in alle andere gevallen, ga character(s) voor de datum schrijven
				else 
					next_state<= cgetal;					
				end if;
			
			-- state om character voor dag van de week te schrijven
			when cdvdw =>
				case (data_buffer) is 
					when "0001" => 
						c <= char_ma; 
					when "0010" => 
						c <= char_di; 
					when "0011" => 
						c <= char_wo; 
					when "0100" => 
						c <= char_do; 
					when "0101" => 	
						c <= char_vr; 
					when "0110" => 
						c <= char_za; 
					when "0111" => 
						c <= char_zo; 
					else 
						c <= char_rust;
				end case; 
				
				-- indien de slave-select laag wordt, dan positie+1 en terug naar state select data
				if (falling_edge(ss)) then 
					new_positie <= positie + 1;
					new_state <= selectdata;	
				else 
					new_state <= cdvdw;
				end if;
				
				-- state voor character om getallen te schrijven voor datum 
			when cgetal =>		
				case (data_buffer) is 
					when "0000" => 
						c <= char_0; 
					when "0001" => 
						c <= char_1; 
					when "0010" => 
						c <= char_2; 
					when "0011" => 
						c <= char_3; 
					when "0100" => 
						c <= char_4; 
					when "0101" => 
						c <= char_5; 
					when "0110" => 
						c <= char_6; 
					when "0111" => 
						c <= char_7; 
					when "1000" => 
						c <= char_8;	
					when "1001" => 
						c <= char_9;	
					else 
						c <= char_rust;
				end case; 		
	
				if (falling_edge(ss)) then 
					new_positie <= positie + 1;
					new_state <= selectdata;
				else 
					new_state <= cdvdw;
				end if;
	end process;
 				
	process (positie) 
		case positie is 
			when "001" => 
				data_buffer(0) <= dagvdmaand(4);
				data_buffer(1) <= dagvdmaand(5);
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
				x <= x_1;
				y <= y_1;
				
			when "010" => 
				data_buffer(0) <= dagvdmaand(0);
				data_buffer(1) <= dagvdmaand(1);
				data_buffer(2) <= dagvdmaand(2);
				data_buffer(3) <= dagvdmaand(3);
				x <= x_2;
				y <= y_2;
			when "011" => 
				data_buffer(0) <= maand(4);
				data_buffer(1) <= '0';
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
				x <= x_3;
				y <= y_3;
			when "100" => 
				data_buffer(0) <= maand(0);
				data_buffer(1) <= maand(1);
				data_buffer(2) <= maand(2);
				data_buffer(3) <= maand(3);
				x <= x_4;
				y <= y_4;
			when "101" => 
				data_buffer(0) <= jaar(4);
				data_buffer(1) <= jaar(5);
				data_buffer(2) <= jaar(6);
				data_buffer(3) <= jaar(7);
				x_buf <= x_5;
				y_buf <= y_5;
			when "110" => 
				data_buffer(0) <= jaar(0);
				data_buffer(1) <= jaar(1);
				data_buffer(2) <= jaar(2);
				data_buffer(3) <= jaar(3);
				x <= x_6;
				y <= y_6;
			when "111" => 
				data_buffer(0) <= dagvdweek(0);
				data_buffer(1) <= dagvdweek(1);
				data_buffer(2) <= dagvdweek(2);
				data_buffer(3) <= '0';
				x <= x_7;
				y <= y_7;
			when others =>
				data_buffer(0) <= '0';
				data_buffer(1) <= '0';
				data_buffer(2) <= '0';
				data_buffer(3) <= '0';
				x <= x_rust;
				y <= y_rust;
		end case; 
	end process;
		
end  behaviour;
		
		