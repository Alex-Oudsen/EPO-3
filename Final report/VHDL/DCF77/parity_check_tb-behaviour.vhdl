-- Joran Out, 4331958 & Alex Oudsen, 4325494
-- Er wordt gebruik gemaakt van de 'echte' klok
-- Verwachte respons is een sync_now puls, omdat
-- de parity van de gesimuleerde ingangen correct is
-- Advies simulatietijd: 150 microsec.

library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of parity_tb is
	component parity_check is
 	   port (clk:	   	in  std_logic;
		 reset:    	in  std_logic;
		 start_xor:	in  std_logic;
		 minuten:  	in  std_logic_vector(6 downto 0);
		 uren:     	in  std_logic_vector(5 downto 0);
		 weekdag:  	in  std_logic_vector(2 downto 0);
		 dagen:   	in  std_logic_vector(5 downto 0);
		 maanden:  	in  std_logic_vector(4 downto 0);
		 jaren:    	in  std_logic_vector(7 downto 0);
		 parity_bits:	in  std_logic_vector(2 downto 0);
		 sync_now:	out std_logic);
	end component parity_check;

signal clk, reset, start_xor, sync_now: std_logic;
signal jaren: std_logic_vector(7 downto 0);
signal minuten: std_logic_vector(6 downto 0);
signal uren, dagen: std_logic_vector(5 downto 0);
signal maanden: std_logic_vector(4 downto 0);
signal weekdag, parity_bits: std_logic_vector(2 downto 0);

begin
	clk		<=	'1' after 0 ns,		-- Dit genereert een 32 kHz signaal
				'0' after 15625 ns  when clk /= '0' else '1' after 15625 ns;
	reset		<=	'1' after 0 ns, '0' after 50000 ns;
	start_xor	<=	'0' after 0 ns, '1' after 60000 ns, '0' after 65000 ns;
	minuten		<=	"1001000" after 0 ns;
	uren		<=	"010001" after 0 ns;
	weekdag		<=	"001" after 0 ns;
	dagen		<=	"001000" after 0 ns;
	maanden		<=	"10010" after 0 ns;
	jaren		<=	"00010100" after 0 ns;
	parity_bits	<=	"000" after 0 ns;

	check: parity_check port map(clk, reset, start_xor, minuten, uren, weekdag, dagen, maanden, jaren, parity_bits, sync_now);

end behaviour;