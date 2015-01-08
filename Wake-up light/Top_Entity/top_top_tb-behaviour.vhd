--Rens en Kevin

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of top_top_tb is
component top_top_entity is
	port (	clk		:	in	std_logic;
		reset		:	in	std_logic;
		knoppen		:	in	std_logic_vector (4 downto 0);
		dcf		:	in	std_logic;
		data_out	:	out	std_logic_vector(6 downto 0);
        	clk_out   	:	out	std_logic);
end component top_top_entity;

signal clk, reset,dcf		:	std_logic;
signal menu_signal		:	std_logic_vector(2 downto 0);
signal knoppen			:	std_logic_vector (3 downto 0);
signal wekker			:	std_logic_vector (15 downto 0);

begin
	clk		<=	'1' after 0 ns,
			'0' after 15625 ns when clk /= '0' else '1' after 15625 ns;		--32kHz

	reset	<=	'1' after 0 ns,		--knoppen(0) = menu
			'0' after 50000 ns;		--knoppen(1) = set
									--knoppen(2) = up
	knoppen <=	"0000" after 0 ns,	--knoppen(3) = down
			"0010" after 50000 ns,	--rust -> wekker_toggle	
			"0000" after 80078 ns,	--knoppen(3) = down	
			"0001" after 237500 ns,	--rust -> wekkertijd
			"0000" after 268750 ns,	--knoppen(3) = down
			"0001" after 331250 ns,	--wekkertijd -> rust
			"0000" after 362500 ns,	--knoppen(3) = down
			"0001" after 425000 ns,	--rust -> wekkertijd
			"0000" after 456250 ns,	--knoppen(3) = down
			"0010" after 518750 ns,	--wekkertijd -> uren_set
			"0000" after 550000 ns,	--knoppen(3) = down
			"0100" after 612500 ns,	--uren_set -> uren_plus
			"0000" after 643750 ns,	--knoppen(3) = down
			"1000" after 748375 ns,	--uren_set -> uren_min
			"0000" after 815625 ns,	--uren_min -> uren_set
			"0001" after 878125 ns,	--uren_set -> rust
			"0000" after 909375 ns,	--knoppen(3) = down
			"0001" after 971875 ns,	--rust -> wekkertijd
			"0000" after 1003125 ns,	--knoppen(3) = down
			"0010" after 1081250 ns,	--wekkertijd -> uren_set
			"0000" after 1096875 ns,	--knoppen(3) = down
			"0010" after 1159375 ns,	--uren_set -> minuten_set
			"0000" after 1190625 ns,	--knoppen(3) = down
			"0100" after 1253125 ns,	--minuten_set -> minuten_plus
			"0000" after 1284375 ns,	--minuten_plus -> minuten_set
			"1000" after 1346875 ns,	--minuten_set -> minuten_min
			"0000" after 1378125 ns,	--minuten_min -> minuten_set
			"0001" after 1440625 ns,	--minuten_set -> rust
			"0000" after 1471875 ns,	--knoppen(3) = down
			"0001" after 1534375 ns,	--rust -> wekkertijd
			"0000" after 1565625 ns,	--knoppen(3) = down
			"0010" after 1628125 ns,	--wekkertijd -> uren_set
			"0000" after 1659375 ns,	--knoppen(3) = down
			"0010" after 1721875 ns,	--uren_set -> minuten_set
			"0000" after 1753125 ns,	--knoppen(3) = down
			"0010" after 1815625 ns,	--minuten_set -> rust
			"0000" after 1846875 ns,	--knoppen(3) = down
			"0001" after 1909375 ns,	--rust -> wekkertijd
			"0000" after 1940625 ns,	--knoppen(3) = down
			"1000" after 2003125 ns,	--wekkertijd -> led
			"0000" after 2034375 ns,	--knoppen(3) = down
			"0001" after 2096875 ns,	--led -> rust
			"0000" after 2128125 ns,	--knoppen(3) = down
			"0001" after 2190625 ns,	--rust -> wekkertijd
			"0000" after 2221875 ns,	--knoppen(3) = down
			"0100" after 2284375 ns,	--wekkertijd -> geluid
			"0000" after 2393750 ns,	--knoppen(3) = down
			"0100" after 2456250 ns,	--geluid -> led
			"0000" after 2487500 ns,	--knoppen(3) = down
			"0100" after 2550000 ns,	--led -> wekkertijd
			"0000" after 2581250 ns,	--knoppen(3) = down
			"1000" after 2643750 ns,	--wekkertijd -> led
			"0000" after 2675000 ns,	--knoppen(3) = down
			"1000" after 2737500 ns,	--led -> geluid
			"0000" after 2768750 ns,	--knoppen(3) = down
			"1000" after 2831250 ns,	--geluid -> wekkertijd
			"0000" after 2862500 ns,	--knoppen(3) = down
			"1000" after 2925000 ns,	--wekkertijd -> led
			"0000" after 2956250 ns,	--knoppen(3) = down
			"0010" after 3018750 ns,	--led -> led_toggle
			"0000" after 3050000 ns,	--led_toggle -> led
			"1000" after 3112500 ns,	--led -> geluid
			"0000" after 3143750 ns,	--knoppen(3) = down
			"0010" after 3206250 ns,	--geluid -> geluid_toggle
			"0000" after 3237500 ns,	--geluid_toggle -> geluid
			"0001" after 3300000 ns,	--geluid -> rust
			"0000" after 3331250 ns; 	--done, done, done;			

	dcf	<=	'0' after 0 ns, '1' after 400 ms, '0' after 500 ms,
			'1' after 1500 ms, '0' after 1600 ms, -- bit 1
			'1' after 2500 ms, '0' after 2600 ms, -- bit 2
			'1' after 3500 ms, '0' after 3600 ms, -- bit 3
			'1' after 4500 ms, '0' after 4600 ms, -- bit 4
			'1' after 5500 ms, '0' after 5600 ms, -- bit 5
			'1' after 6500 ms, '0' after 6600 ms, -- bit 6
			'1' after 7500 ms, '0' after 7600 ms, -- bit 7
			'1' after 8500 ms, '0' after 8600 ms, -- bit 8
			'1' after 9500 ms, '0' after 9600 ms, -- bit 9
			'1' after 10500 ms, '0' after 10600 ms, -- bit 10
			'1' after 11500 ms, '0' after 11600 ms, -- bit 11
			'1' after 12500 ms, '0' after 12600 ms, -- bit 12
			'1' after 13500 ms, '0' after 13600 ms, -- bit 13
			'1' after 14500 ms, '0' after 14600 ms, -- bit 14
			'1' after 15500 ms, '0' after 15600 ms, -- bit 15
			'1' after 16500 ms, '0' after 16600 ms, -- bit 16
			'1' after 17500 ms, '0' after 17600 ms, -- bit 17
			'1' after 18500 ms, '0' after 18700 ms, -- bit 18	1
			'1' after 19500 ms, '0' after 19600 ms, -- bit 19
			'1' after 20500 ms, '0' after 20700 ms, -- bit 20	1
			'1' after 21500 ms, '0' after 21600 ms, -- bit 21
			'1' after 22500 ms, '0' after 22600 ms, -- bit 22
			'1' after 23500 ms, '0' after 23600 ms, -- bit 23
			'1' after 24500 ms, '0' after 24700 ms, -- bit 24	1
			'1' after 25500 ms, '0' after 25600 ms, -- bit 25
			'1' after 26500 ms, '0' after 26600 ms, -- bit 26
			'1' after 27500 ms, '0' after 27700 ms, -- bit 27	1
			'1' after 28500 ms, '0' after 28700 ms, -- bit 28	1
			'1' after 29500 ms, '0' after 29700 ms, -- bit 29	1
			'1' after 30500 ms, '0' after 30600 ms, -- bit 30
			'1' after 31500 ms, '0' after 31600 ms, -- bit 31
			'1' after 32500 ms, '0' after 32600 ms, -- bit 32
			'1' after 33500 ms, '0' after 33700 ms, -- bit 33	1
			'1' after 34500 ms, '0' after 34600 ms, -- bit 34
			'1' after 35500 ms, '0' after 35700 ms, -- bit 35	1
			'1' after 36500 ms, '0' after 36600 ms, -- bit 36
			'1' after 37500 ms, '0' after 37600 ms, -- bit 37
			'1' after 38500 ms, '0' after 38600 ms, -- bit 38
			'1' after 39500 ms, '0' after 39700 ms, -- bit 39	1
			'1' after 40500 ms, '0' after 40600 ms, -- bit 40
			'1' after 41500 ms, '0' after 41600 ms, -- bit 41
			'1' after 42500 ms, '0' after 42700 ms, -- bit 42	1
			'1' after 43500 ms, '0' after 43600 ms, -- bit 43
			'1' after 44500 ms, '0' after 44600 ms, -- bit 44
			'1' after 45500 ms, '0' after 45600 ms, -- bit 45
			'1' after 46500 ms, '0' after 46700 ms, -- bit 46	1
			'1' after 47500 ms, '0' after 47600 ms, -- bit 47
			'1' after 48500 ms, '0' after 48600 ms, -- bit 48
			'1' after 49500 ms, '0' after 49700 ms, -- bit 49	1
			'1' after 50500 ms, '0' after 50600 ms, -- bit 50
			'1' after 51500 ms, '0' after 51600 ms, -- bit 51
			'1' after 52500 ms, '0' after 52700 ms, -- bit 52	1
			'1' after 53500 ms, '0' after 53600 ms, -- bit 53
			'1' after 54500 ms, '0' after 54700 ms, -- bit 54	1
			'1' after 55500 ms, '0' after 55600 ms, -- bit 55
			'1' after 56500 ms, '0' after 56600 ms, -- bit 56
			'1' after 57500 ms, '0' after 57600 ms, -- bit 57
			'1' after 58500 ms, '0' after 58700 ms, -- bit 58	1
			'1' after 60500 ms, '0' after 60600 ms, -- bit 59 & bit 0
			'1' after 61500 ms, '0' after 61600 ms, -- bit 1
			'1' after 62500 ms, '0' after 62600 ms, -- bit 2
			'1' after 63500 ms, '0' after 63600 ms, -- bit 3
			'1' after 64500 ms, '0' after 64600 ms, -- bit 4
			'1' after 65500 ms, '0' after 65600 ms, -- bit 5
			'1' after 66500 ms, '0' after 66600 ms, -- bit 6
			'1' after 67500 ms, '0' after 67600 ms, -- bit 7
			'1' after 68500 ms, '0' after 68600 ms, -- bit 8
			'1' after 69500 ms, '0' after 69600 ms, -- bit 9
			'1' after 70500 ms, '0' after 70600 ms, -- bit 10
			'1' after 71500 ms, '0' after 71600 ms, -- bit 11
			'1' after 72500 ms, '0' after 72600 ms, -- bit 12
			'1' after 73500 ms, '0' after 73600 ms, -- bit 13
			'1' after 74500 ms, '0' after 74600 ms, -- bit 14
			'1' after 75500 ms, '0' after 75600 ms, -- bit 15
			'1' after 76500 ms, '0' after 76600 ms, -- bit 16
			'1' after 77500 ms, '0' after 77600 ms, -- bit 17
			'1' after 78500 ms, '0' after 78700 ms, -- bit 18	1
			'1' after 79500 ms, '0' after 79600 ms, -- bit 19
			'1' after 80500 ms, '0' after 80700 ms, -- bit 20	1
			'1' after 81500 ms, '0' after 81700 ms, -- bit 21	1
			'1' after 82500 ms, '0' after 82600 ms, -- bit 22
			'1' after 83500 ms, '0' after 83600 ms, -- bit 23
			'1' after 84500 ms, '0' after 84700 ms, -- bit 24	1
			'1' after 85500 ms, '0' after 85600 ms, -- bit 25
			'1' after 86500 ms, '0' after 86600 ms, -- bit 26
			'1' after 87500 ms, '0' after 87700 ms, -- bit 27	1
			'1' after 88500 ms, '0' after 88600 ms, -- bit 28
			'1' after 89500 ms, '0' after 89700 ms, -- bit 29	1
			'1' after 90500 ms, '0' after 90600 ms, -- bit 30
			'1' after 91500 ms, '0' after 91600 ms, -- bit 31
			'1' after 92500 ms, '0' after 92600 ms, -- bit 32
			'1' after 93500 ms, '0' after 93700 ms, -- bit 33	1
			'1' after 94500 ms, '0' after 94600 ms, -- bit 34
			'1' after 95500 ms, '0' after 95700 ms, -- bit 35	1
			'1' after 96500 ms, '0' after 96600 ms, -- bit 36
			'1' after 97500 ms, '0' after 97600 ms, -- bit 37
			'1' after 98500 ms, '0' after 98600 ms, -- bit 38
			'1' after 99500 ms, '0' after 99700 ms, -- bit 39	1
			'1' after 100500 ms, '0' after 100600 ms, -- bit 40
			'1' after 101500 ms, '0' after 101600 ms, -- bit 41
			'1' after 102500 ms, '0' after 102700 ms, -- bit 42	1
			'1' after 103500 ms, '0' after 103600 ms, -- bit 43
			'1' after 104500 ms, '0' after 104600 ms, -- bit 44
			'1' after 105500 ms, '0' after 105600 ms, -- bit 45
			'1' after 106500 ms, '0' after 106700 ms, -- bit 46	1
			'1' after 107500 ms, '0' after 107600 ms, -- bit 47
			'1' after 108500 ms, '0' after 108600 ms, -- bit 48
			'1' after 109500 ms, '0' after 109700 ms, -- bit 49	1
			'1' after 110500 ms, '0' after 110600 ms, -- bit 50
			'1' after 111500 ms, '0' after 111600 ms, -- bit 51
			'1' after 112500 ms, '0' after 112700 ms, -- bit 52	1
			'1' after 113500 ms, '0' after 113600 ms, -- bit 53
			'1' after 114500 ms, '0' after 114700 ms, -- bit 54	1
			'1' after 115500 ms, '0' after 115600 ms, -- bit 55
			'1' after 116500 ms, '0' after 116600 ms, -- bit 56
			'1' after 117500 ms, '0' after 117600 ms, -- bit 57
			'1' after 118500 ms, '0' after 118700 ms, -- bit 58	1
			'1' after 120500 ms, '0' after 120600 ms; -- bit 59 & bit 0
			-- dit genereert een dcf-signaal voor het ontwerp
			-- waarin het volgende gecodeerd is:
			-- DD-MM-JJ: 08-12-'14 & HH:MM: 11:48 & maandag
			-- vervolgens DD-MM-JJ: 08-12-'14 & HH:MM: 11:49 & maandag
			-- Bits 0 t/m 17 zijn 0
			-- Bit 18 is 1
			-- Bit 19 is 0
			-- Bit 20 is 1
			-- Bits 21 t/m 27 zijn de minuten (48 & 49)
			-- Bit 28 is parity bit v.d. minuten (1 & 0)
			-- Bits 29 t/m 34 zijn de uren (11)
			-- Bit 35 is parity bit v.d. uren (1)
			-- Bits 36 t/m 41 zijn de dagen v.d. maand (8)
			-- Bits 42 t/m 44 zijn de dagen v.d. week (ma)
			-- Bits 45 t/m 49 vormen de maand (12)
			-- Bits 50 t/m 57 vormen het jaar (binnen een eeuw) (14)
			-- Bits 58 is parity bit over bits 36 t/m 57 (1)
	controller_pm: top_top_entity port map(clk, reset, knoppen,dcf, wekker,menu_signal);
end architecture;



