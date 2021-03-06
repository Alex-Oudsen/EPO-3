library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tijd_tb is

component tijd is
   port(clk  :in    std_logic;
        reset:in    std_logic;
	uren: in std_logic_vector(5 downto 0);
	minuten : in std_logic_vector(6 downto 0);
	x    :out   std_logic_vector(6 downto 0);
        y    :out   std_logic_vector(5 downto 0);
        c    :out   std_logic_vector(6 downto 0);
        ready:in    std_logic;
	hz_sig:in std_logic
        );
end component;

signal clk  :    std_logic;
signal reset:    std_logic;
signal uren:  std_logic_vector(5 downto 0);
signal minuten :  std_logic_vector(6 downto 0);
signal x    :   std_logic_vector(6 downto 0);
signal y    :   std_logic_vector(5 downto 0);
signal c    :   std_logic_vector(6 downto 0);
signal ready:    std_logic;
signal hz_sig: std_logic;

begin
lb1 : tijd port map(clk, reset, uren, minuten, x, y, c, ready, hz_sig);

clk <= '1' after 0 ns,
'0' after 100 ns when clk /= '0' else '1' after 100 ns;
reset <= '1' after 0 ns,
'0' after 200 ns;

uren <= "100111" after 0 ns;
minuten <= "1001001" after 0 ns, "1010000" after 20000 ns;
ready <= '0' after 0 ns, '1' after 600 ns, '0' after 1200 ns, '1' after 4000 ns, '0' after 4600 ns, '1' after 6000 ns, '0' after 6600 ns, '1' after 8000 ns, '0' after 8600 ns, '1' after 11000 ns, '0' after 11600 ns;
hz_sig <= '1' after 0 ns,
'0' after 5000 ns when hz_sig /= '0' else '1' after 5000 ns;

end behaviour;





