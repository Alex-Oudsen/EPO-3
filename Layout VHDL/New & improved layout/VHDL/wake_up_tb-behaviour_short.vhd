library ieee;
use ieee.std_logic_1164.all;

architecture behaviour_short of wake_up_tb is

	component wake_up is
		port (xi			: in  std_logic;
		      xo			: inout std_logic;
		      reset			: in  std_logic;
		      dcf_in			: in  std_logic;
		      snooze			: in  std_logic;
		      knoppen			: in  std_logic_vector(3 downto 0);
		      schakelaars			: in  std_logic_vector(2 downto 0);
		      debug_out			: out std_logic_vector(7 downto 0);
		      data_out			: out std_logic_vector(6 downto 0);
	         	    clk_out  			: out std_logic;
		      buzzer			: out std_logic;
		      led_lamp			: out std_logic);
	end component wake_up;

	signal xi, xo, reset, dcf_in, snooze, clk_out, clk1hz, dcfled, buzzer, led_lamp: std_logic;
	signal schakelaars: std_logic_vector(2 downto 0);
	signal debug_out: std_logic_vector(7 downto 0);
	signal data_out: std_logic_vector(6 downto 0);
	signal knoppen:	std_logic_vector(3 downto 0);

begin
	xi	<=	'1' after     0 us,
			'0' after    16 ns when xi /= '0' else '1' after 16 ns;	reset	<=	'1' after     0 us,
			'0' after    50 us;			
	dcf_in	<=	'0' after     0 us,
			'1' after   500 us, '0' after   600 us, -- bit 58
			'1' after  2500 us, '0' after  2600 us, -- bit 59 & bit 0
			'1' after  3500 us, '0' after  3600 us, -- bit 1
			'1' after  4500 us, '0' after  4600 us, -- bit 2
			'1' after  5500 us, '0' after  5600 us, -- bit 3
			'1' after  6500 us, '0' after  6600 us, -- bit 4
			'1' after  7500 us, '0' after  7600 us, -- bit 5
			'1' after  8500 us, '0' after  8600 us, -- bit 6
			'1' after  9500 us, '0' after  9600 us, -- bit 7
			'1' after 10500 us, '0' after 10600 us, -- bit 8
			'1' after 11500 us, '0' after 11600 us, -- bit 9
			'1' after 12500 us, '0' after 12600 us, -- bit 10
			'1' after 13500 us, '0' after 13600 us, -- bit 11
			'1' after 14500 us, '0' after 14600 us, -- bit 12
			'1' after 15500 us, '0' after 15600 us, -- bit 13
			'1' after 16500 us, '0' after 16600 us, -- bit 14
			'1' after 17500 us, '0' after 17600 us, -- bit 15
			'1' after 18500 us, '0' after 18600 us, -- bit 16
			'1' after 19500 us, '0' after 19600 us, -- bit 17
			'1' after 20500 us, '0' after 20700 us, -- bit 18	1
			'1' after 21500 us, '0' after 21600 us, -- bit 19
			'1' after 22500 us, '0' after 22700 us, -- bit 20	1
			'1' after 23500 us, '0' after 23600 us, -- bit 21
			'1' after 24500 us, '0' after 24600 us, -- bit 22
			'1' after 25500 us, '0' after 25600 us, -- bit 23
			'1' after 26500 us, '0' after 26700 us, -- bit 24	1
			'1' after 27500 us, '0' after 27600 us, -- bit 25
			'1' after 28500 us, '0' after 28600 us, -- bit 26
			'1' after 29500 us, '0' after 29700 us, -- bit 27	1
			'1' after 30500 us, '0' after 30600 us, -- bit 28
			'1' after 31500 us, '0' after 31700 us, -- bit 29	1
			'1' after 32500 us, '0' after 32600 us, -- bit 30
			'1' after 33500 us, '0' after 33600 us, -- bit 31
			'1' after 34500 us, '0' after 34600 us, -- bit 32
			'1' after 35500 us, '0' after 35700 us, -- bit 33	1
			'1' after 36500 us, '0' after 36600 us, -- bit 34
			'1' after 37500 us, '0' after 37600 us, -- bit 35
			'1' after 38500 us, '0' after 38600 us, -- bit 36
			'1' after 39500 us, '0' after 39600 us, -- bit 37
			'1' after 40500 us, '0' after 40600 us, -- bit 38
			'1' after 41500 us, '0' after 41700 us, -- bit 39	1
			'1' after 42500 us, '0' after 42600 us, -- bit 40
			'1' after 43500 us, '0' after 43600 us, -- bit 41
			'1' after 44500 us, '0' after 44700 us, -- bit 42	1
			'1' after 45500 us, '0' after 45600 us, -- bit 43
			'1' after 46500 us, '0' after 46600 us, -- bit 44
			'1' after 47500 us, '0' after 47600 us, -- bit 45
			'1' after 48500 us, '0' after 48700 us, -- bit 46	1
			'1' after 49500 us, '0' after 49600 us, -- bit 47
			'1' after 50500 us, '0' after 50600 us, -- bit 48
			'1' after 51500 us, '0' after 51700 us, -- bit 49	1
			'1' after 52500 us, '0' after 52600 us, -- bit 50
			'1' after 53500 us, '0' after 53600 us, -- bit 51
			'1' after 54500 us, '0' after 54700 us, -- bit 52	1
			'1' after 55500 us, '0' after 55600 us, -- bit 53
			'1' after 56500 us, '0' after 56700 us, -- bit 54	1
			'1' after 57500 us, '0' after 57600 us, -- bit 55
			'1' after 58500 us, '0' after 58600 us, -- bit 56
			'1' after 59500 us, '0' after 59600 us, -- bit 57
			'1' after 60500 us, '0' after 60600 us, -- bit 58
			'1' after 62500 us, '0' after 62600 us; -- bit 59 & bit 0
	snooze <=		'0' after     0 ms, '1' after  1300 ms;	
	knoppen <=		"0000" after  0 ms,
			"0001" after  1 ms, -- menu
			"0000" after  2 ms,
			"0100" after  3 ms, -- up
			"0000" after  4 ms,
			"0010" after  5 ms, -- set
			"0000" after  6 ms,
			"0100" after  7 ms, -- up
			"0000" after  8 ms,
			"0010" after  9 ms, -- set
			"0000" after 10 ms,
			"0001" after 11 ms, -- menu
			"0000" after 12 ms,
			"0010" after 13 ms, -- set
			"0000" after 14 ms,
			"0001" after 15 ms, -- menu
			"0000" after 16 ms,
			"0010" after 17 ms, -- set
			"0000" after 18 ms,
			"0100" after 19 ms, -- up
			"0000" after 20 ms,
			"0100" after 21 ms, -- up
			"0000" after 22 ms,
			"0100" after 23 ms, -- up
			"0000" after 24 ms,
			"0100" after 25 ms, -- up
			"0000" after 26 ms,
			"0100" after 27 ms, -- up
			"0000" after 28 ms,
			"0100" after 29 ms, -- up
			"0000" after 30 ms,
			"0100" after 31 ms, -- up
			"0000" after 32 ms,
			"0100" after 33 ms, -- up
			"0000" after 34 ms,
			"0100" after 35 ms, -- up
			"0000" after 36 ms,
			"0100" after 37 ms, -- up
			"0000" after 38 ms,
			"0100" after 39 ms, -- up
			"0000" after 40 ms,
			"0100" after 41 ms, -- up
			"0000" after 42 ms,
			"0010" after 43 ms, -- set
			"0000" after 44 ms,
			"0100" after 45 ms, -- up
			"0000" after 46 ms,
			"0100" after 47 ms, -- up
			"0000" after 48 ms,
			"0100" after 49 ms, -- up
			"0000" after 50 ms,
			"0100" after 51 ms,	-- up
			"0000" after 52 ms,
			"0100" after 53 ms, -- up
			"0000" after 54 ms,
			"0100" after 55 ms, -- up
			"0000" after 56 ms,
			"1000" after 57 ms, -- down
			"0000" after 58 ms,
			"0010" after 59 ms, -- set
			"0000" after 60 ms,
			"0001" after 61 ms, -- menu
			"0000" after 62 ms,
			"1000" after 63 ms, -- down
			"0000" after 64 ms,
			"1000" after 65 ms, -- down
			"0000" after 66 ms,
			"0010" after 67 ms, -- set
			"0000" after 68 ms,
			"0010" after 69 ms, -- set
			"0000" after 70 ms,
			"0001" after 71 ms, -- menu
			"0000" after 72 ms;
	schakelaars <=   "000" after  0 ms;

	wake_up_now: wake_up port map(xi, xo, reset, dcf_in, snooze, knoppen, schakelaars, debug_out, data_out, clk_out, buzzer, led_lamp);

end architecture;








