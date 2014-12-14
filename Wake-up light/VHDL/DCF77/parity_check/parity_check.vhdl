library ieee;
use ieee.std_logic_1164.all;

entity parity_check is
    port (start_xor:		in  std_logic;
		reset: in std_logic;
	  new_dcf:	in  std_logic_vector(58 downto 0);
	  sync_now:	out std_logic);
end entity parity_check;

architecture behaviour of parity_check is

signal xor1, xor2, xor3, xor4, xor5, xor6, xor7, xor11, xor12, xor13, xor14, xor15, xor16, xor21, xor22, xor23, xor24, xor25, xor26, xor27, xor28, xor29, xor30, xor31, xor32, xor33, xor34, xor35, xor36, xor37, xor38, xor39, xor40, xor41: std_logic;

process(start_xor)
begin
	if(reset='1') then
		sync_now <= '0';
	elsif(start_xor='1')then				-- detect start_xor
		-- check minuten			-- parity check
		xor1	<= new_dcf(21) xor new_dcf(22);
		xor2	<= new_dcf(23) xor new_dcf(24);
		xor3	<= new_dcf(25) xor new_dcf(26);
		xor4	<= new_dcf(27) xor new_dcf(28);
		---------------------------------------
		xor5	<= xor1 xor xor2;
		xor6	<= xor3 xor xor4;
		---------------------------------------
		xor7	<= xor5 xor xor6;
		-- check uren
		xor11	<= new_dcf(29) xor new_dcf(30);
		xor12	<= new_dcf(31) xor new_dcf(32);
		xor13	<= new_dcf(33) xor new_dcf(34);
		---------------------------------------
		xor14	<= xor11 xor xor12;
		xor15	<= xor13 xor new_dcf(35);
		---------------------------------------
		xor16	<= xor14 xor xor15;
		-- check maanddag, weekdag, maandnummer en jaartal
		xor21	<= new_dcf(36) xor new_dcf(37); --1
		xor22	<= new_dcf(38) xor new_dcf(39); --2
		xor23	<= new_dcf(40) xor new_dcf(41); --3
		xor24	<= new_dcf(42) xor new_dcf(43); --4
		xor25	<= new_dcf(44) xor new_dcf(45); --5
		xor26	<= new_dcf(46) xor new_dcf(47); --6
		xor27	<= new_dcf(48) xor new_dcf(49); --7
		xor28	<= new_dcf(50) xor new_dcf(51); --8
		xor29	<= new_dcf(52) xor new_dcf(53); --9
		xor30	<= new_dcf(54) xor new_dcf(55); --10
		xor31	<= new_dcf(56) xor new_dcf(57); --11
		---------------------------------------
		xor32	<= xor21 xor xor22;
		xor33	<= xor23 xor xor24;
		xor34	<= xor25 xor xor26;
		xor35	<= xor27 xor xor28;
		xor36	<= xor29 xor xor30;
		---------------------------------------
		xor37	<= xor31 xor xor32;
		xor38	<= xor33 xor xor34;
		xor39	<= xor35 xor xor36;
		---------------------------------------
		xor40	<= xor37 xor xor38;
		---------------------------------------
		xor41	<= xor39 xor xor40;

		if (xor7= '1' and xor16 = '1' and xor41= '1') then
			sync_now <= '1';
		else 
			sync_now <= '0';
		end if;
	end if;
end process;
end architecture;