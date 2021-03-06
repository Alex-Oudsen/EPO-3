library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of send_bus_tb is

component send_bus is
   port(clk  :in    std_logic;
        reset:in    std_logic;
	selector:in std_logic_vector(2 downto 0);
        x_out:out   std_logic_vector(6 downto 0);
        y_out:out   std_logic_vector(5 downto 0);
        c_out:out   std_logic_vector(6 downto 0);
	x_in_0:in std_logic_vector(6 downto 0);
	y_in_0:in std_logic_vector(5 downto 0);
	c_in_0:in std_logic_vector(6 downto 0);
	ready_0:out std_logic;
	x_in_1:in std_logic_vector(6 downto 0);
	y_in_1:in std_logic_vector(5 downto 0);
	c_in_1:in std_logic_vector(6 downto 0);
	ready_1:out std_logic;
	x_in_2:in std_logic_vector(6 downto 0);
	y_in_2:in std_logic_vector(5 downto 0);
	c_in_2:in std_logic_vector(6 downto 0);
	ready_2:out std_logic;
	x_in_3:in std_logic_vector(6 downto 0);
	y_in_3:in std_logic_vector(5 downto 0);
	c_in_3:in std_logic_vector(6 downto 0);
	ready_3:out std_logic;
	x_in_4:in std_logic_vector(6 downto 0);
	y_in_4:in std_logic_vector(5 downto 0);
	c_in_4:in std_logic_vector(6 downto 0);
	ready_4:out std_logic);
	--x_in_5:in std_logic_vector(6 downto 0);
	--y_in_5:in std_logic_vector(5 downto 0);
	--c_in_5:in std_logic_vector(6 downto 0);
	--ready_5:out std_logic);
end component;

signal clk  :    std_logic;
signal reset:   std_logic;
signal selector: std_logic_vector(2 downto 0);
signal x_out:   std_logic_vector(6 downto 0);
signal y_out:   std_logic_vector(5 downto 0);
signal c_out:   std_logic_vector(6 downto 0);
signal x_in_0: std_logic_vector(6 downto 0);
signal y_in_0: std_logic_vector(5 downto 0);
signal c_in_0: std_logic_vector(6 downto 0);
signal ready_0: std_logic;
signal x_in_1:std_logic_vector(6 downto 0);
signal y_in_1: std_logic_vector(5 downto 0);
signal c_in_1: std_logic_vector(6 downto 0);
signal ready_1: std_logic;
signal x_in_2:std_logic_vector(6 downto 0);
signal y_in_2: std_logic_vector(5 downto 0);
signal c_in_2: std_logic_vector(6 downto 0);
signal ready_2: std_logic;
signal x_in_3: std_logic_vector(6 downto 0);
signal y_in_3: std_logic_vector(5 downto 0);
signal c_in_3: std_logic_vector(6 downto 0);
signal ready_3: std_logic;
signal x_in_4: std_logic_vector(6 downto 0);
signal y_in_4: std_logic_vector(5 downto 0);
signal c_in_4: std_logic_vector(6 downto 0);
signal ready_4: std_logic;
begin

lb: send_bus port map(clk, reset,selector, x_out, y_out, c_out, x_in_0, y_in_0, c_in_0, ready_0,
 x_in_1, y_in_1, c_in_1, ready_1,
 x_in_2, y_in_2, c_in_2, ready_2,
 x_in_3, y_in_3, c_in_3, ready_3,
 x_in_4, y_in_4, c_in_4, ready_4);

x_in_0 <= "0000000";
y_in_0 <= "000000";
c_in_0 <= "0000000";

x_in_1 <= "0000001";
y_in_1 <= "000001";
c_in_1 <= "0000001";

x_in_2 <= "0000010";
y_in_2 <= "000010";
c_in_2 <= "0000010";

x_in_3 <= "0000100";
y_in_3 <= "000100";
c_in_3 <= "0000100";

x_in_4 <= "0001000";
y_in_4 <= "001000";
c_in_4 <= "0001000";

selector <= "000" after 0 ns, "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns;

end behaviour;





