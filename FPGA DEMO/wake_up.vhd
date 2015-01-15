-- Alex Oudsen, 4325494

library ieee;
use ieee.std_logic_1164.all;

entity wake_up is
	port (clk		:in  std_logic;
	      reset		:in  std_logic;
			snooze	:in  std_logic;
	      knoppen	:in  std_logic_vector (3 downto 0);
	      dcf_in	:in  std_logic;
			tijd_min :out std_logic_vector(6 downto 0);
			tijd_uur :out std_logic_vector(5 downto 0);
			wek_min	:out std_logic_vector(6 downto 0);
			wek_uur	:out std_logic_vector(5 downto 0);
			m_state	:out std_logic_vector(2 downto 0);
			menu_info:out std_logic_vector(2 downto 0);
			clk1hz	:out std_logic;
			dcfled	:out std_logic;
	      led_lamp	:out std_logic;
	      buzzer	:out std_logic;
         clk_out  :out std_logic;
	      data_out	:out std_logic_vector(6 downto 0);
			date		:out std_logic_vector(21 downto 0));
end wake_up;
