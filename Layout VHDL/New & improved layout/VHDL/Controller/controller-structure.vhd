library ieee;
use ieee.std_logic_1164.all;

architecture structure of controller is

	component menu is
		port(clk			: in  std_logic;
 	             reset				: in  std_logic;
		     knoppen			: in  std_logic_vector(3 downto 0);
		     wekdata			: in  std_logic_vector(15 downto 0);
		     wekker			: out std_logic_vector(15 downto 0);
		     menu_signal			: out std_logic_vector(2 downto 0);
		     enable			: out std_logic);
	end component menu;

	component geheugen is
		port(clk    			: in  std_logic;
   		     reset  			: in  std_logic;
	       	     enable	 		: in  std_logic;
	             wek_in 				: in  std_logic_vector(15 downto 0);
	             wek_out				: out std_logic_vector(15 downto 0));
	end component geheugen;

	component buff is
		port(clk			: in  std_logic;
 		     reset			: in  std_logic;
		     knoppen_in			: in  std_logic_vector(3 downto 0);
		     knoppen_out			: out std_logic_vector(3 downto 0));
	end component buff;


	signal wekdata_temp, wekker_temp: std_logic_vector(15 downto 0);
	signal knoppen_buff: std_logic_vector(3 downto 0);
	signal write_enable: std_logic;

begin
	wekker <= wekdata_temp;

	user_menu: menu 		  port map (clk, reset, knoppen_buff, wekdata_temp, wekker_temp, menu_state, write_enable);
	knop_buff: buff     port map (clk, reset, knoppen, knoppen_buff);
	geheugenl: geheugen port map (clk, reset, write_enable, wekker_temp, wekdata_temp);

end structure;


