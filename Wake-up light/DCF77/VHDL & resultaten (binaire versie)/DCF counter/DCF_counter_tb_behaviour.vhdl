-- Alex Oudsen, 4325494
-- Dit is testbench voor simulatie met de 'echte' klok
-- De verwachte respons bestaat uit 59 achtereenvolgende
-- new_bit pulsen, gevold door een pauze en nog ��n next_bit puls
-- Bovendien dient de waarde count aan te uitgang te verschijnen,
-- omdat hier buiten dit blok nog verder mee gewerkt wordt
-- Advies simulatietijd: 125 sec.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of dcf_counter_tb is
	component dcf_counter is
 		port (clk:		in  std_logic;
		      reset:    	in  std_logic;
		      dcf_rise:		in  std_logic;
		      dcf_fall:		in  std_logic;
		      count:		out std_logic_vector(15 downto 0);
	  	      new_bit:		out std_logic);
	end component dcf_counter;

	signal clk, reset, dcf_rise, dcf_fall, new_bit: std_logic;
	signal count: std_logic_vector(15 downto 0);

begin

	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	reset		<=	'1' after 0 ns, '0' after 50 us;
	dcf_rise	<=	'0' after 0 ns,
				'1' after 400000 us, '0' after 400050 us,
				'1' after 1500000 us, '0' after 1500050 us,
				'1' after 2500000 us, '0' after 2500050 us,
				'1' after 3500000 us, '0' after 3500050 us,
				'1' after 4500000 us, '0' after 4500050 us,
				'1' after 5500000 us, '0' after 5500050 us,
				'1' after 6500000 us, '0' after 6500050 us,
				'1' after 7500000 us, '0' after 7500050 us,
				'1' after 8500000 us, '0' after 8500050 us,
				'1' after 9500000 us, '0' after 9500050 us,
				'1' after 10500000 us, '0' after 10500050 us,
				'1' after 11500000 us, '0' after 11500050 us,
				'1' after 12500000 us, '0' after 12500050 us,
				'1' after 13500000 us, '0' after 13500050 us,
				'1' after 14500000 us, '0' after 14500050 us,
				'1' after 15500000 us, '0' after 15500050 us,
				'1' after 16500000 us, '0' after 16500050 us,
				'1' after 17500000 us, '0' after 17500050 us,
				'1' after 18500000 us, '0' after 18500050 us,
				'1' after 19500000 us, '0' after 19500050 us,
				'1' after 20500000 us, '0' after 20500050 us,
				'1' after 21500000 us, '0' after 21500050 us,
				'1' after 22500000 us, '0' after 22500050 us,
				'1' after 23500000 us, '0' after 23500050 us,
				'1' after 24500000 us, '0' after 24500050 us,
				'1' after 25500000 us, '0' after 25500050 us,
				'1' after 26500000 us, '0' after 26500050 us,
				'1' after 27500000 us, '0' after 27500050 us,
				'1' after 28500000 us, '0' after 28500050 us,
				'1' after 29500000 us, '0' after 29500050 us,
				'1' after 30500000 us, '0' after 30500050 us,
				'1' after 31500000 us, '0' after 31500050 us,
				'1' after 32500000 us, '0' after 32500050 us,
				'1' after 33500000 us, '0' after 33500050 us,
				'1' after 34500000 us, '0' after 34500050 us,
				'1' after 35500000 us, '0' after 35500050 us,
				'1' after 36500000 us, '0' after 36500050 us,
				'1' after 37500000 us, '0' after 37500050 us,
				'1' after 38500000 us, '0' after 38500050 us,
				'1' after 39500000 us, '0' after 39500050 us,
				'1' after 40500000 us, '0' after 40500050 us,
				'1' after 41500000 us, '0' after 41500050 us,
				'1' after 42500000 us, '0' after 42500050 us,
				'1' after 43500000 us, '0' after 43500050 us,
				'1' after 44500000 us, '0' after 44500050 us,
				'1' after 45500000 us, '0' after 45500050 us,
				'1' after 46500000 us, '0' after 46500050 us,
				'1' after 47500000 us, '0' after 47500050 us,
				'1' after 48500000 us, '0' after 48500050 us,
				'1' after 49500000 us, '0' after 49500050 us,
				'1' after 50500000 us, '0' after 50500050 us,
				'1' after 51500000 us, '0' after 51500050 us,
				'1' after 52500000 us, '0' after 52500050 us,
				'1' after 53500000 us, '0' after 53500050 us,
				'1' after 54500000 us, '0' after 54500050 us,
				'1' after 55500000 us, '0' after 55500050 us,
				'1' after 56500000 us, '0' after 56500050 us,
				'1' after 57500000 us, '0' after 57500050 us,
				'1' after 58500000 us, '0' after 58500050 us,
				'1' after 60500000 us, '0' after 60500050 us,
				'1' after 61500000 us, '0' after 61500050 us,
				'1' after 62500000 us, '0' after 62500050 us,
				'1' after 63500000 us, '0' after 63500050 us,
				'1' after 64500000 us, '0' after 64500050 us,
				'1' after 65500000 us, '0' after 65500050 us,
				'1' after 66500000 us, '0' after 66500050 us,
				'1' after 67500000 us, '0' after 67500050 us,
				'1' after 68500000 us, '0' after 68500050 us,
				'1' after 69500000 us, '0' after 69500050 us,
				'1' after 70500000 us, '0' after 70500050 us,
				'1' after 71500000 us, '0' after 71500050 us,
				'1' after 72500000 us, '0' after 72500050 us,
				'1' after 73500000 us, '0' after 73500050 us,
				'1' after 74500000 us, '0' after 74500050 us,
				'1' after 75500000 us, '0' after 75500050 us,
				'1' after 76500000 us, '0' after 76500050 us,
				'1' after 77500000 us, '0' after 77500050 us,
				'1' after 78500000 us, '0' after 78500050 us,
				'1' after 79500000 us, '0' after 79500050 us,
				'1' after 80500000 us, '0' after 80500050 us,
				'1' after 81500000 us, '0' after 81500050 us,
				'1' after 82500000 us, '0' after 82500050 us,
				'1' after 83500000 us, '0' after 83500050 us,
				'1' after 84500000 us, '0' after 84500050 us,
				'1' after 85500000 us, '0' after 85500050 us,
				'1' after 86500000 us, '0' after 86500050 us,
				'1' after 87500000 us, '0' after 87500050 us,
				'1' after 88500000 us, '0' after 88500050 us,
				'1' after 89500000 us, '0' after 89500050 us,
				'1' after 90500000 us, '0' after 90500050 us,
				'1' after 91500000 us, '0' after 91500050 us,
				'1' after 92500000 us, '0' after 92500050 us,
				'1' after 93500000 us, '0' after 93500050 us,
				'1' after 94500000 us, '0' after 94500050 us,
				'1' after 95500000 us, '0' after 95500050 us,
				'1' after 96500000 us, '0' after 96500050 us,
				'1' after 97500000 us, '0' after 97500050 us,
				'1' after 98500000 us, '0' after 98500050 us,
				'1' after 99500000 us, '0' after 99500050 us,
				'1' after 100500000 us, '0' after 100500050 us,
				'1' after 101500000 us, '0' after 101500050 us,
				'1' after 102500000 us, '0' after 102500050 us,
				'1' after 103500000 us, '0' after 103500050 us,
				'1' after 104500000 us, '0' after 104500050 us,
				'1' after 105500000 us, '0' after 105500050 us,
				'1' after 106500000 us, '0' after 106500050 us,
				'1' after 107500000 us, '0' after 107500050 us,
				'1' after 108500000 us, '0' after 108500050 us,
				'1' after 109500000 us, '0' after 109500050 us,
				'1' after 110500000 us, '0' after 110500050 us,
				'1' after 111500000 us, '0' after 111500050 us,
				'1' after 112500000 us, '0' after 112500050 us,
				'1' after 113500000 us, '0' after 113500050 us,
				'1' after 114500000 us, '0' after 114500050 us,
				'1' after 115500000 us, '0' after 115500050 us,
				'1' after 116500000 us, '0' after 116500050 us,
				'1' after 117500000 us, '0' after 117500050 us,
				'1' after 118500000 us, '0' after 118500050 us,
				'1' after 120500000 us, '0' after 120500050 us;
	dcf_fall	<=	'0' after 0 ns,
				'1' after 500000 us, '0' after 500050 us,
				'1' after 1600000 us, '0' after 1600050 us,
				'1' after 2600000 us, '0' after 2600050 us,
				'1' after 3600000 us, '0' after 3600050 us,
				'1' after 4600000 us, '0' after 4600050 us,
				'1' after 5600000 us, '0' after 5600050 us,
				'1' after 6600000 us, '0' after 6600050 us,
				'1' after 7600000 us, '0' after 7600050 us,
				'1' after 8600000 us, '0' after 8600050 us,
				'1' after 9600000 us, '0' after 9600050 us,
				'1' after 10600000 us, '0' after 10600050 us,
				'1' after 11600000 us, '0' after 11600050 us,
				'1' after 12600000 us, '0' after 12600050 us,
				'1' after 13600000 us, '0' after 13600050 us,
				'1' after 14600000 us, '0' after 14600050 us,
				'1' after 15600000 us, '0' after 15600050 us,
				'1' after 16600000 us, '0' after 16600050 us,
				'1' after 17600000 us, '0' after 17600050 us,
				'1' after 18700000 us, '0' after 18700050 us,
				'1' after 19600000 us, '0' after 19600050 us,
				'1' after 20700000 us, '0' after 20700050 us,
				'1' after 21600000 us, '0' after 21600050 us,
				'1' after 22600000 us, '0' after 22600050 us,
				'1' after 23600000 us, '0' after 23600050 us,
				'1' after 24700000 us, '0' after 24700050 us,
				'1' after 25600000 us, '0' after 25600050 us,
				'1' after 26600000 us, '0' after 26600050 us,
				'1' after 27700000 us, '0' after 27700050 us,
				'1' after 28700000 us, '0' after 28700050 us,
				'1' after 29700000 us, '0' after 29700050 us,
				'1' after 30600000 us, '0' after 30600050 us,
				'1' after 31600000 us, '0' after 31600050 us,
				'1' after 32600000 us, '0' after 32600050 us,
				'1' after 33700000 us, '0' after 33700050 us,
				'1' after 34600000 us, '0' after 34600050 us,
				'1' after 35700000 us, '0' after 35700050 us,
				'1' after 36600000 us, '0' after 36600050 us,
				'1' after 37600000 us, '0' after 37600050 us,
				'1' after 38600000 us, '0' after 38600050 us,
				'1' after 39700000 us, '0' after 39700050 us,
				'1' after 40600000 us, '0' after 40600050 us,
				'1' after 41600000 us, '0' after 41600050 us,
				'1' after 42700000 us, '0' after 42700050 us,
				'1' after 43600000 us, '0' after 43600050 us,
				'1' after 44600000 us, '0' after 44600050 us,
				'1' after 45600000 us, '0' after 45600050 us,
				'1' after 46700000 us, '0' after 46700050 us,
				'1' after 47600000 us, '0' after 47600050 us,
				'1' after 48600000 us, '0' after 48600050 us,
				'1' after 49700000 us, '0' after 49700050 us,
				'1' after 50600000 us, '0' after 50600050 us,
				'1' after 51600000 us, '0' after 51600050 us,
				'1' after 52700000 us, '0' after 52700050 us,
				'1' after 53600000 us, '0' after 53600050 us,
				'1' after 54700000 us, '0' after 54700050 us,
				'1' after 55600000 us, '0' after 55600050 us,
				'1' after 56600000 us, '0' after 56600050 us,
				'1' after 57600000 us, '0' after 57600050 us,
				'1' after 58700000 us, '0' after 58700050 us,
				'1' after 60600000 us, '0' after 60600050 us,
				'1' after 61600000 us, '0' after 61600050 us,
				'1' after 62600000 us, '0' after 62600050 us,
				'1' after 63600000 us, '0' after 63600050 us,
				'1' after 64600000 us, '0' after 64600050 us,
				'1' after 65600000 us, '0' after 65600050 us,
				'1' after 66600000 us, '0' after 66600050 us,
				'1' after 67600000 us, '0' after 67600050 us,
				'1' after 68600000 us, '0' after 68600050 us,
				'1' after 69600000 us, '0' after 69600050 us,
				'1' after 70600000 us, '0' after 70600050 us,
				'1' after 71600000 us, '0' after 71600050 us,
				'1' after 72600000 us, '0' after 72600050 us,
				'1' after 73600000 us, '0' after 73600050 us,
				'1' after 74600000 us, '0' after 74600050 us,
				'1' after 75600000 us, '0' after 75600050 us,
				'1' after 76600000 us, '0' after 76600050 us,
				'1' after 77600000 us, '0' after 77600050 us,
				'1' after 78700000 us, '0' after 78700050 us,
				'1' after 79600000 us, '0' after 79600050 us,
				'1' after 80700000 us, '0' after 80700050 us,
				'1' after 81700000 us, '0' after 81700050 us,
				'1' after 82600000 us, '0' after 82600050 us,
				'1' after 83600000 us, '0' after 83600050 us,
				'1' after 84700000 us, '0' after 84700050 us,
				'1' after 85600000 us, '0' after 85600050 us,
				'1' after 86600000 us, '0' after 86600050 us,
				'1' after 87700000 us, '0' after 87700050 us,
				'1' after 88600000 us, '0' after 88600050 us,
				'1' after 89700000 us, '0' after 89700050 us,
				'1' after 90600000 us, '0' after 90600050 us,
				'1' after 91600000 us, '0' after 91600050 us,
				'1' after 92600000 us, '0' after 92600050 us,
				'1' after 93700000 us, '0' after 93700050 us,
				'1' after 94600000 us, '0' after 94600050 us,
				'1' after 95700000 us, '0' after 95700050 us,
				'1' after 96600000 us, '0' after 96600050 us,
				'1' after 97600000 us, '0' after 97600050 us,
				'1' after 98600000 us, '0' after 98600050 us,
				'1' after 99700000 us, '0' after 99700050 us,
				'1' after 100600000 us, '0' after 100600050 us,
				'1' after 101600000 us, '0' after 101600050 us,
				'1' after 102700000 us, '0' after 102700050 us,
				'1' after 103600000 us, '0' after 103600050 us,
				'1' after 104600000 us, '0' after 104600050 us,
				'1' after 105600000 us, '0' after 105600050 us,
				'1' after 106700000 us, '0' after 106700050 us,
				'1' after 107600000 us, '0' after 107600050 us,
				'1' after 108600000 us, '0' after 108600050 us,
				'1' after 109700000 us, '0' after 109700050 us,
				'1' after 110600000 us, '0' after 110600050 us,
				'1' after 111600000 us, '0' after 111600050 us,
				'1' after 112700000 us, '0' after 112700050 us,
				'1' after 113600000 us, '0' after 113600050 us,
				'1' after 114700000 us, '0' after 114700050 us,
				'1' after 115600000 us, '0' after 115600050 us,
				'1' after 116600000 us, '0' after 116600050 us,
				'1' after 117600000 us, '0' after 117600050 us,
				'1' after 118700000 us, '0' after 118700050 us,
				'1' after 120600000 us, '0' after 120600050 us;

	dcf_count: dcf_counter port map(clk, reset, dcf_rise, dcf_fall, count, new_bit);

end behaviour;