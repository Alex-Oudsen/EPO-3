library IEEE;
use IEEE.std_logic_1164.ALL;

entity gen10hz is
   port(clk50mhz : in  std_logic;   -- 50 Mhz clock input
        res      : in  std_logic;   -- reset
        clk10hz  : out std_logic);  -- 10 Hz clock output 
end gen10hz;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of gen10hz is
   signal count, new_count : unsigned(23 downto 0);
   signal new_clk10hz : std_logic;
begin
   lbl1: process (clk50mhz)
   begin
      if (clk50mhz'event and clk50mhz = '1') then
         if (res = '1') then
            count <= (others => '0');
            clk10hz <= '0';
         else
            count <= new_count;
            clk10hz <= new_clk10hz;
         end if;
      end if;
   end process;
   lbl2: process (count)
   begin
      if (count >= 5000000) then
         new_count <= (others => '0');
         new_clk10hz <= '0';
      elsif (count >= 2500000) then
         new_count <= count + 1;
         new_clk10hz <= '1';
      else
         new_count <= count + 1;
         new_clk10hz <= '0';
      end if;
   end process;
end behaviour;



