
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of send_bus is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n343, ready_4_port, ready_2_port, ready_3_port, ready_1_port, n173, 
      ready_0_port, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
      n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, 
      n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, 
      n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, 
      n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, 
      n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, 
      n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, 
      n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, 
      n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, 
      n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, 
      n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, 
      n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, 
      n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, 
      n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, 
      n341, n342 : std_logic;

begin
   ready_0 <= ready_0_port;
   ready_1 <= ready_1_port;
   ready_2 <= ready_2_port;
   ready_3 <= ready_3_port;
   ready_4 <= ready_4_port;
   
   U194 : iv110 port map( A => n343, Y => n173);
   U195 : iv110 port map( A => n173, Y => ready_0_port);
   U196 : no310 port map( A => n339, B => selector(2), C => n341, Y => n175);
   U197 : no310 port map( A => selector(1), B => selector(2), C => n339, Y => 
                           n176);
   U198 : no310 port map( A => selector(0), B => selector(2), C => n341, Y => 
                           n177);
   U199 : no310 port map( A => selector(0), B => selector(1), C => n342, Y => 
                           n178);
   U200 : na310 port map( A => n179, B => n180, C => n181, Y => y_out(5));
   U201 : no210 port map( A => n182, B => n183, Y => n181);
   U202 : na210 port map( A => n184, B => n185, Y => n183);
   U203 : na210 port map( A => y_in_0(5), B => n343, Y => n185);
   U204 : na210 port map( A => y_in_1(5), B => ready_1_port, Y => n184);
   U205 : iv110 port map( A => n186, Y => n182);
   U206 : na210 port map( A => ready_2_port, B => y_in_2(5), Y => n186);
   U207 : na210 port map( A => y_in_3(5), B => ready_3_port, Y => n180);
   U208 : na210 port map( A => y_in_4(5), B => ready_4_port, Y => n179);
   U209 : na310 port map( A => n187, B => n188, C => n189, Y => y_out(4));
   U210 : no210 port map( A => n190, B => n191, Y => n189);
   U211 : na210 port map( A => n192, B => n193, Y => n191);
   U212 : na210 port map( A => y_in_0(4), B => n343, Y => n193);
   U213 : na210 port map( A => y_in_1(4), B => n176, Y => n192);
   U214 : iv110 port map( A => n194, Y => n190);
   U215 : na210 port map( A => n177, B => y_in_2(4), Y => n194);
   U216 : na210 port map( A => y_in_3(4), B => n175, Y => n188);
   U217 : na210 port map( A => y_in_4(4), B => n178, Y => n187);
   U218 : na310 port map( A => n195, B => n196, C => n197, Y => y_out(3));
   U219 : no210 port map( A => n198, B => n199, Y => n197);
   U220 : na210 port map( A => n200, B => n201, Y => n199);
   U221 : na210 port map( A => y_in_0(3), B => n343, Y => n201);
   U222 : na210 port map( A => y_in_1(3), B => ready_1_port, Y => n200);
   U223 : iv110 port map( A => n202, Y => n198);
   U224 : na210 port map( A => ready_2_port, B => y_in_2(3), Y => n202);
   U225 : na210 port map( A => y_in_3(3), B => ready_3_port, Y => n196);
   U226 : na210 port map( A => y_in_4(3), B => ready_4_port, Y => n195);
   U227 : na310 port map( A => n203, B => n204, C => n205, Y => y_out(2));
   U228 : no210 port map( A => n206, B => n207, Y => n205);
   U229 : na210 port map( A => n208, B => n209, Y => n207);
   U230 : na210 port map( A => y_in_0(2), B => n343, Y => n209);
   U231 : na210 port map( A => y_in_1(2), B => n176, Y => n208);
   U232 : iv110 port map( A => n210, Y => n206);
   U233 : na210 port map( A => n177, B => y_in_2(2), Y => n210);
   U234 : na210 port map( A => y_in_3(2), B => n175, Y => n204);
   U235 : na210 port map( A => y_in_4(2), B => n178, Y => n203);
   U236 : na310 port map( A => n211, B => n212, C => n213, Y => y_out(1));
   U237 : no210 port map( A => n214, B => n215, Y => n213);
   U238 : na210 port map( A => n216, B => n217, Y => n215);
   U239 : na210 port map( A => y_in_0(1), B => n343, Y => n217);
   U240 : na210 port map( A => y_in_1(1), B => ready_1_port, Y => n216);
   U241 : iv110 port map( A => n218, Y => n214);
   U242 : na210 port map( A => ready_2_port, B => y_in_2(1), Y => n218);
   U243 : na210 port map( A => y_in_3(1), B => ready_3_port, Y => n212);
   U244 : na210 port map( A => y_in_4(1), B => ready_4_port, Y => n211);
   U245 : na310 port map( A => n219, B => n220, C => n221, Y => y_out(0));
   U246 : no210 port map( A => n222, B => n223, Y => n221);
   U247 : na210 port map( A => n224, B => n225, Y => n223);
   U248 : na210 port map( A => y_in_0(0), B => n343, Y => n225);
   U249 : na210 port map( A => y_in_1(0), B => n176, Y => n224);
   U250 : iv110 port map( A => n226, Y => n222);
   U251 : na210 port map( A => n177, B => y_in_2(0), Y => n226);
   U252 : na210 port map( A => y_in_3(0), B => n175, Y => n220);
   U253 : na210 port map( A => y_in_4(0), B => n178, Y => n219);
   U254 : na310 port map( A => n227, B => n228, C => n229, Y => x_out(6));
   U255 : no210 port map( A => n230, B => n231, Y => n229);
   U256 : na210 port map( A => n232, B => n233, Y => n231);
   U257 : na210 port map( A => x_in_0(6), B => n343, Y => n233);
   U258 : na210 port map( A => x_in_1(6), B => ready_1_port, Y => n232);
   U259 : iv110 port map( A => n234, Y => n230);
   U260 : na210 port map( A => ready_2_port, B => x_in_2(6), Y => n234);
   U261 : na210 port map( A => x_in_3(6), B => ready_3_port, Y => n228);
   U262 : na210 port map( A => x_in_4(6), B => ready_4_port, Y => n227);
   U263 : na310 port map( A => n235, B => n236, C => n237, Y => x_out(5));
   U264 : no210 port map( A => n238, B => n239, Y => n237);
   U265 : na210 port map( A => n240, B => n241, Y => n239);
   U266 : na210 port map( A => x_in_0(5), B => n343, Y => n241);
   U267 : na210 port map( A => x_in_1(5), B => n176, Y => n240);
   U268 : iv110 port map( A => n242, Y => n238);
   U269 : na210 port map( A => n177, B => x_in_2(5), Y => n242);
   U270 : na210 port map( A => x_in_3(5), B => n175, Y => n236);
   U271 : na210 port map( A => x_in_4(5), B => n178, Y => n235);
   U272 : na310 port map( A => n243, B => n244, C => n245, Y => x_out(4));
   U273 : no210 port map( A => n246, B => n247, Y => n245);
   U274 : na210 port map( A => n248, B => n249, Y => n247);
   U275 : na210 port map( A => x_in_0(4), B => n343, Y => n249);
   U276 : na210 port map( A => x_in_1(4), B => ready_1_port, Y => n248);
   U277 : iv110 port map( A => n250, Y => n246);
   U278 : na210 port map( A => ready_2_port, B => x_in_2(4), Y => n250);
   U279 : na210 port map( A => x_in_3(4), B => ready_3_port, Y => n244);
   U280 : na210 port map( A => x_in_4(4), B => ready_4_port, Y => n243);
   U281 : na310 port map( A => n251, B => n252, C => n253, Y => x_out(3));
   U282 : no210 port map( A => n254, B => n255, Y => n253);
   U283 : na210 port map( A => n256, B => n257, Y => n255);
   U284 : na210 port map( A => x_in_0(3), B => n343, Y => n257);
   U285 : na210 port map( A => x_in_1(3), B => n176, Y => n256);
   U286 : iv110 port map( A => n258, Y => n254);
   U287 : na210 port map( A => n177, B => x_in_2(3), Y => n258);
   U288 : na210 port map( A => x_in_3(3), B => n175, Y => n252);
   U289 : na210 port map( A => x_in_4(3), B => n178, Y => n251);
   U290 : na310 port map( A => n259, B => n260, C => n261, Y => x_out(2));
   U291 : no210 port map( A => n262, B => n263, Y => n261);
   U292 : na210 port map( A => n264, B => n265, Y => n263);
   U293 : na210 port map( A => x_in_0(2), B => n343, Y => n265);
   U294 : na210 port map( A => x_in_1(2), B => ready_1_port, Y => n264);
   U295 : iv110 port map( A => n266, Y => n262);
   U296 : na210 port map( A => ready_2_port, B => x_in_2(2), Y => n266);
   U297 : na210 port map( A => x_in_3(2), B => ready_3_port, Y => n260);
   U298 : na210 port map( A => x_in_4(2), B => ready_4_port, Y => n259);
   U299 : na310 port map( A => n267, B => n268, C => n269, Y => x_out(1));
   U300 : no210 port map( A => n270, B => n271, Y => n269);
   U301 : na210 port map( A => n272, B => n273, Y => n271);
   U302 : na210 port map( A => x_in_0(1), B => n343, Y => n273);
   U303 : na210 port map( A => x_in_1(1), B => n176, Y => n272);
   U304 : iv110 port map( A => n274, Y => n270);
   U305 : na210 port map( A => n177, B => x_in_2(1), Y => n274);
   U306 : na210 port map( A => x_in_3(1), B => n175, Y => n268);
   U307 : na210 port map( A => x_in_4(1), B => n178, Y => n267);
   U308 : na310 port map( A => n275, B => n276, C => n277, Y => x_out(0));
   U309 : no210 port map( A => n278, B => n279, Y => n277);
   U310 : na210 port map( A => n280, B => n281, Y => n279);
   U311 : na210 port map( A => x_in_0(0), B => ready_0_port, Y => n281);
   U312 : na210 port map( A => x_in_1(0), B => ready_1_port, Y => n280);
   U313 : iv110 port map( A => n282, Y => n278);
   U314 : na210 port map( A => ready_2_port, B => x_in_2(0), Y => n282);
   U315 : na210 port map( A => x_in_3(0), B => ready_3_port, Y => n276);
   U316 : na210 port map( A => x_in_4(0), B => ready_4_port, Y => n275);
   U317 : na310 port map( A => n283, B => n284, C => n285, Y => c_out(6));
   U318 : no210 port map( A => n286, B => n287, Y => n285);
   U319 : na210 port map( A => n288, B => n289, Y => n287);
   U320 : na210 port map( A => c_in_0(6), B => ready_0_port, Y => n289);
   U321 : na210 port map( A => c_in_1(6), B => n176, Y => n288);
   U322 : iv110 port map( A => n290, Y => n286);
   U323 : na210 port map( A => n177, B => c_in_2(6), Y => n290);
   U324 : na210 port map( A => c_in_3(6), B => n175, Y => n284);
   U325 : na210 port map( A => c_in_4(6), B => n178, Y => n283);
   U326 : na310 port map( A => n291, B => n292, C => n293, Y => c_out(5));
   U327 : no210 port map( A => n294, B => n295, Y => n293);
   U328 : na210 port map( A => n296, B => n297, Y => n295);
   U329 : na210 port map( A => c_in_0(5), B => ready_0_port, Y => n297);
   U330 : na210 port map( A => c_in_1(5), B => ready_1_port, Y => n296);
   U331 : iv110 port map( A => n298, Y => n294);
   U332 : na210 port map( A => ready_2_port, B => c_in_2(5), Y => n298);
   U333 : na210 port map( A => c_in_3(5), B => ready_3_port, Y => n292);
   U334 : na210 port map( A => c_in_4(5), B => ready_4_port, Y => n291);
   U335 : na310 port map( A => n299, B => n300, C => n301, Y => c_out(4));
   U336 : no210 port map( A => n302, B => n303, Y => n301);
   U337 : na210 port map( A => n304, B => n305, Y => n303);
   U338 : na210 port map( A => c_in_0(4), B => ready_0_port, Y => n305);
   U339 : na210 port map( A => c_in_1(4), B => n176, Y => n304);
   U340 : iv110 port map( A => n306, Y => n302);
   U341 : na210 port map( A => n177, B => c_in_2(4), Y => n306);
   U342 : na210 port map( A => c_in_3(4), B => n175, Y => n300);
   U343 : na210 port map( A => c_in_4(4), B => n178, Y => n299);
   U344 : na310 port map( A => n307, B => n308, C => n309, Y => c_out(3));
   U345 : no210 port map( A => n310, B => n311, Y => n309);
   U346 : na210 port map( A => n312, B => n313, Y => n311);
   U347 : na210 port map( A => c_in_0(3), B => ready_0_port, Y => n313);
   U348 : na210 port map( A => c_in_1(3), B => ready_1_port, Y => n312);
   U349 : iv110 port map( A => n314, Y => n310);
   U350 : na210 port map( A => ready_2_port, B => c_in_2(3), Y => n314);
   U351 : na210 port map( A => c_in_3(3), B => ready_3_port, Y => n308);
   U352 : na210 port map( A => c_in_4(3), B => ready_4_port, Y => n307);
   U353 : na310 port map( A => n315, B => n316, C => n317, Y => c_out(2));
   U354 : no210 port map( A => n318, B => n319, Y => n317);
   U355 : na210 port map( A => n320, B => n321, Y => n319);
   U356 : na210 port map( A => c_in_0(2), B => ready_0_port, Y => n321);
   U357 : na210 port map( A => c_in_1(2), B => n176, Y => n320);
   U358 : iv110 port map( A => n322, Y => n318);
   U359 : na210 port map( A => n177, B => c_in_2(2), Y => n322);
   U360 : na210 port map( A => c_in_3(2), B => n175, Y => n316);
   U361 : na210 port map( A => c_in_4(2), B => n178, Y => n315);
   U362 : na310 port map( A => n323, B => n324, C => n325, Y => c_out(1));
   U363 : no210 port map( A => n326, B => n327, Y => n325);
   U364 : na210 port map( A => n328, B => n329, Y => n327);
   U365 : na210 port map( A => c_in_0(1), B => ready_0_port, Y => n329);
   U366 : na210 port map( A => c_in_1(1), B => ready_1_port, Y => n328);
   U367 : iv110 port map( A => n330, Y => n326);
   U368 : na210 port map( A => ready_2_port, B => c_in_2(1), Y => n330);
   U369 : na210 port map( A => c_in_3(1), B => ready_3_port, Y => n324);
   U370 : na210 port map( A => c_in_4(1), B => ready_4_port, Y => n323);
   U371 : na310 port map( A => n331, B => n332, C => n333, Y => c_out(0));
   U372 : no210 port map( A => n334, B => n335, Y => n333);
   U373 : na210 port map( A => n336, B => n337, Y => n335);
   U374 : na210 port map( A => c_in_0(0), B => ready_0_port, Y => n337);
   U375 : ex210 port map( A => selector(2), B => n338, Y => n343);
   U376 : no210 port map( A => selector(0), B => selector(1), Y => n338);
   U377 : na210 port map( A => c_in_1(0), B => n176, Y => n336);
   U378 : no310 port map( A => selector(1), B => selector(2), C => n339, Y => 
                           ready_1_port);
   U379 : iv110 port map( A => n340, Y => n334);
   U380 : na210 port map( A => n177, B => c_in_2(0), Y => n340);
   U381 : no310 port map( A => selector(0), B => selector(2), C => n341, Y => 
                           ready_2_port);
   U382 : na210 port map( A => c_in_3(0), B => n175, Y => n332);
   U383 : no310 port map( A => n339, B => selector(2), C => n341, Y => 
                           ready_3_port);
   U384 : iv110 port map( A => selector(1), Y => n341);
   U385 : iv110 port map( A => selector(0), Y => n339);
   U386 : na210 port map( A => c_in_4(0), B => n178, Y => n331);
   U387 : no310 port map( A => selector(0), B => selector(1), C => n342, Y => 
                           ready_4_port);
   U388 : iv110 port map( A => selector(2), Y => n342);

end synthesised;



