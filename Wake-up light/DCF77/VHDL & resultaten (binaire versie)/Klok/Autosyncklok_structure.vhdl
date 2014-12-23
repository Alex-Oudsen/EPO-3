-- Alex Oudsen, 4325494
-- Deze autonome, synchroniseerbare klok wordt gebruikt om
-- de huidige tijd bij te houden, ook als het dcf signaal niet beschikbaar is
-- Wanneer het dcf signaal wel beschikbaar is,
-- wordt de klok gesynchroniseerd met dit signaal

-- Voor de klok wordt gebruik gemaakt van de volgende subblokken:
-- mod24_teller, mod60_teller & mod60_clk

library ieee;
use ieee.std_logic_1164.all;

architecture structure of autosyncklok is
	component mod60_clk is
   		port(clk:	in  std_logic;
        	     clk_in:	in  std_logic;
        	     reset:	in  std_logic;
		     sync_now:	in  std_logic;
        	     ref:	in  std_logic_vector(5 downto 0);
		     m_clk:	out std_logic);
	end component mod60_clk;

	component mod60_teller is
		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      ref:	in  std_logic_vector(5 downto 0);
		      count:    out std_logic_vector(5 downto 0);
	  	      h_clk:    out std_logic);
	end component mod60_teller;

	component mod24_teller is
    		port (clk:	in  std_logic;
		      clk_in:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      ref:	in  std_logic_vector(4 downto 0);
	  	      count:    out std_logic_vector(4 downto 0));
	end component mod24_teller;

	signal m_clk: std_logic;
	signal h_clk: std_logic;
	signal sec_ref: std_logic_vector(5 downto 0);

begin

	sec_ref <= "000000";

	SEC: mod60_clk    port map(clk, s_clk, reset, sync_now, sec_ref, m_clk);
	MIN: mod60_teller port map(clk, m_clk, reset, sync_now, min_ref, minutes, h_clk);
	HRS: mod24_teller port map(clk, h_clk, reset, sync_now, hr_ref, hours);

end structure;
