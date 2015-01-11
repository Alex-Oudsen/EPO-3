-- Alex Oudsen, 4325494
-- Dit is testbench van de simulatie op schaal
-- De verwachte respons bestaat uit 59 achtereenvolgende
-- new_bit pulsen, gevold door een pauze en nog 1 next_bit puls
-- Bovendien dient de waarde count aan te uitgang te verschijnen,
-- omdat hier buiten dit blok nog verder mee gewerkt wordt
-- Advies simulatietijd: 75 ms.

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
	clk		<=	'1' after 0 ns,	-- De frequentie van dit signaal is iets meer dan 32 MHz
				'0' after 15 ns  when clk /= '0' else '1' after 15 ns;
	reset		<=	'1' after 0 ns, '0' after 50 ns;
	dcf_rise	<=	'0' after 0 ns,
				'1' after 400 us, '0' after 401 us,
				'1' after 1500 us, '0' after 1501 us,
				'1' after 2500 us, '0' after 2501 us,
				'1' after 3500 us, '0' after 3501 us,
				'1' after 4500 us, '0' after 4501 us,
				'1' after 5500 us, '0' after 5501 us,
				'1' after 6500 us, '0' after 6501 us,
				'1' after 7500 us, '0' after 7501 us,
				'1' after 8500 us, '0' after 8501 us,
				'1' after 9500 us, '0' after 9501 us,
				'1' after 10500 us, '0' after 10501 us,
				'1' after 11500 us, '0' after 11501 us,
				'1' after 12500 us, '0' after 12501 us,
				'1' after 13500 us, '0' after 13501 us,
				'1' after 14500 us, '0' after 14501 us,
				'1' after 15500 us, '0' after 15501 us,
				'1' after 16500 us, '0' after 16501 us,
				'1' after 17500 us, '0' after 17501 us,
				'1' after 18500 us, '0' after 18501 us,
				'1' after 19500 us, '0' after 19501 us,
				'1' after 20500 us, '0' after 20501 us,
				'1' after 21500 us, '0' after 21501 us,
				'1' after 22500 us, '0' after 22501 us,
				'1' after 23500 us, '0' after 23501 us,
				'1' after 24500 us, '0' after 24501 us,
				'1' after 25500 us, '0' after 25501 us,
				'1' after 26500 us, '0' after 26501 us,
				'1' after 27500 us, '0' after 27501 us,
				'1' after 28500 us, '0' after 28501 us,
				'1' after 29500 us, '0' after 29501 us,
				'1' after 30500 us, '0' after 30501 us,
				'1' after 31500 us, '0' after 31501 us,
				'1' after 32500 us, '0' after 32501 us,
				'1' after 33500 us, '0' after 33501 us,
				'1' after 34500 us, '0' after 34501 us,
				'1' after 35500 us, '0' after 35501 us,
				'1' after 36500 us, '0' after 36501 us,
				'1' after 37500 us, '0' after 37501 us,
				'1' after 38500 us, '0' after 38501 us,
				'1' after 39500 us, '0' after 39501 us,
				'1' after 40500 us, '0' after 40501 us,
				'1' after 41500 us, '0' after 41501 us,
				'1' after 42500 us, '0' after 42501 us,
				'1' after 43500 us, '0' after 43501 us,
				'1' after 44500 us, '0' after 44501 us,
				'1' after 45500 us, '0' after 45501 us,
				'1' after 46500 us, '0' after 46501 us,
				'1' after 47500 us, '0' after 47501 us,
				'1' after 48500 us, '0' after 48501 us,
				'1' after 49500 us, '0' after 49501 us,
				'1' after 50500 us, '0' after 50501 us,
				'1' after 51500 us, '0' after 51501 us,
				'1' after 52500 us, '0' after 52501 us,
				'1' after 53500 us, '0' after 53501 us,
				'1' after 54500 us, '0' after 54501 us,
				'1' after 55500 us, '0' after 55501 us,
				'1' after 56500 us, '0' after 56501 us,
				'1' after 57500 us, '0' after 57501 us,
				'1' after 58500 us, '0' after 58501 us,
				'1' after 60500 us, '0' after 60501 us;
	dcf_fall	<=	'0' after 0 ns,
				'1' after 500 us, '0' after 501 us,
				'1' after 1600 us, '0' after 1601 us,
				'1' after 2600 us, '0' after 2601 us,
				'1' after 3600 us, '0' after 3601 us,
				'1' after 4600 us, '0' after 4601 us,
				'1' after 5600 us, '0' after 5601 us,
				'1' after 6600 us, '0' after 6601 us,
				'1' after 7600 us, '0' after 7601 us,
				'1' after 8600 us, '0' after 8601 us,
				'1' after 9600 us, '0' after 9601 us,
				'1' after 10600 us, '0' after 10601 us,
				'1' after 11600 us, '0' after 11601 us,
				'1' after 12600 us, '0' after 12601 us,
				'1' after 13600 us, '0' after 13601 us,
				'1' after 14600 us, '0' after 14601 us,
				'1' after 15600 us, '0' after 15601 us,
				'1' after 16600 us, '0' after 16601 us,
				'1' after 17600 us, '0' after 17601 us,
				'1' after 18700 us, '0' after 18701 us,
				'1' after 19600 us, '0' after 19601 us,
				'1' after 20700 us, '0' after 20701 us,
				'1' after 21600 us, '0' after 21601 us,
				'1' after 22600 us, '0' after 22601 us,
				'1' after 23600 us, '0' after 23601 us,
				'1' after 24700 us, '0' after 24701 us,
				'1' after 25600 us, '0' after 25601 us,
				'1' after 26600 us, '0' after 26601 us,
				'1' after 27700 us, '0' after 27701 us,
				'1' after 28700 us, '0' after 28701 us,
				'1' after 29700 us, '0' after 29701 us,
				'1' after 30600 us, '0' after 30601 us,
				'1' after 31600 us, '0' after 31601 us,
				'1' after 32600 us, '0' after 32601 us,
				'1' after 33700 us, '0' after 33701 us,
				'1' after 34600 us, '0' after 34601 us,
				'1' after 35700 us, '0' after 35701 us,
				'1' after 36600 us, '0' after 36601 us,
				'1' after 37600 us, '0' after 37601 us,
				'1' after 38600 us, '0' after 38601 us,
				'1' after 39700 us, '0' after 39701 us,
				'1' after 40600 us, '0' after 40601 us,
				'1' after 41600 us, '0' after 41601 us,
				'1' after 42700 us, '0' after 42701 us,
				'1' after 43600 us, '0' after 43601 us,
				'1' after 44600 us, '0' after 44601 us,
				'1' after 45600 us, '0' after 45601 us,
				'1' after 46700 us, '0' after 46701 us,
				'1' after 47600 us, '0' after 47601 us,
				'1' after 48600 us, '0' after 48601 us,
				'1' after 49700 us, '0' after 49701 us,
				'1' after 50600 us, '0' after 50601 us,
				'1' after 51600 us, '0' after 51601 us,
				'1' after 52700 us, '0' after 52701 us,
				'1' after 53600 us, '0' after 53601 us,
				'1' after 54700 us, '0' after 54701 us,
				'1' after 55600 us, '0' after 55601 us,
				'1' after 56600 us, '0' after 56601 us,
				'1' after 57600 us, '0' after 57601 us,
				'1' after 58700 us, '0' after 58701 us,
				'1' after 60600 us, '0' after 60601 us;

	dcf_count: dcf_counter port map(clk, reset, dcf_rise, dcf_fall, count, new_bit);

end behaviour;
