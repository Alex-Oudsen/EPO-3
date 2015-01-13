library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test is

component osc10 is
port(e : in std_logic;
f : out std_logic;
XI : inout std_logic;
XO : inout std_logic);
end component;

begin

lb: osc10 port map( enable, clk, x1, x0);

end behaviour;