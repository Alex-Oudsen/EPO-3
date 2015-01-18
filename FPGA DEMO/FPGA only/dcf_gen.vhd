library IEEE;
use IEEE.std_logic_1164.ALL;

entity dcf_gen is
   port(clk50mhz : in  std_logic;  -- 50 Mhz clock input
        res      : in  std_logic;  -- reset
        dcf      : out std_logic); -- DCF output signal
end dcf_gen;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of dcf_gen is
   component gen10hz
      port (clk50mhz : in  std_logic;
            res      : in  std_logic;
            clk10hz  : out std_logic);
   end component;

   signal cnt100ms, new_cnt100ms : unsigned(3 downto 0);
   signal cnt1s, new_cnt1s       : unsigned(5 downto 0);
   signal clk10hz, cur_clk10hz   : std_logic;

   signal code : std_logic_vector(59 downto 1);

begin

   code <= (
      '0', -- P3
      '0', '0', '0', '1', '0', '1', '0', '1', -- year : 15
      '0', '0', '0', '0', '1', -- month  : jan
      '0', '0', '1', -- week day : monday
      '0', '1', '1', '0', '0', '1', -- calender day : 19
      '0', '0', '0', '1', '0', '0', '1', -- P2 + hours : 9
      '1', '1', '0', '0', '0', '1', '0', '1',  -- P1 + min : 45
      '1', '0', '1', '0', '1', '0', '1', '0', '1', '0',  -- not used
      '1', '0', '1', '0', '1', '0', '1', '0', '1', '0',   -- not used
      '0' -- bit 0
   );

   lbl0: gen10hz port map (clk50mhz, res, clk10hz);

   lbl1a: process (clk50mhz)
   begin
      if (clk50mhz'event and clk50mhz = '1') then
         if (res = '1') then
            cnt100ms <= (others => '0');
            cnt1s <= (others => '0');
         else
            cnt100ms <= new_cnt100ms;
            cnt1s <= new_cnt1s;
         end if;
         cur_clk10hz <= clk10hz;
      end if; 
   end process;

   lbl1b: process (cnt100ms, cnt1s, clk10hz, cur_clk10hz)
   begin
      new_cnt1s <= cnt1s;    -- default
      new_cnt100ms <= cnt100ms;  -- default
      if (clk10hz = '1' and cur_clk10hz = '0') then
         if (cnt100ms = 9) then
            new_cnt100ms <= (others => '0');
            if (cnt1s = 59) then
               new_cnt1s <= (others => '0');
            else 
               new_cnt1s <= cnt1s + 1;
            end if;
         else 
            new_cnt100ms <= cnt100ms + 1;
         end if;
      end if;
   end process;

   dcf <= '0' when cnt1s = 0 else
          '1' when cnt100ms = 0 else 
          '1' when cnt100ms = 1 and code(to_integer(cnt1s)) = '1' else 
          '0';

end behaviour;



