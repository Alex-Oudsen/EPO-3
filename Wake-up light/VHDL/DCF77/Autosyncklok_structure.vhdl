library ieee;
use ieee.std_logic_1164.all;

architecture structural of autosyncklok is
	component mod60_teller is
		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      ref:	in  std_logic_vector(5 downto 0);
	  	      t_clk:    out std_logic;
		      count:    out std_logic_vector(5 downto 0));
	end component mod60_teller;

	component mod24_teller is
    		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      ref:	in  std_logic_vector(4 downto 0);
	  	      count:    out std_logic_vector(4 downto 0));
	end component mod24_teller;

	signal m_clk: std_logic;
	signal h_clk: std_logic;
	signal sec_ref: std_logic_vector(5 downto 0);
	signal min_ref: std_logic_vector(5 downto 0);
	signal hour_ref: std_logic_vector(4 downto 0);

begin

	sec_ref <= time_ref(5 downto 0);
	min_ref <= time_ref(11 downto 6);
	hour_ref <= time_ref(16 downto 12);

	SEC: mod60_teller port map(clk, reset, sync_now, sec_ref, m_clk, open);
	MIN: mod60_teller port map(m_clk, reset, sync_now, min_ref, h_clk, minutes);
	HRS: mod24_teller port map(h_clk, reset, sync_now, hour_ref, hours);

end architecture structural;