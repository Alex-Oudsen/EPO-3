-- Alex Oudsen, 4325494
-- Deze autonome, synchroniseerbare, bcd gecodeerde klok wordt gebruikt om
-- de huidige tijd bij te houden, ook als het dcf signaal niet beschikbaar is
-- Wanneer het dcf signaal wel beschikbaar is,
-- wordt de klok gesynchroniseerd met dit signaal

-- Voor de bcd gecodeerde klok wordt gebruik gemaakt van de volgende subblokken:
-- mod24_tel_bcd, mod60_tel_bcd & mod60_clk_bcd

library ieee;
use ieee.std_logic_1164.all;

architecture structure of ausy_klok_bcd is
	component mod60_clk_bcd is
   		port(clk:		in    std_logic;
        		     clk_in:		in    std_logic;
        		     reset:		in    std_logic;
		     sync_now:		in    std_logic;
        		     ref:		in    std_logic_vector(6 downto 0);
		     m_clk:		out   std_logic);
	end component mod60_clk_bcd;

	component mod60_tel_bcd is
		port (clk:		in  std_logic;
		      clk_in:		in  std_logic;
		      reset:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(6 downto 0);
		      count:    out std_logic_vector(6 downto 0);
	  	      h_clk:    out std_logic);
	end component mod60_tel_bcd;

	component mod24_tel_bcd is
    		port (clk:		in  std_logic;
		      clk_in:		in  std_logic;
		      reset:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(5 downto 0);
	  	      count:    out std_logic_vector(5 downto 0));
	end component mod24_tel_bcd;

	signal m_clk: std_logic;
	signal h_clk: std_logic;
	signal sec_ref: std_logic_vector(6 downto 0);

begin

	sec_ref <= "0000000";

	SEC: mod60_clk_bcd port map(clk, s_clk, reset, sync_now, sec_ref, m_clk);
	MIN: mod60_tel_bcd port map(clk, m_clk, reset, sync_now, min_ref, minutes, h_clk);
	HRS: mod24_tel_bcd port map(clk, h_clk, reset, sync_now, hr_ref, hours);

end structure;


