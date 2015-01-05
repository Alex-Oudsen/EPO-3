-- Alex Oudsen, 4325494
-- Dit is de testbench voor simulatie op schaal
-- De verwachte respons geeft één synchronisatiemoment,
-- namelijk maandag 8 december 2014; 11:48
-- Advies simulatietijd: 65 ms.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of synctime_tb is
	component synctime is
 		port (clk:		in  std_logic;
	 	      reset:    	in  std_logic;
		      dcf_in:   	in  std_logic;
		      dcf_led: 		out std_logic;
		      ready:  		out std_logic;
		      minuten:  	out std_logic_vector(6 downto 0);
		      uren:    		out std_logic_vector(5 downto 0);
		      weekdag:  	out std_logic_vector(2 downto 0);
		      dagen:		out std_logic_vector(5 downto 0);
		      maanden:    	out std_logic_vector(4 downto 0);
		      jaren:		out std_logic_vector(7 downto 0));
	end component synctime;

	signal clk, reset, dcf_in, dcf_led, ready: std_logic;
	signal minuten: std_logic_vector(6 downto 0);
	signal uren, dagen: std_logic_vector(5 downto 0);
	signal maanden: std_logic_vector(4 downto 0);
	signal weekdag: std_logic_vector(2 downto 0);
	signal jaren: std_logic_vector(7 downto 0);

begin

	clk	<=	'1' after 0 ns,
			'0' after 16 ns  when clk /= '0' else '1' after 16 ns;
	reset	<=	'1' after 0 ns, '0' after 50 us;
	dcf_in	<=	'0' after 0 ns,
			'1' after 1500 us, '0' after 1600 us, -- bit 59 & bit 0
			'1' after 2500 us, '0' after 2600 us, -- bit 1
			'1' after 3500 us, '0' after 3600 us, -- bit 2
			'1' after 4500 us, '0' after 4600 us, -- bit 3
			'1' after 5500 us, '0' after 5600 us, -- bit 4
			'1' after 6500 us, '0' after 6600 us, -- bit 5
			'1' after 7500 us, '0' after 7600 us, -- bit 6
			'1' after 8500 us, '0' after 8600 us, -- bit 7
			'1' after 9500 us, '0' after 9600 us, -- bit 8
			'1' after 10500 us, '0' after 10600 us, -- bit 9
			'1' after 11500 us, '0' after 11600 us, -- bit 10
			'1' after 12500 us, '0' after 12600 us, -- bit 11
			'1' after 13500 us, '0' after 13600 us, -- bit 12
			'1' after 14500 us, '0' after 14600 us, -- bit 13
			'1' after 15500 us, '0' after 15600 us, -- bit 14
			'1' after 16500 us, '0' after 16600 us, -- bit 15
			'1' after 17500 us, '0' after 17600 us, -- bit 16
			'1' after 18500 us, '0' after 18600 us, -- bit 17
			'1' after 19500 us, '0' after 19700 us, -- bit 18	1
			'1' after 20500 us, '0' after 20600 us, -- bit 19
			'1' after 21500 us, '0' after 21700 us, -- bit 20	1
			'1' after 22500 us, '0' after 22600 us, -- bit 21
			'1' after 23500 us, '0' after 23600 us, -- bit 22
			'1' after 24500 us, '0' after 24600 us, -- bit 23
			'1' after 25500 us, '0' after 25700 us, -- bit 24	1
			'1' after 26500 us, '0' after 26600 us, -- bit 25
			'1' after 27500 us, '0' after 27600 us, -- bit 26
			'1' after 28500 us, '0' after 28700 us, -- bit 27	1
			'1' after 29500 us, '0' after 29700 us, -- bit 28	1
			'1' after 30500 us, '0' after 30700 us, -- bit 29	1
			'1' after 31500 us, '0' after 31600 us, -- bit 30
			'1' after 32500 us, '0' after 32600 us, -- bit 31
			'1' after 33500 us, '0' after 33600 us, -- bit 32
			'1' after 34500 us, '0' after 34700 us, -- bit 33	1
			'1' after 35500 us, '0' after 35600 us, -- bit 34
			'1' after 36500 us, '0' after 36700 us, -- bit 35	1
			'1' after 37500 us, '0' after 37600 us, -- bit 36
			'1' after 38500 us, '0' after 38600 us, -- bit 37
			'1' after 39500 us, '0' after 39600 us, -- bit 38
			'1' after 40500 us, '0' after 40700 us, -- bit 39	1
			'1' after 41500 us, '0' after 41600 us, -- bit 40
			'1' after 42500 us, '0' after 42600 us, -- bit 41
			'1' after 43500 us, '0' after 43700 us, -- bit 42	1
			'1' after 44500 us, '0' after 44600 us, -- bit 43
			'1' after 45500 us, '0' after 45600 us, -- bit 44
			'1' after 46500 us, '0' after 46600 us, -- bit 45
			'1' after 47500 us, '0' after 47700 us, -- bit 46	1
			'1' after 48500 us, '0' after 48600 us, -- bit 47
			'1' after 49500 us, '0' after 49600 us, -- bit 48
			'1' after 50500 us, '0' after 50700 us, -- bit 49	1
			'1' after 51500 us, '0' after 51600 us, -- bit 50
			'1' after 52500 us, '0' after 52600 us, -- bit 51
			'1' after 53500 us, '0' after 53700 us, -- bit 52	1
			'1' after 54500 us, '0' after 54600 us, -- bit 53
			'1' after 55500 us, '0' after 55700 us, -- bit 54	1
			'1' after 56500 us, '0' after 56600 us, -- bit 55
			'1' after 57500 us, '0' after 57600 us, -- bit 56
			'1' after 58500 us, '0' after 58600 us, -- bit 57
			'1' after 59500 us, '0' after 59700 us, -- bit 58	1
			'1' after 61500 us, '0' after 61600 us; -- bit 59 & bit 0
			-- dit genereert een dcf-signaal voor het ontwerp
			-- waarin het volgende gecodeerd is:
			-- DD-MM-JJ: 08-12-'14 & HH:MM: 11:48 & maandag
			-- vervolgens DD-MM-JJ: 08-12-'14 & HH:MM: 11:49 & maandag
			-- Bits 0 t/m 17 zijn 0
			-- Bit 18 is 1
			-- Bit 19 is 0
			-- Bit 20 is 1
			-- Bits 21 t/m 27 zijn de minuten (48)
			-- Bit 28 is parity bit v.d. minuten (1)
			-- Bits 29 t/m 34 zijn de uren (11)
			-- Bit 35 is parity bit v.d. uren (1)
			-- Bits 36 t/m 41 zijn de dagen v.d. maand (8)
			-- Bits 42 t/m 44 zijn de dagen v.d. week (ma)
			-- Bits 45 t/m 49 vormen de maand (12)
			-- Bits 50 t/m 57 vormen het jaar (binnen een eeuw) (14)
			-- Bits 58 is parity bit over bits 36 t/m 57 (1)

	sync_time: synctime port map(clk, reset, dcf_in, dcf_led, ready, minuten,
				    uren, weekdag, dagen, maanden, jaren);

end behaviour;