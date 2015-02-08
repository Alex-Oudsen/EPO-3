library ieee;
use ieee.std_logic_1164.all;

entity mod24_tel_bcd is
	port(clk     		: in  std_logic;
             reset   			: in  std_logic;
             clk_in  			: in  std_logic;
             sync_now			: in  std_logic;
             ref     			: in  std_logic_vector(5 downto 0);
             count   			: out std_logic_vector(5 downto 0));
end mod24_tel_bcd;


