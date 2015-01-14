library IEEE;
use IEEE.std_logic_1164.ALL;

entity gen32khz is
   port(clk50mhz : in  std_logic;   -- 50 Mhz clock input
        clk32khz  : out std_logic);  -- 10 Hz clock output 
end gen32khz;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of gen32khz is
   signal count, new_count : unsigned (10 downto 0);
   signal new_clk32khz : std_logic;
begin
   lbl1: process (clk50mhz)
   begin
      if (clk50mhz'event and clk50mhz = '1') then
         count <= new_count;
			clk32khz <= new_clk32khz;
      end if;
   end process;
   lbl2: process (count)
   begin
      if (count >= 1563) then
         new_count <= (others => '0');
         new_clk32khz <= '0';
      elsif (count >= 783) then
         new_count <= count + 1;
         new_clk32khz <= '1';
      else
         new_count <= count + 1;
         new_clk32khz <= '0';
      end if;
   end process;
end behaviour;



