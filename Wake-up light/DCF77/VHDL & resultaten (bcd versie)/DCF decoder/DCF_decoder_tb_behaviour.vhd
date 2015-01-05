-- Alex Oudsen, 4325494
-- Dit is testbench voor simulatie met de 'echte' klok
-- De verwachte respons bestaat uit een led-signaal wat
-- afhankelijk is van de kwaliteit van het DCF77 signaal
-- Verder dient bij het begin van een nieuwe minuut start_xor
-- even hoog te worden; op dit moment moet het volgende aan de
-- uitgangen staan: maandag 8 december, 11:48 --> wordt 11:49
-- Advies simulatietijd: 125 sec.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour_long of dcf_decoder_tb is
	component dcf_decoder is
   		port(clk	:in  std_logic;
		     reset	:in  std_logic;
		     count	:in  std_logic_vector(15 downto 0);
		     new_bit	:in  std_logic;
		     dcf_led	:out std_logic;
		     start_xor	:out std_logic;
		     minuten	:out std_logic_vector(6 downto 0);
		     uren	:out std_logic_vector(5 downto 0);
		     weekdag	:out std_logic_vector(2 downto 0);
		     dagen	:out std_logic_vector(5 downto 0);
		     maanden	:out std_logic_vector(4 downto 0);
		     jaren	:out std_logic_vector(7 downto 0);
		     parity_bits:out std_logic_vector(2 downto 0));
	end component dcf_decoder;

signal clk, reset, new_bit, dcf_led, start_xor: std_logic;
signal count: std_logic_vector(15 downto 0);
signal jr: std_logic_vector(7 downto 0);
signal min: std_logic_vector(6 downto 0);
signal hr, dag: std_logic_vector(5 downto 0);
signal mnd: std_logic_vector(4 downto 0);
signal wk, pb: std_logic_vector(2 downto 0);

begin

	clk		<=	'0' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'1' after 15625 ns  when clk /= '1' else '0' after 15625 ns;
	reset		<=	'1' after 0 ns, '0' after 50 us;
	count		<=	"0000110010000000" after 0 ns,
				"0001100100000000" after 18 sec,
				"0000110010000000" after 19 sec,
				"0001100100000000" after 20 sec,
				"0000110010000000" after 21 sec,
				"0001100100000000" after 24 sec,
				"0000110010000000" after 25 sec,
				"0001100100000000" after 27 sec,
				"0000110010000000" after 30 sec,
				"0001100100000000" after 33 sec,
				"0000110010000000" after 34 sec,
				"0001100100000000" after 35 sec,
				"0000110010000000" after 36 sec,
				"0001100100000000" after 39 sec,
				"0000110010000000" after 40 sec,
				"0001100100000000" after 42 sec,
				"0000110010000000" after 43 sec,
				"0001100100000000" after 46 sec,
				"0000110010000000" after 47 sec,
				"0001100100000000" after 49 sec,
				"0000110010000000" after 50 sec,
				"0001100100000000" after 52 sec,
				"0000110010000000" after 53 sec,
				"0001100100000000" after 54 sec,
				"0000110010000000" after 55 sec,
				"0001100100000000" after 58 sec,
				"1001110001000000" after 59 sec,
				"0000110010000000" after 60 sec,
				"0001100100000000" after 78 sec,
				"0000110010000000" after 79 sec,
				"0001100100000000" after 80 sec,
				"0000110010000000" after 82 sec,
				"0001100100000000" after 84 sec,
				"0000110010000000" after 85 sec,
				"0001100100000000" after 87 sec,
				"0000110010000000" after 88 sec,
				"0001100100000000" after 89 sec,
				"0000110010000000" after 90 sec,
				"0001100100000000" after 93 sec,
				"0000110010000000" after 94 sec,
				"0001100100000000" after 95 sec,
				"0000110010000000" after 96 sec,
				"0001100100000000" after 99 sec,
				"0000110010000000" after 100 sec,
				"0001100100000000" after 102 sec,
				"0000110010000000" after 103 sec,
				"0001100100000000" after 106 sec,
				"0000110010000000" after 107 sec,
				"0001100100000000" after 109 sec,
				"0000110010000000" after 110 sec,
				"0001100100000000" after 112 sec,
				"0000110010000000" after 113 sec,
				"0001100100000000" after 114 sec,
				"0000110010000000" after 115 sec,
				"0001100100000000" after 118 sec,
				"1001110001000000" after 119 sec,
				"0000110010000000" after 120 sec,
				"1001110001000000" after 121 sec;
	new_bit		<=	'0' after 0 ns,
				'1' after 500000 us, '0' after 500020 us,
				'1' after 1600000 us, '0' after 1600020 us,
				'1' after 2600000 us, '0' after 2600020 us,
				'1' after 3600000 us, '0' after 3600020 us,
				'1' after 4600000 us, '0' after 4600020 us,
				'1' after 5600000 us, '0' after 5600020 us,
				'1' after 6600000 us, '0' after 6600020 us,
				'1' after 7600000 us, '0' after 7600020 us,
				'1' after 8600000 us, '0' after 8600020 us,
				'1' after 9600000 us, '0' after 9600020 us,
				'1' after 10600000 us, '0' after 10600020 us,
				'1' after 11600000 us, '0' after 11600020 us,
				'1' after 12600000 us, '0' after 12600020 us,
				'1' after 13600000 us, '0' after 13600020 us,
				'1' after 14600000 us, '0' after 14600020 us,
				'1' after 15600000 us, '0' after 15600020 us,
				'1' after 16600000 us, '0' after 16600020 us,
				'1' after 17600000 us, '0' after 17600020 us,
				'1' after 18700000 us, '0' after 18700020 us,
				'1' after 19600000 us, '0' after 19600020 us,
				'1' after 20700000 us, '0' after 20700020 us,
				'1' after 21600000 us, '0' after 21600020 us,
				'1' after 22600000 us, '0' after 22600020 us,
				'1' after 23600000 us, '0' after 23600020 us,
				'1' after 24700000 us, '0' after 24700020 us,
				'1' after 25600000 us, '0' after 25600020 us,
				'1' after 26600000 us, '0' after 26600020 us,
				'1' after 27700000 us, '0' after 27700020 us,
				'1' after 28700000 us, '0' after 28700020 us,
				'1' after 29700000 us, '0' after 29700020 us,
				'1' after 30600000 us, '0' after 30600020 us,
				'1' after 31600000 us, '0' after 31600020 us,
				'1' after 32600000 us, '0' after 32600020 us,
				'1' after 33700000 us, '0' after 33700020 us,
				'1' after 34600000 us, '0' after 34600020 us,
				'1' after 35700000 us, '0' after 35700020 us,
				'1' after 36600000 us, '0' after 36600020 us,
				'1' after 37600000 us, '0' after 37600020 us,
				'1' after 38600000 us, '0' after 38600020 us,
				'1' after 39700000 us, '0' after 39700020 us,
				'1' after 40600000 us, '0' after 40600020 us,
				'1' after 41600000 us, '0' after 41600020 us,
				'1' after 42700000 us, '0' after 42700020 us,
				'1' after 43600000 us, '0' after 43600020 us,
				'1' after 44600000 us, '0' after 44600020 us,
				'1' after 45600000 us, '0' after 45600020 us,
				'1' after 46700000 us, '0' after 46700020 us,
				'1' after 47600000 us, '0' after 47600020 us,
				'1' after 48600000 us, '0' after 48600020 us,
				'1' after 49700000 us, '0' after 49700020 us,
				'1' after 50600000 us, '0' after 50600020 us,
				'1' after 51600000 us, '0' after 51600020 us,
				'1' after 52700000 us, '0' after 52700020 us,
				'1' after 53600000 us, '0' after 53600020 us,
				'1' after 54700000 us, '0' after 54700020 us,
				'1' after 55600000 us, '0' after 55600020 us,
				'1' after 56600000 us, '0' after 56600020 us,
				'1' after 57600000 us, '0' after 57600020 us,
				'1' after 58700000 us, '0' after 58700020 us,
				'1' after 60600000 us, '0' after 60600020 us,
				'1' after 61600000 us, '0' after 61600020 us,
				'1' after 62600000 us, '0' after 62600020 us,
				'1' after 63600000 us, '0' after 63600020 us,
				'1' after 64600000 us, '0' after 64600020 us,
				'1' after 65600000 us, '0' after 65600020 us,
				'1' after 66600000 us, '0' after 66600020 us,
				'1' after 67600000 us, '0' after 67600020 us,
				'1' after 68600000 us, '0' after 68600020 us,
				'1' after 69600000 us, '0' after 69600020 us,
				'1' after 70600000 us, '0' after 70600020 us,
				'1' after 71600000 us, '0' after 71600020 us,
				'1' after 72600000 us, '0' after 72600020 us,
				'1' after 73600000 us, '0' after 73600020 us,
				'1' after 74600000 us, '0' after 74600020 us,
				'1' after 75600000 us, '0' after 75600020 us,
				'1' after 76600000 us, '0' after 76600020 us,
				'1' after 77600000 us, '0' after 77600020 us,
				'1' after 78700000 us, '0' after 78700020 us,
				'1' after 79600000 us, '0' after 79600020 us,
				'1' after 80700000 us, '0' after 80700020 us,
				'1' after 81700000 us, '0' after 81700020 us,
				'1' after 82600000 us, '0' after 82600020 us,
				'1' after 83600000 us, '0' after 83600020 us,
				'1' after 84700000 us, '0' after 84700020 us,
				'1' after 85600000 us, '0' after 85600020 us,
				'1' after 86600000 us, '0' after 86600020 us,
				'1' after 87700000 us, '0' after 87700020 us,
				'1' after 88600000 us, '0' after 88600020 us,
				'1' after 89700000 us, '0' after 89700020 us,
				'1' after 90600000 us, '0' after 90600020 us,
				'1' after 91600000 us, '0' after 91600020 us,
				'1' after 92600000 us, '0' after 92600020 us,
				'1' after 93700000 us, '0' after 93700020 us,
				'1' after 94600000 us, '0' after 94600020 us,
				'1' after 95700000 us, '0' after 95700020 us,
				'1' after 96600000 us, '0' after 96600020 us,
				'1' after 97600000 us, '0' after 97600020 us,
				'1' after 98600000 us, '0' after 98600020 us,
				'1' after 99700000 us, '0' after 99700020 us,
				'1' after 100600000 us, '0' after 100600020 us,
				'1' after 101600000 us, '0' after 101600020 us,
				'1' after 102700000 us, '0' after 102700020 us,
				'1' after 103600000 us, '0' after 103600020 us,
				'1' after 104600000 us, '0' after 104600020 us,
				'1' after 105600000 us, '0' after 105600020 us,
				'1' after 106700000 us, '0' after 106700020 us,
				'1' after 107600000 us, '0' after 107600020 us,
				'1' after 108600000 us, '0' after 108600020 us,
				'1' after 109700000 us, '0' after 109700020 us,
				'1' after 110600000 us, '0' after 110600020 us,
				'1' after 111600000 us, '0' after 111600020 us,
				'1' after 112700000 us, '0' after 112700020 us,
				'1' after 113600000 us, '0' after 113600020 us,
				'1' after 114700000 us, '0' after 114700020 us,
				'1' after 115600000 us, '0' after 115600020 us,
				'1' after 116600000 us, '0' after 116600020 us,
				'1' after 117600000 us, '0' after 117600020 us,
				'1' after 118700000 us, '0' after 118700020 us,
				'1' after 120600000 us, '0' after 120600020 us;

	decode: dcf_decoder port map(clk, reset, count, new_bit, dcf_led, start_xor, min, hr, wk, dag, mnd, jr, pb);

end behaviour_long;