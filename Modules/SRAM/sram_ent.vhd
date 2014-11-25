library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

entity sram is
   port(clk          		:in    std_logic;				
	read_write_line   	:in    std_logic; 				--0=write data 1=data lezen
	reset		:in	std_logic;
        write_data   		:in    std_logic_vector(3 downto 0);		--De data ingang
 	address	     		:in    std_logic_vector(3 downto 0);		--Het aantal addressen in dit geval 16 (2^4)
        read_data    		:out   std_logic_vector(3 downto 0));		--De data uitgang
end sram;







