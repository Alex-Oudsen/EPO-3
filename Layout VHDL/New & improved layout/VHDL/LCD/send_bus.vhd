library ieee;
use ieee.std_logic_1164.all;

entity send_bus is
	port(clk		: in  std_logic;
	     reset 		: in  std_logic;
	     send_ok		: in  std_logic;
	     selector		: in  std_logic_vector(2 downto 0);
	     position_0 : in  std_logic_vector(2 downto 0);
	     position_1 : in  std_logic_vector(2 downto 0);
	     position_2 : in  std_logic_vector(2 downto 0);
	     c_in_0		: in  std_logic_vector(3 downto 0);
	     c_in_1		: in  std_logic_vector(4 downto 0);
	     c_in_2		: in  std_logic_vector(3 downto 0);
	     c_in_3		: in  std_logic_vector(2 downto 0);
	     c_in_4		: in  std_logic_vector(1 downto 0);
	     c_in_5		: in  std_logic_vector(1 downto 0);
	     c_in_6		: in  std_logic_vector(1 downto 0);
             x_out			: out std_logic_vector(6 downto 0);
             y_out			: out std_logic_vector(5 downto 0);
             c_out			: out std_logic_vector(5 downto 0);
	     ready_0		: out std_logic;
	     ready_1		: out std_logic;
	     ready_2		: out std_logic;
	     ready_3		: out std_logic;
	     ready_4		: out std_logic;
	     ready_5		: out std_logic;
	     ready_6		: out std_logic);
end send_bus;


