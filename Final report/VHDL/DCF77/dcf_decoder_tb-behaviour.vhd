-- Alex Oudsen, 4325494
-- Dit is testbench voor simulatie op schaal
-- De verwachte respons bestaat uit een led-signaal wat
-- afhankelijk is van de kwaliteit van het DCF77 signaal
-- Verder dient bij het begin van een nieuwe minuut start_xor
-- even hoog te worden; op dit moment moet het volgende aan de
-- uitgangen staan: maandag 8 december, 11:48
-- Advies simulatietijd: 70 ms.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

architecture behaviour of dcf_decoder_tb is
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
	clk		<=	'0' after 0 ns,		-- Dit genereert een 32 MHz signaal (ongeveer)
				'1' after 313 ns  when clk /= '1' else '0' after 313 ns;
	reset		<=	'1' after 0 ns, '0' after 50 ns;
	count		<=	"0000110010000000" after 0 ns,
				"0001100100000000" after 18 ms,
				"0000110010000000" after 19 ms,
				"0001100100000000" after 20 ms,
				"0000110010000000" after 21 ms,
				"0001100100000000" after 24 ms,
				"0000110010000000" after 25 ms,
				"0001100100000000" after 27 ms,
				"0000110010000000" after 30 ms,
				"0001100100000000" after 33 ms,
				"0000110010000000" after 34 ms,
				"0001100100000000" after 35 ms,
				"0000110010000000" after 36 ms,
				"0001100100000000" after 39 ms,
				"0000110010000000" after 40 ms,
				"0001100100000000" after 42 ms,
				"0000110010000000" after 43 ms,
				"0001100100000000" after 46 ms,
				"0000110010000000" after 47 ms,
				"0001100100000000" after 49 ms,
				"0000110010000000" after 50 ms,
				"0001100100000000" after 52 ms,
				"0000110010000000" after 53 ms,
				"0001100100000000" after 54 ms,
				"0000110010000000" after 55 ms,
				"0001100100000000" after 58 ms,
				"1001110001000000" after 59 ms,
				"0000110010000000" after 60 ms,
				"1001110001000000" after 61 ms;
	new_bit		<=	'0' after 0 ns,
				'1' after 500000 ns, '0' after 500800 ns,
				'1' after 1600000 ns, '0' after 1600800 ns,
				'1' after 2600000 ns, '0' after 2600800 ns,
				'1' after 3600000 ns, '0' after 3600800 ns,
				'1' after 4600000 ns, '0' after 4600800 ns,
				'1' after 5600000 ns, '0' after 5600800 ns,
				'1' after 6600000 ns, '0' after 6600800 ns,
				'1' after 7600000 ns, '0' after 7600800 ns,
				'1' after 8600000 ns, '0' after 8600800 ns,
				'1' after 9600000 ns, '0' after 9600800 ns,
				'1' after 10600000 ns, '0' after 10600800 ns,
				'1' after 11600000 ns, '0' after 11600800 ns,
				'1' after 12600000 ns, '0' after 12600800 ns,
				'1' after 13600000 ns, '0' after 13600800 ns,
				'1' after 14600000 ns, '0' after 14600800 ns,
				'1' after 15600000 ns, '0' after 15600800 ns,
				'1' after 16600000 ns, '0' after 16600800 ns,
				'1' after 17600000 ns, '0' after 17600800 ns,
				'1' after 18700000 ns, '0' after 18700800 ns,
				'1' after 19600000 ns, '0' after 19600800 ns,
				'1' after 20700000 ns, '0' after 20700800 ns,
				'1' after 21600000 ns, '0' after 21600800 ns,
				'1' after 22600000 ns, '0' after 22600800 ns,
				'1' after 23600000 ns, '0' after 23600800 ns,
				'1' after 24700000 ns, '0' after 24700800 ns,
				'1' after 25600000 ns, '0' after 25600800 ns,
				'1' after 26600000 ns, '0' after 26600800 ns,
				'1' after 27700000 ns, '0' after 27700800 ns,
				'1' after 28700000 ns, '0' after 28700800 ns,
				'1' after 29700000 ns, '0' after 29700800 ns,
				'1' after 30600000 ns, '0' after 30600800 ns,
				'1' after 31600000 ns, '0' after 31600800 ns,
				'1' after 32600000 ns, '0' after 32600800 ns,
				'1' after 33700000 ns, '0' after 33700800 ns,
				'1' after 34600000 ns, '0' after 34600800 ns,
				'1' after 35700000 ns, '0' after 35700800 ns,
				'1' after 36600000 ns, '0' after 36600800 ns,
				'1' after 37600000 ns, '0' after 37600800 ns,
				'1' after 38600000 ns, '0' after 38600800 ns,
				'1' after 39700000 ns, '0' after 39700800 ns,
				'1' after 40600000 ns, '0' after 40600800 ns,
				'1' after 41600000 ns, '0' after 41600800 ns,
				'1' after 42700000 ns, '0' after 42700800 ns,
				'1' after 43600000 ns, '0' after 43600800 ns,
				'1' after 44600000 ns, '0' after 44600800 ns,
				'1' after 45600000 ns, '0' after 45600800 ns,
				'1' after 46700000 ns, '0' after 46700800 ns,
				'1' after 47600000 ns, '0' after 47600800 ns,
				'1' after 48600000 ns, '0' after 48600800 ns,
				'1' after 49700000 ns, '0' after 49700800 ns,
				'1' after 50600000 ns, '0' after 50600800 ns,
				'1' after 51600000 ns, '0' after 51600800 ns,
				'1' after 52700000 ns, '0' after 52700800 ns,
				'1' after 53600000 ns, '0' after 53600800 ns,
				'1' after 54700000 ns, '0' after 54700800 ns,
				'1' after 55600000 ns, '0' after 55600800 ns,
				'1' after 56600000 ns, '0' after 56600800 ns,
				'1' after 57600000 ns, '0' after 57600800 ns,
				'1' after 58700000 ns, '0' after 58700800 ns,
				'1' after 60600000 ns, '0' after 60600800 ns;

	decode: dcf_decoder port map(clk, reset, count, new_bit, dcf_led, start_xor, min, hr, wk, dag, mnd, jr, pb);

end behaviour;