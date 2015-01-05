
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of send_control is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal clk_out_port, selector_2_port, selector_1_port, selector_0_port, 
      state_2_port, state_1_port, state_0_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, new_selectort_2_port, 
      new_selectort_1_port, new_selectort_0_port, n63, n64, n65, n66, n67, n68,
      n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83
      , n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, 
      n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, 
      n110, n111, n112, n113, n114, n115, n116, n117, n118, n119 : std_logic;

begin
   clk_out <= clk_out_port;
   selector <= ( selector_2_port, selector_1_port, selector_0_port );
   
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => reset, CK =>
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => reset, CK =>
                           clk, Q => state_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => reset, CK =>
                           clk, Q => state_2_port);
   selectort_reg_1_inst : dfr11 port map( D => new_selectort_1_port, R => reset
                           , CK => clk, Q => selector_1_port);
   selectort_reg_2_inst : dfr11 port map( D => new_selectort_2_port, R => reset
                           , CK => clk, Q => selector_2_port);
   selectort_reg_0_inst : dfr11 port map( D => new_selectort_0_port, R => reset
                           , CK => clk, Q => selector_0_port);
   U79 : iv110 port map( A => n63, Y => next_state_2_port);
   U80 : na210 port map( A => n64, B => n65, Y => next_state_1_port);
   U81 : iv110 port map( A => n66, Y => n65);
   U82 : na310 port map( A => n67, B => n68, C => n69, Y => next_state_0_port);
   U83 : na210 port map( A => n70, B => n71, Y => n69);
   U84 : na210 port map( A => n72, B => n73, Y => new_selectort_2_port);
   U85 : na310 port map( A => selector_0_port, B => n74, C => selector_1_port, 
                           Y => n73);
   U86 : na210 port map( A => selector_2_port, B => n75, Y => n72);
   U87 : na210 port map( A => n76, B => n77, Y => n75);
   U88 : mu111 port map( A => n78, B => n79, S => selector_1_port, Y => 
                           new_selectort_1_port);
   U89 : na210 port map( A => n76, B => n80, Y => n79);
   U90 : iv110 port map( A => n81, Y => n76);
   U91 : no210 port map( A => n82, B => n83, Y => n78);
   U92 : na310 port map( A => n80, B => n77, C => n84, Y => 
                           new_selectort_0_port);
   U93 : na210 port map( A => selector_0_port, B => n81, Y => n84);
   U94 : na310 port map( A => n64, B => n63, C => n67, Y => n81);
   U95 : na310 port map( A => clk_out_port, B => n85, C => n86, Y => n67);
   U96 : no210 port map( A => n87, B => n66, Y => n63);
   U97 : no310 port map( A => clk_out_port, B => state_1_port, C => n71, Y => 
                           n66);
   U98 : iv110 port map( A => n88, Y => n64);
   U99 : na310 port map( A => n83, B => n89, C => n90, Y => n77);
   U100 : iv110 port map( A => selector_1_port, Y => n89);
   U101 : na210 port map( A => n74, B => n83, Y => n80);
   U102 : iv110 port map( A => selector_0_port, Y => n83);
   U103 : iv110 port map( A => n82, Y => n74);
   U104 : na210 port map( A => n90, B => n91, Y => n82);
   U105 : iv110 port map( A => selector_2_port, Y => n91);
   U106 : mu111 port map( A => n92, B => n70, S => state_2_port, Y => n90);
   U107 : no310 port map( A => state_0_port, B => state_1_port, C => n86, Y => 
                           n92);
   U108 : na310 port map( A => n93, B => n94, C => n95, Y => n86);
   U109 : no310 port map( A => c(0), B => c(2), C => c(1), Y => n95);
   U110 : no210 port map( A => c(6), B => c(5), Y => n94);
   U111 : no210 port map( A => c(4), B => c(3), Y => n93);
   U112 : na210 port map( A => n96, B => n97, Y => data_out(6));
   U113 : na210 port map( A => x(6), B => n88, Y => n97);
   U114 : na210 port map( A => c(6), B => n98, Y => n96);
   U115 : na310 port map( A => n99, B => n100, C => n101, Y => data_out(5));
   U116 : na210 port map( A => y(5), B => n87, Y => n101);
   U117 : na210 port map( A => x(5), B => n88, Y => n100);
   U118 : na210 port map( A => c(5), B => n98, Y => n99);
   U119 : na310 port map( A => n102, B => n103, C => n104, Y => data_out(4));
   U120 : na210 port map( A => y(4), B => n87, Y => n104);
   U121 : na210 port map( A => x(4), B => n88, Y => n103);
   U122 : na210 port map( A => c(4), B => n98, Y => n102);
   U123 : na310 port map( A => n105, B => n106, C => n107, Y => data_out(3));
   U124 : na210 port map( A => y(3), B => n87, Y => n107);
   U125 : na210 port map( A => x(3), B => n88, Y => n106);
   U126 : na210 port map( A => c(3), B => n98, Y => n105);
   U127 : na310 port map( A => n108, B => n109, C => n110, Y => data_out(2));
   U128 : na210 port map( A => y(2), B => n87, Y => n110);
   U129 : na210 port map( A => x(2), B => n88, Y => n109);
   U130 : na210 port map( A => c(2), B => n98, Y => n108);
   U131 : na310 port map( A => n111, B => n112, C => n113, Y => data_out(1));
   U132 : na210 port map( A => y(1), B => n87, Y => n113);
   U133 : na210 port map( A => x(1), B => n88, Y => n112);
   U134 : na210 port map( A => c(1), B => n98, Y => n111);
   U135 : na310 port map( A => n114, B => n115, C => n116, Y => data_out(0));
   U136 : na210 port map( A => y(0), B => n87, Y => n116);
   U137 : na210 port map( A => n68, B => n117, Y => n87);
   U138 : na310 port map( A => state_0_port, B => n71, C => state_1_port, Y => 
                           n117);
   U139 : na310 port map( A => clk_out_port, B => n85, C => state_2_port, Y => 
                           n68);
   U140 : na210 port map( A => x(0), B => n88, Y => n115);
   U141 : no210 port map( A => n118, B => state_2_port, Y => n88);
   U142 : na210 port map( A => c(0), B => n98, Y => n114);
   U143 : no210 port map( A => n71, B => n118, Y => n98);
   U144 : no210 port map( A => n70, B => n119, Y => n118);
   U145 : no210 port map( A => clk_out_port, B => state_1_port, Y => n119);
   U146 : no210 port map( A => n85, B => state_0_port, Y => n70);
   U147 : iv110 port map( A => state_1_port, Y => n85);
   U148 : iv110 port map( A => state_2_port, Y => n71);
   U149 : iv110 port map( A => state_0_port, Y => clk_out_port);

end synthesised;



