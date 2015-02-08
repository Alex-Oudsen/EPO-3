library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of wake_up_tb is

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
	signal knoppen:	std_logic_vector (3 downto 0);
	signal data_out: std_logic_vector(6 downto 0);

begin
	xi	<=	'1' after 0 ms,
			'0' after 15625 ns when xi /= '0' else '1' after 15625 ns;
	reset	<=	'1' after 0 ms,
			'0' after 50 ms;			
	dcf_in	<=	'0' after     0 ms,
			'1' after   500 ms, '0' after   600 ms, -- bit 58
			'1' after  2500 ms, '0' after  2600 ms, -- bit 59 & bit 0
			'1' after  3500 ms, '0' after  3600 ms, -- bit 1
			'1' after  4500 ms, '0' after  4600 ms, -- bit 2
			'1' after  5500 ms, '0' after  5600 ms, -- bit 3
			'1' after  6500 ms, '0' after  6600 ms, -- bit 4
			'1' after  7500 ms, '0' after  7600 ms, -- bit 5
			'1' after  8500 ms, '0' after  8600 ms, -- bit 6
			'1' after  9500 ms, '0' after  9600 ms, -- bit 7
			'1' after 10500 ms, '0' after 10600 ms, -- bit 8
			'1' after 11500 ms, '0' after 11600 ms, -- bit 9
			'1' after 12500 ms, '0' after 12600 ms, -- bit 10
			'1' after 13500 ms, '0' after 13600 ms, -- bit 11
			'1' after 14500 ms, '0' after 14600 ms, -- bit 12
			'1' after 15500 ms, '0' after 15600 ms, -- bit 13
			'1' after 16500 ms, '0' after 16600 ms, -- bit 14
			'1' after 17500 ms, '0' after 17600 ms, -- bit 15
			'1' after 18500 ms, '0' after 18600 ms, -- bit 16
			'1' after 19500 ms, '0' after 19600 ms, -- bit 17
			'1' after 20500 ms, '0' after 20700 ms, -- bit 18	1
			'1' after 21500 ms, '0' after 21600 ms, -- bit 19
			'1' after 22500 ms, '0' after 22700 ms, -- bit 20	1
			'1' after 23500 ms, '0' after 23600 ms, -- bit 21
			'1' after 24500 ms, '0' after 24600 ms, -- bit 22
			'1' after 25500 ms, '0' after 25600 ms, -- bit 23
			'1' after 26500 ms, '0' after 26700 ms, -- bit 24	1
			'1' after 27500 ms, '0' after 27600 ms, -- bit 25
			'1' after 28500 ms, '0' after 28600 ms, -- bit 26
			'1' after 29500 ms, '0' after 29700 ms, -- bit 27	1
			'1' after 30500 ms, '0' after 30600 ms, -- bit 28
			'1' after 31500 ms, '0' after 31700 ms, -- bit 29	1
			'1' after 32500 ms, '0' after 32600 ms, -- bit 30
			'1' after 33500 ms, '0' after 33600 ms, -- bit 31
			'1' after 34500 ms, '0' after 34600 ms, -- bit 32
			'1' after 35500 ms, '0' after 35700 ms, -- bit 33	1
			'1' after 36500 ms, '0' after 36600 ms, -- bit 34
			'1' after 37500 ms, '0' after 37600 ms, -- bit 35
			'1' after 38500 ms, '0' after 38600 ms, -- bit 36
			'1' after 39500 ms, '0' after 39600 ms, -- bit 37
			'1' after 40500 ms, '0' after 40600 ms, -- bit 38
			'1' after 41500 ms, '0' after 41700 ms, -- bit 39	1
			'1' after 42500 ms, '0' after 42600 ms, -- bit 40
			'1' after 43500 ms, '0' after 43600 ms, -- bit 41
			'1' after 44500 ms, '0' after 44700 ms, -- bit 42	1
			'1' after 45500 ms, '0' after 45600 ms, -- bit 43
			'1' after 46500 ms, '0' after 46600 ms, -- bit 44
			'1' after 47500 ms, '0' after 47600 ms, -- bit 45
			'1' after 48500 ms, '0' after 48700 ms, -- bit 46	1
			'1' after 49500 ms, '0' after 49600 ms, -- bit 47
			'1' after 50500 ms, '0' after 50600 ms, -- bit 48
			'1' after 51500 ms, '0' after 51700 ms, -- bit 49	1
			'1' after 52500 ms, '0' after 52600 ms, -- bit 50
			'1' after 53500 ms, '0' after 53600 ms, -- bit 51
			'1' after 54500 ms, '0' after 54700 ms, -- bit 52	1
			'1' after 55500 ms, '0' after 55600 ms, -- bit 53
			'1' after 56500 ms, '0' after 56700 ms, -- bit 54	1
			'1' after 57500 ms, '0' after 57600 ms, -- bit 55
			'1' after 58500 ms, '0' after 58600 ms, -- bit 56
			'1' after 59500 ms, '0' after 59600 ms, -- bit 57
			'1' after 60500 ms, '0' after 60600 ms, -- bit 58
			'1' after 62500 ms, '0' after 62600 ms; -- bit 59 & bit 0
	snooze <=		'0' after 0 ns, '1' after 1300 sec;	
	knoppen <=		"0000" after  0 sec,
			"0001" after  1 sec, -- menu
			"0000" after  2 sec,
			"0100" after  3 sec, -- up
			"0000" after  4 sec,
			"0010" after  5 sec, -- set
			"0000" after  6 sec,
			"0100" after  7 sec, -- up
			"0000" after  8 sec,
			"0010" after  9 sec, -- set
			"0000" after 10 sec,
			"0001" after 11 sec, -- menu
			"0000" after 12 sec,
			"0010" after 13 sec, -- set
			"0000" after 14 sec,
			"0001" after 15 sec, -- menu
			"0000" after 16 sec,
			"0010" after 17 sec, -- set
			"0000" after 18 sec,
			"0100" after 19 sec, -- up
			"0000" after 20 sec,
			"0100" after 21 sec, -- up
			"0000" after 22 sec,
			"0100" after 23 sec, -- up
			"0000" after 24 sec,
			"0100" after 25 sec, -- up
			"0000" after 26 sec,
			"0100" after 27 sec, -- up
			"0000" after 28 sec,
			"0100" after 29 sec, -- up
			"0000" after 30 sec,
			"0100" after 31 sec, -- up
			"0000" after 32 sec,
			"0100" after 33 sec, -- up
			"0000" after 34 sec,
			"0100" after 35 sec, -- up
			"0000" after 36 sec,
			"0100" after 37 sec, -- up
			"0000" after 38 sec,
			"0100" after 39 sec, -- up
			"0000" after 40 sec,
			"0100" after 41 sec, -- up
			"0000" after 42 sec,
			"0010" after 43 sec, -- set
			"0000" after 44 sec,
			"0100" after 45 sec, -- up
			"0000" after 46 sec,
			"0100" after 47 sec, -- up
			"0000" after 48 sec,
			"0100" after 49 sec, -- up
			"0000" after 50 sec,
			"0100" after 51 sec,	-- up
			"0000" after 52 sec,
			"0100" after 53 sec, -- up
			"0000" after 54 sec,
			"0100" after 55 sec, -- up
			"0000" after 56 sec,
			"1000" after 57 sec, -- down
			"0000" after 58 sec,
			"0010" after 59 sec, -- set
			"0000" after 60 sec,
			"0001" after 61 sec, -- menu
			"0000" after 62 sec,
			"1000" after 63 sec, -- down
			"0000" after 64 sec,
			"1000" after 65 sec, -- down
			"0000" after 66 sec,
			"0010" after 67 sec, -- set
			"0000" after 68 sec,
			"0010" after 69 sec, -- set
			"0000" after 70 sec,
			"0001" after 71 sec, -- menu
			"0000" after 72 sec;
	schakelaars <=  "000" after   0 sec;

	wake_up_now: wake_up port map(xi, xo, reset, dcf_in, snooze, knoppen, schakelaars, debug_out, data_out, clk_out, buzzer, led_lamp);

end architecture;


