library IEEE;
use IEEE.std_logic_1164.ALL;

entity send_control is
   port(clk       :in    std_logic;
        reset     :in    std_logic;
        data_out  :out   std_logic_vector(6 downto 0);
        clk_out   :out   std_logic;
	selector  :out   std_logic_vector(2 downto 0);
        x         :in    std_logic_vector(6 downto 0);
        y         :in    std_logic_vector(5 downto 0);
        c         :in    std_logic_vector(6 downto 0)
        );
end send_control;


