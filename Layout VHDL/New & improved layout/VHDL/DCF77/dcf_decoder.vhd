library ieee;
use ieee.std_logic_1164.all;

entity dcf_decoder is
	port(clk			: in  std_logic;
             reset				: in  std_logic;
             count				: in  std_logic_vector(15 downto 0);
            	new_bit			: in  std_logic;
            	dcf_led			: out std_logic;
            	start_xor			: out std_logic;
            	minuten			: out std_logic_vector(6 downto 0);
            	uren			: out std_logic_vector(5 downto 0);
            	weekdag			: out std_logic_vector(2 downto 0);
            	dagen			: out std_logic_vector(5 downto 0);
            	maanden			: out std_logic_vector(4 downto 0);
            	jaren			: out std_logic_vector(7 downto 0);
            	parity_bits			: out std_logic_vector(2 downto 0));
end dcf_decoder;


