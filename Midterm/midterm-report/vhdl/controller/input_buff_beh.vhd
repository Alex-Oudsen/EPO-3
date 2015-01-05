library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buff is
signal output: std_logic_vector (4 downto 0);
  begin
     process(clk,knoppen,reset)
        begin
          if(rising_edge(clk)) then
            output <=knoppen;
        end if;
          if(reset='1') then
            output<="00000";
          end if;
      end process;
      
      
      process(clk,output,reset)
        begin
          if(rising_edge(clk)) then
          	knoppenbuff<= output;
        end if;
        if(reset='1') then
            knoppenbuff<="00000";
          end if;
      end process;    
  end;
end behaviour;
