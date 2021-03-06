library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of send_cntrl_tb is

component send_control is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        data_out  :out   std_logic_vector(6 downto 0);
        clk_out   :out   std_logic;
	selector  :out   std_logic_vector(2 downto 0);
        x         :in    std_logic_vector(6 downto 0);
        y         :in    std_logic_vector(5 downto 0);
        c         :in    std_logic_vector(6 downto 0)
        );
end component;

signal clk  :    std_logic;
signal reset:   std_logic;
signal x:std_logic_vector (6 downto 0);
signal y         :   std_logic_vector(5 downto 0);
signal c         :    std_logic_vector(6 downto 0);
signal data_out  :   std_logic_vector(6 downto 0);
signal clk_out   :   std_logic;
signal selector  :  std_logic_vector(2 downto 0);


begin

lb: send_control port map(clk, reset, data_out, clk_out, selector, x, y, c);

clk <= '1' after 0 ns,
'0' after 100 ns when clk /= '0' else '1' after 100 ns;
reset <= '1' after 0 ns,
'0' after 500 ns;
x <= "0101010" after 0 ns;
y <= "110011" after 0 ns;
c <= "0000000" after 0 ns, "0011100" after 1000 ns;

end behaviour;





