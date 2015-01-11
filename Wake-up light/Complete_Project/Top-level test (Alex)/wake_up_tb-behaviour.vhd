-- Alex Oudsen, 4325494
-- Advies simulatietijd: 70 sec

-- knoppen(0) = menu
-- knoppen(1) = set
-- knoppen(2) = up
-- knoppen(3) = down

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of wake_up_tb is

component wake_up is
	port (clk	:in  std_logic;
	      reset	:in  std_logic;
	      knoppen	:in  std_logic_vector (4 downto 0);
	      dcf_in	:in  std_logic;
	      led_lamp	:out std_logic;
	      buzzer	:out std_logic;
              clk_out   :out std_logic;
	      data_out	:out std_logic_vector(6 downto 0));
end component wake_up;

signal clk, reset, dcf_in, led_lamp, buzzer, clk_out: std_logic;
signal knoppen:	std_logic_vector (4 downto 0);
signal data_out: std_logic_vector(6 downto 0);

begin
	clk	<=	'1' after 0 ms,
			'0' after 15625 ns when clk /= '0' else '1' after 15625 ns;
	reset	<=	'1' after 0 ms,
			'0' after 50 ms;			
	knoppen <=	"00000" after 0 ms,
			"00010" after 500 ms,	--rust -> wekker_toggle	
			"00000" after 1000 ms,	--knoppen(3) = down	
			"00001" after 1500 ms,	--rust -> wekkertijd
			"00000" after 2000 ms,	--knoppen(3) = down
			"00001" after 2500 ms,	--wekkertijd -> rust
			"00000" after 3000 ms,	--knoppen(3) = down
			"00001" after 3500 ms,	--rust -> wekkertijd
			"00000" after 4000 ms,	--knoppen(3) = down
			"00010" after 4500 ms,	--wekkertijd -> uren_set
			"00000" after 5000 ms,	--knoppen(3) = down
			"00100" after 5500 ms,	--uren_set -> uren_plus
			"00000" after 6000 ms,	--knoppen(3) = down
			"11000" after 6500 ms,	--uren_set -> uren_min
			"00000" after 7000 ms,	--uren_min -> uren_set
			"00001" after 7500 ms,	--uren_set -> rust
			"00000" after 8000 ms,	--knoppen(3) = down
			"00001" after 8500 ms,	--rust -> wekkertijd
			"00000" after 9000 ms,	--knoppen(3) = down
			"00010" after 9500 ms,	--wekkertijd -> uren_set
			"00000" after 10000 ms,	--knoppen(3) = down
			"00010" after 10500 ms,	--uren_set -> minuten_set
			"00000" after 11000 ms,	--knoppen(3) = down
			"00100" after 11500 ms,	--minuten_set -> minuten_plus
			"00000" after 12000 ms,	--minuten_plus -> minuten_set
			"01000" after 12500 ms,	--minuten_set -> minuten_min
			"00000" after 13000 ms,	--minuten_min -> minuten_set
			"00001" after 13500 ms,	--minuten_set -> rust
			"00000" after 14000 ms,	--knoppen(3) = down
			"00001" after 14500 ms,	--rust -> wekkertijd
			"00000" after 15000 ms,	--knoppen(3) = down
			"00010" after 15500 ms,	--wekkertijd -> uren_set
			"00000" after 16000 ms,	--knoppen(3) = down
			"00010" after 16500 ms,	--uren_set -> minuten_set
			"00000" after 17000 ms,	--knoppen(3) = down
			"00010" after 17500 ms,	--minuten_set -> rust
			"00000" after 18000 ms,	--knoppen(3) = down
			"00001" after 18500 ms,	--rust -> wekkertijd
			"00000" after 19000 ms,	--knoppen(3) = down
			"01000" after 19500 ms,	--wekkertijd -> led
			"00000" after 20000 ms,	--knoppen(3) = down
			"00001" after 20500 ms,	--led -> rust
			"00000" after 21000 ms,	--knoppen(3) = down
			"00001" after 21500 ms,	--rust -> wekkertijd
			"00000" after 22000 ms,	--knoppen(3) = down
			"00100" after 22500 ms,	--wekkertijd -> geluid
			"00000" after 23000 ms,	--knoppen(3) = down
			"00100" after 23500 ms,	--geluid -> led
			"00000" after 24000 ms,	--knoppen(3) = down
			"00100" after 24500 ms,	--led -> wekkertijd
			"00000" after 25000 ms,	--knoppen(3) = down
			"01000" after 25500 ms,	--wekkertijd -> led
			"00000" after 26000 ms,	--knoppen(3) = down
			"01000" after 26500 ms,	--led -> geluid
			"00000" after 27000 ms,	--knoppen(3) = down
			"01000" after 27500 ms,	--geluid -> wekkertijd
			"00000" after 28000 ms,	--knoppen(3) = down
			"01000" after 28500 ms,	--wekkertijd -> led
			"00000" after 29000 ms,	--knoppen(3) = down
			"00010" after 29500 ms,	--led -> led_toggle
			"00000" after 30000 ms,	--led_toggle -> led
			"01000" after 30500 ms,	--led -> geluid
			"00000" after 31000 ms,	--knoppen(3) = down
			"00010" after 31500 ms,	--geluid -> geluid_toggle
			"00000" after 32000 ms,	--geluid_toggle -> geluid
			"00001" after 32500 ms,	--geluid -> rust
			"00000" after 33000 ms; --done, done, done;			
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
			-- dit genereert een dcf-signaal voor het ontwerp
			-- waarin het volgende gecodeerd is:
			-- DD-MM-JJ: 08-12-'14 & HH:MM: 11:48 & maandag
			-- vervolgens DD-MM-JJ: 08-12-'14 & HH:MM: 11:49 & maandag
			-- Bits 0 t/m 17 zijn 0
			-- Bit 18 is 1
			-- Bit 19 is 0
			-- Bit 20 is 1
			-- Bits 21 t/m 27 zijn de minuten (48)
			-- Bit 28 is parity bit v.d. minuten (0)
			-- Bits 29 t/m 34 zijn de uren (11)
			-- Bit 35 is parity bit v.d. uren (0)
			-- Bits 36 t/m 41 zijn de dagen v.d. maand (8)
			-- Bits 42 t/m 44 zijn de dagen v.d. week (ma)
			-- Bits 45 t/m 49 vormen de maand (12)
			-- Bits 50 t/m 57 vormen het jaar (binnen een eeuw) (14)
			-- Bits 58 is parity bit over bits 36 t/m 57 (0)
	wake_up_now: wake_up port map(clk, reset, knoppen, dcf_in, led_lamp, buzzer, clk_out, data_out);
end architecture;
