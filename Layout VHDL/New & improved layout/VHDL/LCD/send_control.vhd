library ieee;
use ieee.std_logic_1164.all;

entity send_control is
	port(clk		: in  std_logic;
             reset      : in  std_logic;
             x          : in  std_logic_vector(6 downto 0);
             y          : in  std_logic_vector(5 downto 0);
             c          : in  std_logic_vector(5 downto 0);
	     selector   : out std_logic_vector(2 downto 0);
             data_out   : out std_logic_vector(6 downto 0);
             clk_out    : out std_logic;
	     send_ok		: out std_logic);
end send_control;


