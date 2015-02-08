library ieee;
use ieee.std_logic_1164.all;

entity debugger is
	port(clk	      :in    std_logic;
	     reset	    :in    std_logic;
	     switches  :in    std_logic_vector(2 downto 0);
	     clk_1hz	  :in	   std_logic;
	     dcf_led	  :in	   std_logic;
             menu_info :in    std_logic_vector(2 downto 0);
	     menu_state:in    std_logic_vector(2 downto 0);
             tijd_uren :in    std_logic_vector(5 downto 0);
             tijd_min  :in    std_logic_vector(6 downto 0);
             wek_uren  :in    std_logic_vector(5 downto 0);
             wek_min   :in    std_logic_vector(6 downto 0);
             weekdag   :in    std_logic_vector(2 downto 0);
             dag       :in    std_logic_vector(5 downto 0);
             maand     :in    std_logic_vector(4 downto 0);
             jaar      :in    std_logic_vector(7 downto 0);
             output    :out   std_logic_vector(7 downto 0));
end debugger;


