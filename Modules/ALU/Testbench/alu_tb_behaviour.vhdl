library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of alu_tb is
  component alu
    port (clk : in  std_logic;
          a   : in  std_logic_vector(3 downto 0);
          b   : in  std_logic_vector(3 downto 0);
          f   : in  std_logic_vector(2 downto 0);
          r   : out std_logic_vector(3 downto 0);
          c   : out std_logic);
  end component alu;
  
signal clk : in  std_logic;
signal a   : in  std_logic_vector(3 downto 0);
signal b   : in  std_logic_vector(3 downto 0);
signal f   : in  std_logic_vector(2 downto 0);
signal r   : out std_logic_vector(3 downto 0);
signal c   : out std_logic;

begin

clk <=  '1' after  0 ns,
        '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	a	<=	"0100" after   0 ns, "1100" after  50 ns, "1000" after 100 ns,
				"0010" after 150 ns, "0111" after 200 ns, "1001" after 250 ns;
	b	<=	"1101" after   0 ns, "0110" after  50 ns, "1010" after 100 ns,
				"0101" after 150 ns, "1011" after 200 ns, "1001" after 250 ns;
	f	<=	"000"  after   0 ns, "001"  after  40 ns, "010"  after  80 ns,
				"011"  after 120 ns, "100"  after 160 ns, "101"  after 200 ns,
				"110"  after 240 ns, "111"  after 280 ns, "000"  after 320 ns;

lbl1: alu port map (clk, a, b, f, r, c);

end architecture behaviour;  

