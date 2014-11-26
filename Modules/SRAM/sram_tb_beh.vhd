library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of sram_tb is
component sram is
	port(clk          	:in    std_logic;
	read_write_line    	:in    std_logic;
	reset			:in		std_logic;
        write_data   		:in    std_logic_vector(3 downto 0);
 	address	     		:in    std_logic_vector(3 downto 0);
        read_data    		:out   std_logic_vector(3 downto 0));
end component sram;

signal  clk,read_write_line,reset	:	std_logic;
signal  address 			:	std_logic_vector(3 downto 0);
signal  write_data,data_out		:   	std_logic_vector(3 downto 0);


begin
	clk 	<=	'0' after 0 ns,
			'1' after 15 ns  when clk /= '1' else '0' after 15 ns;

	reset	<=	'1' after 0 ns,
			'0' after 20 ns;


	read_write_line <='0' after 0 ns, 
			'1' after 499 ns,
			'0' after 5000 ns;

	write_data<=	"0000" after 1 ns,
			"0001" after 43 ns,
			"0010" after 83 ns,
			"0011" after 123 ns,
			"0100" after 163 ns,
			"0101" after 203 ns,
			"0110" after 243 ns,
			"0111" after 283 ns,
			"1000" after 323 ns,
			"1001" after 363 ns,
			"1010" after 403 ns,
			"1011" after 443 ns,
			"1100" after 483 ns;

	address	<=	"0000" after 3 ns,
			"0001" after 43 ns,
			"0010" after 83 ns,
			"0011" after 123 ns,
			"0100" after 163 ns,
			"0101" after 203 ns,
			"0110" after 243 ns,
			"0111" after 283 ns,
			"1000" after 323 ns,
			"1001" after 363 ns,
			"1010" after 403 ns,
			"1011" after 443 ns,
			"1100" after 483 ns,
			"0000" after 523 ns,
			"0001" after 563 ns,
			"0010" after 603 ns,
			"0011" after 643 ns,
			"0100" after 683 ns,
			"1000" after 723 ns,
			"1001" after 763 ns,
			"1010" after 803 ns,
			"1011" after 843 ns,
			"1100" after 883 ns;

	sram_pm: sram port map(clk,read_write_line,reset,write_data,address,data_out);
end behaviour;












