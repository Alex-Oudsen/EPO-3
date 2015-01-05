
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tijd is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal X_Logic0_port, y_0_port, c_5_port, c_4_port, c_3_port, c_2_port, 
      c_1_port, c_0_port, state_2_port, state_1_port, state_0_port, 
      new_state_2_port, new_state_1_port, new_state_0_port, minuten_tijd_5_port
      , minuten_tijd_4_port, minuten_tijd_3_port, minuten_tijd_2_port, 
      minuten_tijd_1_port, minuten_tijd_0_port, uren_tijd_4_port, 
      uren_tijd_3_port, uren_tijd_2_port, uren_tijd_1_port, uren_tijd_0_port, 
      hz_state, punt, ready_sig, minner_4_port, minner_3_port, minner_1_port, 
      N160, N161, N162, N163, N164, N165, n4, U3_U5_Z_1, U3_U5_Z_2, U3_U5_Z_3, 
      U3_U5_Z_4, n185, n186, x_3_port, n190, x_1_port, n194, n195, n196, n197, 
      n198, n199, n200, n201, n202, n203, n204, n205, r127_A_5_port, n206, n207
      , n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
      n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, 
      n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, 
      n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, 
      n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, 
      n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, 
      n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, 
      n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, 
      n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, 
      n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, 
      n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, 
      n340, n341, x_2_port, x_4_port, r125_n26, r125_n25, r125_n24, r125_n23, 
      r125_n22, r125_n21, r125_n20, r125_n19, r125_n18, r125_n17, r125_n16, 
      r125_n15, r125_n14, r125_n13, r125_n12, r125_n11, r125_n10, r125_n9, 
      r125_n8, r125_n7, r125_n6, r125_n5, r125_n4, r125_n3, r125_n2 : std_logic
      ;

begin
   x <= ( X_Logic0_port, X_Logic0_port, x_4_port, x_3_port, x_2_port, x_1_port,
      y_0_port );
   y <= ( X_Logic0_port, x_4_port, x_3_port, x_2_port, x_1_port, y_0_port );
   c <= ( X_Logic0_port, c_5_port, c_4_port, c_3_port, c_2_port, c_1_port, 
      c_0_port );
   
   X_Logic0_port <= '0';
   n4 <= '0';
   ready_sig_reg : dfn10 port map( D => n186, CK => clk, Q => ready_sig);
   hz_state_reg : dfn10 port map( D => n185, CK => clk, Q => hz_state);
   state_reg_2_inst : dfa11 port map( D => new_state_2_port, CK => clk, R => 
                           reset, Q => state_2_port);
   uren_tijd_reg_0_inst : dfn10 port map( D => n204, CK => clk, Q => 
                           uren_tijd_0_port);
   minuten_tijd_reg_0_inst : dfn10 port map( D => n199, CK => clk, Q => 
                           minuten_tijd_0_port);
   state_reg_0_inst : dfa11 port map( D => new_state_0_port, CK => clk, R => 
                           reset, Q => state_0_port);
   state_reg_1_inst : dfa11 port map( D => new_state_1_port, CK => clk, R => 
                           reset, Q => state_1_port);
   uren_tijd_reg_1_inst : dfn10 port map( D => n203, CK => clk, Q => 
                           uren_tijd_1_port);
   minuten_tijd_reg_1_inst : dfn10 port map( D => n198, CK => clk, Q => 
                           minuten_tijd_1_port);
   uren_tijd_reg_2_inst : dfn10 port map( D => n202, CK => clk, Q => 
                           uren_tijd_2_port);
   minuten_tijd_reg_2_inst : dfn10 port map( D => n197, CK => clk, Q => 
                           minuten_tijd_2_port);
   uren_tijd_reg_3_inst : dfn10 port map( D => n201, CK => clk, Q => 
                           uren_tijd_3_port);
   minuten_tijd_reg_3_inst : dfn10 port map( D => n196, CK => clk, Q => 
                           minuten_tijd_3_port);
   uren_tijd_reg_4_inst : dfn10 port map( D => n200, CK => clk, Q => 
                           uren_tijd_4_port);
   minuten_tijd_reg_4_inst : dfn10 port map( D => n195, CK => clk, Q => 
                           minuten_tijd_4_port);
   minuten_tijd_reg_5_inst : dfn10 port map( D => n194, CK => clk, Q => 
                           minuten_tijd_5_port);
   punt_reg : dfn10 port map( D => n205, CK => clk, Q => punt);
   U188 : na310 port map( A => n206, B => n207, C => n208, Y => y_0_port);
   U189 : iv110 port map( A => n209, Y => n208);
   U190 : na210 port map( A => n210, B => n211, Y => new_state_2_port);
   U191 : na310 port map( A => hz_sig, B => n212, C => n213, Y => n211);
   U192 : no210 port map( A => hz_state, B => n214, Y => n213);
   U193 : mu111 port map( A => n215, B => n206, S => n216, Y => n210);
   U194 : na210 port map( A => n217, B => n207, Y => new_state_1_port);
   U195 : mu111 port map( A => n218, B => n215, S => n216, Y => n217);
   U196 : na210 port map( A => n219, B => n220, Y => new_state_0_port);
   U197 : na210 port map( A => n212, B => n221, Y => n220);
   U198 : na210 port map( A => n222, B => n223, Y => n221);
   U199 : na210 port map( A => hz_sig, B => n224, Y => n223);
   U200 : iv110 port map( A => hz_state, Y => n224);
   U201 : iv110 port map( A => n214, Y => n222);
   U202 : ex210 port map( A => minuten(0), B => minuten_tijd_0_port, Y => n214)
                           ;
   U203 : mu111 port map( A => n207, B => n225, S => n216, Y => n219);
   U204 : no210 port map( A => x_4_port, B => n209, Y => n225);
   U205 : iv110 port map( A => n226, Y => n341);
   U206 : ex210 port map( A => n227, B => n228, Y => n205);
   U207 : na310 port map( A => n229, B => n230, C => n231, Y => n228);
   U208 : no310 port map( A => x_1_port, B => reset, C => x_3_port, Y => n231);
   U209 : no210 port map( A => n209, B => n216, Y => n229);
   U210 : na310 port map( A => n232, B => n233, C => n234, Y => n204);
   U211 : na210 port map( A => uren_tijd_0_port, B => n235, Y => n234);
   U212 : na210 port map( A => uren(0), B => n236, Y => n233);
   U213 : na210 port map( A => N160, B => n237, Y => n232);
   U214 : na310 port map( A => n238, B => n239, C => n240, Y => n203);
   U215 : na210 port map( A => uren_tijd_1_port, B => n235, Y => n240);
   U216 : na210 port map( A => uren(1), B => n236, Y => n239);
   U217 : na210 port map( A => N161, B => n237, Y => n238);
   U218 : na310 port map( A => n241, B => n242, C => n243, Y => n202);
   U219 : na210 port map( A => uren_tijd_2_port, B => n235, Y => n243);
   U220 : na210 port map( A => uren(2), B => n236, Y => n242);
   U221 : na210 port map( A => N162, B => n237, Y => n241);
   U222 : na310 port map( A => n244, B => n245, C => n246, Y => n201);
   U223 : na210 port map( A => uren_tijd_3_port, B => n235, Y => n246);
   U224 : na210 port map( A => uren(3), B => n236, Y => n245);
   U225 : na210 port map( A => N163, B => n237, Y => n244);
   U226 : na310 port map( A => n247, B => n248, C => n249, Y => n200);
   U227 : na210 port map( A => uren_tijd_4_port, B => n235, Y => n249);
   U228 : na210 port map( A => uren(4), B => n236, Y => n248);
   U229 : no210 port map( A => n235, B => n230, Y => n236);
   U230 : na210 port map( A => N164, B => n237, Y => n247);
   U231 : no210 port map( A => n235, B => n218, Y => n237);
   U232 : na210 port map( A => n250, B => n215, Y => n235);
   U233 : na310 port map( A => n251, B => n252, C => n253, Y => n199);
   U234 : na210 port map( A => minuten_tijd_0_port, B => n254, Y => n253);
   U235 : na210 port map( A => n255, B => minuten(0), Y => n252);
   U236 : na210 port map( A => n256, B => N160, Y => n251);
   U237 : na310 port map( A => n257, B => n258, C => n259, Y => n198);
   U238 : na210 port map( A => minuten_tijd_1_port, B => n254, Y => n259);
   U239 : na210 port map( A => minuten(1), B => n255, Y => n258);
   U240 : na210 port map( A => n256, B => N161, Y => n257);
   U241 : na310 port map( A => n260, B => n261, C => n262, Y => n197);
   U242 : na210 port map( A => minuten_tijd_2_port, B => n254, Y => n262);
   U243 : na210 port map( A => minuten(2), B => n255, Y => n261);
   U244 : na210 port map( A => n256, B => N162, Y => n260);
   U245 : na310 port map( A => n263, B => n264, C => n265, Y => n196);
   U246 : na210 port map( A => minuten_tijd_3_port, B => n254, Y => n265);
   U247 : na210 port map( A => minuten(3), B => n255, Y => n264);
   U248 : na210 port map( A => n256, B => N163, Y => n263);
   U249 : na310 port map( A => n266, B => n267, C => n268, Y => n195);
   U250 : na210 port map( A => minuten_tijd_4_port, B => n254, Y => n268);
   U251 : na210 port map( A => minuten(4), B => n255, Y => n267);
   U252 : na210 port map( A => n256, B => N164, Y => n266);
   U253 : na310 port map( A => n269, B => n270, C => n271, Y => n194);
   U254 : na210 port map( A => minuten_tijd_5_port, B => n254, Y => n271);
   U255 : na210 port map( A => minuten(5), B => n255, Y => n270);
   U256 : no210 port map( A => n254, B => n230, Y => n255);
   U257 : no210 port map( A => n272, B => n212, Y => n230);
   U258 : no310 port map( A => state_1_port, B => state_2_port, C => 
                           state_0_port, Y => n212);
   U259 : iv110 port map( A => n273, Y => n272);
   U260 : na210 port map( A => state_2_port, B => state_1_port, Y => n273);
   U261 : na210 port map( A => N165, B => n256, Y => n269);
   U262 : no210 port map( A => n254, B => n215, Y => n256);
   U263 : na210 port map( A => n250, B => n218, Y => n254);
   U264 : iv110 port map( A => n274, Y => n250);
   U265 : na310 port map( A => n206, B => n275, C => n276, Y => n274);
   U266 : no210 port map( A => reset, B => x_1_port, Y => n276);
   U267 : na210 port map( A => n216, B => n209, Y => n275);
   U268 : na210 port map( A => n218, B => n215, Y => n209);
   U269 : iv110 port map( A => x_2_port, Y => n215);
   U270 : na210 port map( A => ready_sig, B => n277, Y => n216);
   U271 : iv110 port map( A => ready, Y => n277);
   U272 : no210 port map( A => x_3_port, B => x_4_port, Y => n206);
   U273 : iv110 port map( A => n278, Y => x_3_port);
   U274 : iv110 port map( A => n279, Y => n190);
   U275 : mu111 port map( A => ready, B => ready_sig, S => reset, Y => n186);
   U276 : mu111 port map( A => hz_sig, B => hz_state, S => reset, Y => n185);
   U277 : na210 port map( A => n279, B => n280, Y => minner_4_port);
   U278 : na210 port map( A => n281, B => x_2_port, Y => n280);
   U279 : na210 port map( A => n282, B => n283, Y => minner_3_port);
   U280 : na210 port map( A => n284, B => n285, Y => n283);
   U281 : no210 port map( A => n227, B => n286, Y => c_5_port);
   U282 : iv110 port map( A => punt, Y => n227);
   U283 : no210 port map( A => punt, B => n286, Y => c_4_port);
   U284 : na210 port map( A => n287, B => n288, Y => c_3_port);
   U285 : na310 port map( A => n289, B => uren_tijd_3_port, C => n290, Y => 
                           n288);
   U286 : na310 port map( A => n291, B => minuten_tijd_3_port, C => n292, Y => 
                           n287);
   U287 : na310 port map( A => n293, B => n226, C => n294, Y => c_2_port);
   U288 : na310 port map( A => minuten_tijd_2_port, B => n295, C => n292, Y => 
                           n294);
   U289 : na210 port map( A => n296, B => n284, Y => n226);
   U290 : na310 port map( A => uren_tijd_2_port, B => n297, C => n289, Y => 
                           n293);
   U291 : na310 port map( A => n298, B => n279, C => n299, Y => c_1_port);
   U292 : na310 port map( A => minuten_tijd_1_port, B => n295, C => n292, Y => 
                           n299);
   U293 : na210 port map( A => n300, B => n301, Y => n279);
   U294 : na210 port map( A => n296, B => n218, Y => n301);
   U295 : iv110 port map( A => n302, Y => n218);
   U296 : iv110 port map( A => n303, Y => n300);
   U297 : na310 port map( A => uren_tijd_1_port, B => n297, C => n289, Y => 
                           n298);
   U298 : iv110 port map( A => uren_tijd_3_port, Y => n297);
   U299 : na310 port map( A => n304, B => n305, C => n306, Y => c_0_port);
   U300 : no210 port map( A => minner_1_port, B => x_4_port, Y => n306);
   U301 : iv110 port map( A => n286, Y => x_4_port);
   U302 : na310 port map( A => state_0_port, B => n307, C => state_2_port, Y =>
                           n286);
   U303 : na210 port map( A => n282, B => n308, Y => minner_1_port);
   U304 : na210 port map( A => n281, B => n284, Y => n308);
   U305 : iv110 port map( A => n309, Y => n284);
   U306 : iv110 port map( A => n285, Y => n281);
   U307 : na310 port map( A => minuten_tijd_5_port, B => n310, C => 
                           minuten_tijd_4_port, Y => n285);
   U308 : na210 port map( A => n291, B => n295, Y => n310);
   U309 : iv110 port map( A => minuten_tijd_3_port, Y => n295);
   U310 : na210 port map( A => n311, B => n312, Y => n282);
   U311 : na310 port map( A => n313, B => n314, C => n315, Y => n312);
   U312 : na210 port map( A => n316, B => U3_U5_Z_3, Y => n315);
   U313 : iv110 port map( A => n317, Y => n316);
   U314 : no210 port map( A => U3_U5_Z_1, B => U3_U5_Z_2, Y => n317);
   U315 : iv110 port map( A => n318, Y => n311);
   U316 : no210 port map( A => n303, B => n319, Y => n318);
   U317 : no210 port map( A => n309, B => n296, Y => n319);
   U318 : no210 port map( A => n320, B => n321, Y => n296);
   U319 : no210 port map( A => minuten_tijd_4_port, B => minuten_tijd_3_port, Y
                           => n321);
   U320 : na210 port map( A => x_2_port, B => n322, Y => n309);
   U321 : na210 port map( A => n320, B => n323, Y => n322);
   U322 : na310 port map( A => minuten_tijd_2_port, B => minuten_tijd_1_port, C
                           => minuten_tijd_3_port, Y => n323);
   U323 : iv110 port map( A => minuten_tijd_5_port, Y => n320);
   U324 : no210 port map( A => r127_A_5_port, B => n324, Y => n303);
   U325 : no210 port map( A => n325, B => n313, Y => n324);
   U326 : iv110 port map( A => U3_U5_Z_4, Y => n313);
   U327 : no210 port map( A => U3_U5_Z_2, B => U3_U5_Z_3, Y => n325);
   U328 : iv110 port map( A => n314, Y => r127_A_5_port);
   U329 : na210 port map( A => minuten_tijd_5_port, B => x_2_port, Y => n314);
   U330 : na310 port map( A => uren_tijd_0_port, B => n326, C => n289, Y => 
                           n305);
   U331 : no210 port map( A => n207, B => uren_tijd_4_port, Y => n289);
   U332 : iv110 port map( A => x_1_port, Y => n207);
   U333 : no310 port map( A => state_0_port, B => state_2_port, C => n307, Y =>
                           x_1_port);
   U334 : na210 port map( A => uren_tijd_3_port, B => n327, Y => n326);
   U335 : iv110 port map( A => n290, Y => n327);
   U336 : no210 port map( A => uren_tijd_1_port, B => uren_tijd_2_port, Y => 
                           n290);
   U337 : na310 port map( A => minuten_tijd_0_port, B => n328, C => n292, Y => 
                           n304);
   U338 : no310 port map( A => minuten_tijd_4_port, B => minuten_tijd_5_port, C
                           => n278, Y => n292);
   U339 : na310 port map( A => n329, B => n307, C => state_2_port, Y => n278);
   U340 : na210 port map( A => minuten_tijd_3_port, B => n330, Y => n328);
   U341 : iv110 port map( A => n291, Y => n330);
   U342 : no210 port map( A => minuten_tijd_1_port, B => minuten_tijd_2_port, Y
                           => n291);
   U343 : na210 port map( A => n331, B => n332, Y => U3_U5_Z_4);
   U344 : na210 port map( A => minuten_tijd_4_port, B => x_2_port, Y => n332);
   U345 : na210 port map( A => uren_tijd_4_port, B => n302, Y => n331);
   U346 : na210 port map( A => n333, B => n334, Y => U3_U5_Z_3);
   U347 : na210 port map( A => minuten_tijd_3_port, B => x_2_port, Y => n334);
   U348 : na210 port map( A => uren_tijd_3_port, B => n302, Y => n333);
   U349 : na210 port map( A => n335, B => n336, Y => U3_U5_Z_2);
   U350 : na210 port map( A => minuten_tijd_2_port, B => x_2_port, Y => n336);
   U351 : na210 port map( A => uren_tijd_2_port, B => n302, Y => n335);
   U352 : na210 port map( A => n337, B => n338, Y => U3_U5_Z_1);
   U353 : na210 port map( A => minuten_tijd_1_port, B => x_2_port, Y => n338);
   U354 : na210 port map( A => uren_tijd_1_port, B => n302, Y => n337);
   U355 : na210 port map( A => n339, B => n340, Y => N160);
   U356 : na210 port map( A => minuten_tijd_0_port, B => x_2_port, Y => n340);
   U357 : no310 port map( A => n307, B => state_2_port, C => n329, Y => 
                           x_2_port);
   U358 : iv110 port map( A => state_1_port, Y => n307);
   U359 : na210 port map( A => uren_tijd_0_port, B => n302, Y => n339);
   U360 : no310 port map( A => state_1_port, B => state_2_port, C => n329, Y =>
                           n302);
   U361 : iv110 port map( A => state_0_port, Y => n329);
   r125_U30 : no210 port map( A => r125_n7, B => U3_U5_Z_1, Y => r125_n24);
   r125_U29 : na210 port map( A => U3_U5_Z_1, B => r125_n7, Y => r125_n26);
   r125_U28 : na210 port map( A => r125_n6, B => r125_n26, Y => N161);
   r125_U27 : ex210 port map( A => n190, B => U3_U5_Z_2, Y => r125_n25);
   r125_U26 : ex210 port map( A => r125_n24, B => r125_n25, Y => N162);
   r125_U25 : na210 port map( A => U3_U5_Z_2, B => r125_n6, Y => r125_n21);
   r125_U24 : no210 port map( A => r125_n6, B => U3_U5_Z_2, Y => r125_n23);
   r125_U23 : no210 port map( A => r125_n23, B => n190, Y => r125_n22);
   r125_U22 : na210 port map( A => r125_n21, B => r125_n5, Y => r125_n19);
   r125_U21 : ex210 port map( A => U3_U5_Z_3, B => minner_3_port, Y => r125_n20
                           );
   r125_U20 : ex210 port map( A => r125_n2, B => r125_n20, Y => N163);
   r125_U19 : na210 port map( A => U3_U5_Z_3, B => r125_n19, Y => r125_n16);
   r125_U18 : no210 port map( A => r125_n19, B => U3_U5_Z_3, Y => r125_n18);
   r125_U17 : no210 port map( A => r125_n18, B => minner_3_port, Y => r125_n17)
                           ;
   r125_U16 : na210 port map( A => r125_n16, B => r125_n4, Y => r125_n12);
   r125_U15 : ex210 port map( A => U3_U5_Z_4, B => minner_4_port, Y => r125_n15
                           );
   r125_U14 : ex210 port map( A => r125_n12, B => r125_n15, Y => r125_n14);
   r125_U13 : no210 port map( A => U3_U5_Z_4, B => r125_n12, Y => r125_n13);
   r125_U12 : no210 port map( A => minner_4_port, B => r125_n13, Y => r125_n10)
                           ;
   r125_U11 : na210 port map( A => r125_n12, B => U3_U5_Z_4, Y => r125_n11);
   r125_U10 : no210 port map( A => r125_n10, B => r125_n3, Y => r125_n8);
   r125_U9 : ex210 port map( A => n341, B => r127_A_5_port, Y => r125_n9);
   r125_U8 : ex210 port map( A => r125_n8, B => r125_n9, Y => N165);
   r125_U7 : iv110 port map( A => minner_1_port, Y => r125_n7);
   r125_U6 : iv110 port map( A => r125_n24, Y => r125_n6);
   r125_U5 : iv110 port map( A => r125_n22, Y => r125_n5);
   r125_U4 : iv110 port map( A => r125_n17, Y => r125_n4);
   r125_U3 : iv110 port map( A => r125_n11, Y => r125_n3);
   r125_U2 : iv110 port map( A => r125_n19, Y => r125_n2);
   r125_U1 : iv110 port map( A => r125_n14, Y => N164);

end synthesised;



