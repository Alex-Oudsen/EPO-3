library ieee;
use ieee.std_logic_1164.all;

entity mod60_clk_bcd is
	port(clk     		: in  std_logic;
             reset   			: in  std_logic;
             clk_in  			: in  std_logic;
             sync_now			: in  std_logic;
             ref     			: in  std_logic_vector(6 downto 0);
	     m_clk		: out std_logic);
end mod60_clk_bcd;


