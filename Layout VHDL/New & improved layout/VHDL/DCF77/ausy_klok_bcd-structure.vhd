library ieee;
use ieee.std_logic_1164.all;

architecture structure of ausy_klok_bcd is

	component mod60_clk_bcd is
   		port(clk:		in    std_logic;
        		     reset:		in    std_logic;
        		     clk_in:		in    std_logic;
		     sync_now:		in    std_logic;
        		     ref:		in    std_logic_vector(6 downto 0);
		     m_clk:		out   std_logic);
	end component mod60_clk_bcd;

	component mod60_tel_bcd is
		port (clk:		in  std_logic;
		      reset:		in  std_logic;
		      clk_in:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(6 downto 0);
		      count:    out std_logic_vector(6 downto 0);
	  	      h_clk:    out std_logic);
	end component mod60_tel_bcd;

	component mod24_tel_bcd is
    		port (clk:		in  std_logic;
		      reset:		in  std_logic;
		      clk_in:		in  std_logic;
		      sync_now: in  std_logic;
		      ref:		in  std_logic_vector(5 downto 0);
	  	      count:    out std_logic_vector(5 downto 0));
	end component mod24_tel_bcd;

	signal m_clk, h_clk: std_logic;
	signal sec_ref: std_logic_vector(6 downto 0);

begin
	sec_ref <= "0000000";

	sec: mod60_clk_bcd port map(clk, reset, s_clk, sync_now, sec_ref, m_clk);
	min: mod60_tel_bcd port map(clk, reset, m_clk, sync_now, min_ref, minutes, h_clk);
	hrs: mod24_tel_bcd port map(clk, reset, h_clk, sync_now, hr_ref, hours);

end structure;





