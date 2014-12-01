library ieee;
use ieee.std_logic_1164.all;

architecture structural of dcf77 is
	component dcf_decoder is
		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      dcf_in:   in  std_logic;
		      dcf_led:  out std_logic;
	  	      sync_now: out std_logic;
		      time_ref: out std_logic_vector(16 downto 0));
	end component dcf_decoder;

	component klokdeler is
    		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      clk_1hz:  out std_logic);
	end component klokdeler;

	component autosyncklok is
    		port (clk:	in  std_logic;
		      reset:	in  std_logic;
		      sync_now: in  std_logic;
		      time_ref:	in  std_logic_vector(16 downto 0);
	  	      minutes:  out std_logic_vector(5 downto 0);
		      hours:    out std_logic_vector(4 downto 0));
	end component autosyncklok;

	signal s_clk: std_logic;
	signal sync_now: std_logic;
	signal time_ref: std_logic_vector(16 downto 0);

begin

	clk_1hz <= s_clk;

	SEC: dcf_decoder  port map(clk, reset, dcf_in, dcf_led, sync_now, time_ref);
	MIN: klokdeler    port map(clk, reset, s_clk);
	HRS: autosyncklok port map(s_clk, reset, sync_now, time_ref, minutes, hours);

end architecture structural;