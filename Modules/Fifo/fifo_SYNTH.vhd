
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of fifo is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal address_2_port, address_1_port, address_0_port, full_port, empty_port
      , nopop_port, state_1_port, state_0_port, temp_address_2_port, 
      temp_address_1_port, temp_address_0_port, fullstate, emptystate, 
      new_state_0_port, n98, n99, n100, n101, n102, n103, n104, n105, n106, 
      n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, 
      n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, 
      n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, 
      n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, 
      n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, 
      n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177 : 
      std_logic;

begin
   address <= ( address_2_port, address_1_port, address_0_port );
   full <= full_port;
   empty <= empty_port;
   nopop <= nopop_port;
   
   emptystate_reg : dfn10 port map( D => n107, CK => clk, Q => emptystate);
   address_reg_0_inst : dfn10 port map( D => n106, CK => clk, Q => 
                           address_0_port);
   temp_address_reg_0_inst : dfn10 port map( D => n105, CK => clk, Q => 
                           temp_address_0_port);
   fullstate_reg : dfn10 port map( D => n104, CK => clk, Q => fullstate);
   state_reg_1_inst : dfr11 port map( D => n108, R => reset, CK => clk, Q => 
                           state_1_port);
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => reset, CK => 
                           clk, Q => state_0_port);
   address_reg_1_inst : dfn10 port map( D => n103, CK => clk, Q => 
                           address_1_port);
   temp_address_reg_1_inst : dfn10 port map( D => n102, CK => clk, Q => 
                           temp_address_1_port);
   address_reg_2_inst : dfn10 port map( D => n101, CK => clk, Q => 
                           address_2_port);
   temp_address_reg_2_inst : dfn10 port map( D => n100, CK => clk, Q => 
                           temp_address_2_port);
   full_reg : dfn10 port map( D => n99, CK => clk, Q => full_port);
   empty_reg : dfn10 port map( D => n98, CK => clk, Q => empty_port);
   U114 : na210 port map( A => n109, B => n110, Y => we);
   U115 : na210 port map( A => nopop_port, B => push, Y => n109);
   U116 : no210 port map( A => n111, B => n112, Y => nopush);
   U117 : no210 port map( A => n113, B => n114, Y => n111);
   U118 : no210 port map( A => n115, B => n116, Y => n113);
   U119 : no310 port map( A => n117, B => n118, C => n119, Y => nopop_port);
   U120 : na210 port map( A => n120, B => pop, Y => new_state_0_port);
   U121 : mu111 port map( A => state_0_port, B => n118, S => state_1_port, Y =>
                           n120);
   U122 : na210 port map( A => n121, B => n122, Y => n99);
   U123 : na210 port map( A => reset, B => full_port, Y => n122);
   U124 : na210 port map( A => n123, B => n124, Y => n98);
   U125 : na210 port map( A => empty_port, B => reset, Y => n124);
   U126 : na310 port map( A => n125, B => push, C => n126, Y => n108);
   U127 : no210 port map( A => n127, B => n128, Y => n126);
   U128 : no210 port map( A => state_1_port, B => state_0_port, Y => n128);
   U129 : no210 port map( A => pop, B => n116, Y => n127);
   U130 : iv110 port map( A => n114, Y => n125);
   U131 : na210 port map( A => n123, B => n129, Y => n107);
   U132 : na210 port map( A => reset, B => emptystate, Y => n129);
   U133 : na310 port map( A => n130, B => n131, C => n132, Y => n123);
   U134 : no210 port map( A => reset, B => n133, Y => n132);
   U135 : iv110 port map( A => n134, Y => n131);
   U136 : mu111 port map( A => n133, B => address_0_port, S => reset, Y => n106
                           );
   U137 : mu111 port map( A => n133, B => temp_address_0_port, S => reset, Y =>
                           n105);
   U138 : na210 port map( A => n121, B => n135, Y => n104);
   U139 : na210 port map( A => reset, B => fullstate, Y => n135);
   U140 : na310 port map( A => n133, B => n134, C => n136, Y => n121);
   U141 : mu111 port map( A => n137, B => n138, S => temp_address_0_port, Y => 
                           n133);
   U142 : na310 port map( A => n139, B => n140, C => n141, Y => n137);
   U143 : na310 port map( A => n142, B => n143, C => pop, Y => n141);
   U144 : na310 port map( A => push, B => n116, C => n144, Y => n139);
   U145 : iv110 port map( A => n115, Y => n144);
   U146 : no210 port map( A => n145, B => n146, Y => n115);
   U147 : no210 port map( A => n119, B => pop, Y => n146);
   U148 : mu111 port map( A => n134, B => address_1_port, S => reset, Y => n103
                           );
   U149 : mu111 port map( A => n134, B => temp_address_1_port, S => reset, Y =>
                           n102);
   U150 : na210 port map( A => n147, B => n148, Y => n134);
   U151 : mu111 port map( A => n149, B => n150, S => temp_address_1_port, Y => 
                           n147);
   U152 : na210 port map( A => temp_address_0_port, B => n151, Y => n149);
   U153 : na210 port map( A => n152, B => n153, Y => n101);
   U154 : na210 port map( A => address_2_port, B => reset, Y => n153);
   U155 : na210 port map( A => n152, B => n154, Y => n100);
   U156 : na210 port map( A => temp_address_2_port, B => reset, Y => n154);
   U157 : iv110 port map( A => n136, Y => n152);
   U158 : no210 port map( A => n130, B => reset, Y => n136);
   U159 : iv110 port map( A => n155, Y => n130);
   U160 : mu111 port map( A => n156, B => n157, S => temp_address_2_port, Y => 
                           n155);
   U161 : na210 port map( A => n150, B => n158, Y => n157);
   U162 : iv110 port map( A => n159, Y => n158);
   U163 : mu111 port map( A => n160, B => n114, S => temp_address_1_port, Y => 
                           n159);
   U164 : no210 port map( A => n161, B => n138, Y => n150);
   U165 : na310 port map( A => n162, B => n163, C => n164, Y => n138);
   U166 : na210 port map( A => fullstate, B => n165, Y => n164);
   U167 : na310 port map( A => n117, B => n112, C => n166, Y => n163);
   U168 : iv110 port map( A => pop, Y => n117);
   U169 : na210 port map( A => n167, B => n142, Y => n162);
   U170 : iv110 port map( A => n143, Y => n167);
   U171 : mu111 port map( A => n160, B => n114, S => temp_address_0_port, Y => 
                           n161);
   U172 : na210 port map( A => n168, B => n140, Y => n114);
   U173 : na210 port map( A => n169, B => n170, Y => n160);
   U174 : na210 port map( A => n171, B => n148, Y => n156);
   U175 : na310 port map( A => pop, B => n172, C => n173, Y => n148);
   U176 : no210 port map( A => temp_address_1_port, B => temp_address_0_port, Y
                           => n173);
   U177 : na210 port map( A => n174, B => n168, Y => n172);
   U178 : na210 port map( A => n142, B => n118, Y => n168);
   U179 : iv110 port map( A => emptystate, Y => n118);
   U180 : na310 port map( A => temp_address_1_port, B => n151, C => 
                           temp_address_0_port, Y => n171);
   U181 : na210 port map( A => n170, B => n110, Y => n151);
   U182 : na210 port map( A => n165, B => n116, Y => n110);
   U183 : iv110 port map( A => n169, Y => n165);
   U184 : na210 port map( A => n175, B => n166, Y => n169);
   U185 : na310 port map( A => emptystate, B => push, C => n142, Y => n170);
   U186 : no210 port map( A => n119, B => n175, Y => n142);
   U187 : no210 port map( A => n112, B => pop, Y => n175);
   U188 : na310 port map( A => n176, B => n140, C => n177, Y => do);
   U189 : na310 port map( A => pop, B => n143, C => state_1_port, Y => n177);
   U190 : na210 port map( A => emptystate, B => n112, Y => n143);
   U191 : iv110 port map( A => push, Y => n112);
   U192 : na210 port map( A => n145, B => pop, Y => n140);
   U193 : iv110 port map( A => n174, Y => n145);
   U194 : na310 port map( A => n166, B => n116, C => push, Y => n176);
   U195 : iv110 port map( A => fullstate, Y => n116);
   U196 : na210 port map( A => n119, B => n174, Y => n166);
   U197 : na210 port map( A => state_0_port, B => n119, Y => n174);
   U198 : iv110 port map( A => state_1_port, Y => n119);

end synthesised;



