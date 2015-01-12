library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity send_top is
port (	clk			: in	std_logic;
	reset			: in	std_logic;
	x_in_0			: in 	std_logic_vector(6 downto 0);
	y_in_0			: in 	std_logic_vector(5 downto 0);
	c_in_0			: in 	std_logic_vector(6 downto 0);
	ready_0			: out 	std_logic;

	x_in_1			: in 	std_logic_vector(6 downto 0);
	y_in_1			: in 	std_logic_vector(5 downto 0);
	c_in_1			: in 	std_logic_vector(6 downto 0);
	ready_1			: out 	std_logic;

	x_in_2			: in 	std_logic_vector(6 downto 0);
	y_in_2			: in 	std_logic_vector(5 downto 0);
	c_in_2			: in 	std_logic_vector(6 downto 0);
	ready_2			: out 	std_logic;

	x_in_3			: in 	std_logic_vector(6 downto 0);
	y_in_3			: in 	std_logic_vector(5 downto 0);
	c_in_3			: in 	std_logic_vector(6 downto 0);
	ready_3			: out 	std_logic;

	x_in_4			: in 	std_logic_vector(6 downto 0);
	y_in_4			: in 	std_logic_vector(5 downto 0);
	c_in_4			: in 	std_logic_vector(6 downto 0);
	ready_4			: out 	std_logic;

	x_in_5			: in 	std_logic_vector(6 downto 0);
	y_in_5			: in 	std_logic_vector(5 downto 0);
	c_in_5			: in 	std_logic_vector(6 downto 0);
	ready_5			: out 	std_logic;

	x_in_6			: in 	std_logic_vector(6 downto 0);
	y_in_6			: in 	std_logic_vector(5 downto 0);
	c_in_6			: in 	std_logic_vector(6 downto 0);
	ready_6			: out 	std_logic;
	data_out  		: out   std_logic_vector(6 downto 0);
	clk_out		   	: out   std_logic);
end send_top;



