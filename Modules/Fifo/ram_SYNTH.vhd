
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of ram is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal dOut_7_port, dOut_6_port, dOut_5_port, dOut_4_port, dOut_3_port, 
      dOut_2_port, dOut_1_port, dOut_0_port, state, ram_7_7_port, ram_7_6_port,
      ram_7_5_port, ram_7_4_port, ram_7_3_port, ram_7_2_port, ram_7_1_port, 
      ram_7_0_port, ram_6_7_port, ram_6_6_port, ram_6_5_port, ram_6_4_port, 
      ram_6_3_port, ram_6_2_port, ram_6_1_port, ram_6_0_port, ram_5_7_port, 
      ram_5_6_port, ram_5_5_port, ram_5_4_port, ram_5_3_port, ram_5_2_port, 
      ram_5_1_port, ram_5_0_port, ram_4_7_port, ram_4_6_port, ram_4_5_port, 
      ram_4_4_port, ram_4_3_port, ram_4_2_port, ram_4_1_port, ram_4_0_port, 
      ram_3_7_port, ram_3_6_port, ram_3_5_port, ram_3_4_port, ram_3_3_port, 
      ram_3_2_port, ram_3_1_port, ram_3_0_port, ram_2_7_port, ram_2_6_port, 
      ram_2_5_port, ram_2_4_port, ram_2_3_port, ram_2_2_port, ram_2_1_port, 
      ram_2_0_port, ram_1_7_port, ram_1_6_port, ram_1_5_port, ram_1_4_port, 
      ram_1_3_port, ram_1_2_port, ram_1_1_port, ram_1_0_port, ram_0_7_port, 
      ram_0_6_port, ram_0_5_port, ram_0_4_port, ram_0_3_port, ram_0_2_port, 
      ram_0_1_port, ram_0_0_port, dOut_steady_7_port, dOut_steady_6_port, 
      dOut_steady_5_port, dOut_steady_4_port, dOut_steady_3_port, 
      dOut_steady_2_port, dOut_steady_1_port, dOut_steady_0_port, n280, n281, 
      n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, 
      n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, 
      n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, 
      n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, 
      n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, 
      n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, 
      n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, 
      n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, 
      n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, 
      n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, 
      n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, 
      n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, 
      n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, 
      n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, 
      n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, 
      n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, 
      n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, 
      n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, 
      n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, 
      n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, 
      n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, 
      n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, 
      n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, 
      n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, 
      n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, 
      n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, 
      n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, 
      n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, 
      n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, 
      n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, 
      n642 : std_logic;

begin
   dOut <= ( dOut_7_port, dOut_6_port, dOut_5_port, dOut_4_port, dOut_3_port, 
      dOut_2_port, dOut_1_port, dOut_0_port );
   
   state_reg : dfr11 port map( D => n296, R => n297, CK => clk, Q => state);
   ram_reg_7_7_inst : dfn10 port map( D => n298, CK => clk, Q => ram_7_7_port);
   ram_reg_7_6_inst : dfn10 port map( D => n299, CK => clk, Q => ram_7_6_port);
   ram_reg_7_5_inst : dfn10 port map( D => n300, CK => clk, Q => ram_7_5_port);
   ram_reg_7_4_inst : dfn10 port map( D => n301, CK => clk, Q => ram_7_4_port);
   ram_reg_7_3_inst : dfn10 port map( D => n302, CK => clk, Q => ram_7_3_port);
   ram_reg_7_2_inst : dfn10 port map( D => n303, CK => clk, Q => ram_7_2_port);
   ram_reg_7_1_inst : dfn10 port map( D => n304, CK => clk, Q => ram_7_1_port);
   ram_reg_7_0_inst : dfn10 port map( D => n305, CK => clk, Q => ram_7_0_port);
   ram_reg_6_7_inst : dfn10 port map( D => n306, CK => clk, Q => ram_6_7_port);
   ram_reg_6_6_inst : dfn10 port map( D => n307, CK => clk, Q => ram_6_6_port);
   ram_reg_6_5_inst : dfn10 port map( D => n308, CK => clk, Q => ram_6_5_port);
   ram_reg_6_4_inst : dfn10 port map( D => n309, CK => clk, Q => ram_6_4_port);
   ram_reg_6_3_inst : dfn10 port map( D => n310, CK => clk, Q => ram_6_3_port);
   ram_reg_6_2_inst : dfn10 port map( D => n311, CK => clk, Q => ram_6_2_port);
   ram_reg_6_1_inst : dfn10 port map( D => n312, CK => clk, Q => ram_6_1_port);
   ram_reg_6_0_inst : dfn10 port map( D => n313, CK => clk, Q => ram_6_0_port);
   ram_reg_5_7_inst : dfn10 port map( D => n314, CK => clk, Q => ram_5_7_port);
   ram_reg_5_6_inst : dfn10 port map( D => n315, CK => clk, Q => ram_5_6_port);
   ram_reg_5_5_inst : dfn10 port map( D => n316, CK => clk, Q => ram_5_5_port);
   ram_reg_5_4_inst : dfn10 port map( D => n317, CK => clk, Q => ram_5_4_port);
   ram_reg_5_3_inst : dfn10 port map( D => n318, CK => clk, Q => ram_5_3_port);
   ram_reg_5_2_inst : dfn10 port map( D => n319, CK => clk, Q => ram_5_2_port);
   ram_reg_5_1_inst : dfn10 port map( D => n320, CK => clk, Q => ram_5_1_port);
   ram_reg_5_0_inst : dfn10 port map( D => n321, CK => clk, Q => ram_5_0_port);
   ram_reg_4_7_inst : dfn10 port map( D => n322, CK => clk, Q => ram_4_7_port);
   ram_reg_4_6_inst : dfn10 port map( D => n323, CK => clk, Q => ram_4_6_port);
   ram_reg_4_5_inst : dfn10 port map( D => n324, CK => clk, Q => ram_4_5_port);
   ram_reg_4_4_inst : dfn10 port map( D => n325, CK => clk, Q => ram_4_4_port);
   ram_reg_4_3_inst : dfn10 port map( D => n326, CK => clk, Q => ram_4_3_port);
   ram_reg_4_2_inst : dfn10 port map( D => n327, CK => clk, Q => ram_4_2_port);
   ram_reg_4_1_inst : dfn10 port map( D => n328, CK => clk, Q => ram_4_1_port);
   ram_reg_4_0_inst : dfn10 port map( D => n329, CK => clk, Q => ram_4_0_port);
   ram_reg_3_7_inst : dfn10 port map( D => n330, CK => clk, Q => ram_3_7_port);
   ram_reg_3_6_inst : dfn10 port map( D => n331, CK => clk, Q => ram_3_6_port);
   ram_reg_3_5_inst : dfn10 port map( D => n332, CK => clk, Q => ram_3_5_port);
   ram_reg_3_4_inst : dfn10 port map( D => n333, CK => clk, Q => ram_3_4_port);
   ram_reg_3_3_inst : dfn10 port map( D => n334, CK => clk, Q => ram_3_3_port);
   ram_reg_3_2_inst : dfn10 port map( D => n335, CK => clk, Q => ram_3_2_port);
   ram_reg_3_1_inst : dfn10 port map( D => n336, CK => clk, Q => ram_3_1_port);
   ram_reg_3_0_inst : dfn10 port map( D => n337, CK => clk, Q => ram_3_0_port);
   ram_reg_2_7_inst : dfn10 port map( D => n338, CK => clk, Q => ram_2_7_port);
   ram_reg_2_6_inst : dfn10 port map( D => n339, CK => clk, Q => ram_2_6_port);
   ram_reg_2_5_inst : dfn10 port map( D => n340, CK => clk, Q => ram_2_5_port);
   ram_reg_2_4_inst : dfn10 port map( D => n341, CK => clk, Q => ram_2_4_port);
   ram_reg_2_3_inst : dfn10 port map( D => n342, CK => clk, Q => ram_2_3_port);
   ram_reg_2_2_inst : dfn10 port map( D => n343, CK => clk, Q => ram_2_2_port);
   ram_reg_2_1_inst : dfn10 port map( D => n344, CK => clk, Q => ram_2_1_port);
   ram_reg_2_0_inst : dfn10 port map( D => n345, CK => clk, Q => ram_2_0_port);
   ram_reg_1_7_inst : dfn10 port map( D => n346, CK => clk, Q => ram_1_7_port);
   ram_reg_1_6_inst : dfn10 port map( D => n347, CK => clk, Q => ram_1_6_port);
   ram_reg_1_5_inst : dfn10 port map( D => n348, CK => clk, Q => ram_1_5_port);
   ram_reg_1_4_inst : dfn10 port map( D => n349, CK => clk, Q => ram_1_4_port);
   ram_reg_1_3_inst : dfn10 port map( D => n350, CK => clk, Q => ram_1_3_port);
   ram_reg_1_2_inst : dfn10 port map( D => n351, CK => clk, Q => ram_1_2_port);
   ram_reg_1_1_inst : dfn10 port map( D => n352, CK => clk, Q => ram_1_1_port);
   ram_reg_1_0_inst : dfn10 port map( D => n353, CK => clk, Q => ram_1_0_port);
   ram_reg_0_7_inst : dfn10 port map( D => n354, CK => clk, Q => ram_0_7_port);
   dOut_steady_reg_7_inst : dfn10 port map( D => n295, CK => clk, Q => 
                           dOut_steady_7_port);
   ram_reg_0_6_inst : dfn10 port map( D => n355, CK => clk, Q => ram_0_6_port);
   dOut_steady_reg_6_inst : dfn10 port map( D => n294, CK => clk, Q => 
                           dOut_steady_6_port);
   ram_reg_0_5_inst : dfn10 port map( D => n356, CK => clk, Q => ram_0_5_port);
   dOut_steady_reg_5_inst : dfn10 port map( D => n293, CK => clk, Q => 
                           dOut_steady_5_port);
   ram_reg_0_4_inst : dfn10 port map( D => n357, CK => clk, Q => ram_0_4_port);
   dOut_steady_reg_4_inst : dfn10 port map( D => n292, CK => clk, Q => 
                           dOut_steady_4_port);
   ram_reg_0_3_inst : dfn10 port map( D => n358, CK => clk, Q => ram_0_3_port);
   dOut_steady_reg_3_inst : dfn10 port map( D => n291, CK => clk, Q => 
                           dOut_steady_3_port);
   ram_reg_0_2_inst : dfn10 port map( D => n359, CK => clk, Q => ram_0_2_port);
   dOut_steady_reg_2_inst : dfn10 port map( D => n290, CK => clk, Q => 
                           dOut_steady_2_port);
   ram_reg_0_1_inst : dfn10 port map( D => n360, CK => clk, Q => ram_0_1_port);
   dOut_steady_reg_1_inst : dfn10 port map( D => n289, CK => clk, Q => 
                           dOut_steady_1_port);
   ram_reg_0_0_inst : dfn10 port map( D => n361, CK => clk, Q => ram_0_0_port);
   dOut_steady_reg_0_inst : dfn10 port map( D => n288, CK => clk, Q => 
                           dOut_steady_0_port);
   dOut_reg_7_inst : dfn10 port map( D => n287, CK => clk, Q => dOut_7_port);
   dOut_reg_6_inst : dfn10 port map( D => n286, CK => clk, Q => dOut_6_port);
   dOut_reg_5_inst : dfn10 port map( D => n285, CK => clk, Q => dOut_5_port);
   dOut_reg_4_inst : dfn10 port map( D => n284, CK => clk, Q => dOut_4_port);
   dOut_reg_3_inst : dfn10 port map( D => n283, CK => clk, Q => dOut_3_port);
   dOut_reg_2_inst : dfn10 port map( D => n282, CK => clk, Q => dOut_2_port);
   dOut_reg_1_inst : dfn10 port map( D => n281, CK => clk, Q => dOut_1_port);
   dOut_reg_0_inst : dfn10 port map( D => n280, CK => clk, Q => dOut_0_port);
   n296 <= '1';
   U364 : buf40 port map( A => n366, Y => n362);
   U365 : na310 port map( A => n363, B => n364, C => n365, Y => n361);
   U366 : na210 port map( A => ram_1_0_port, B => n362, Y => n365);
   U367 : na210 port map( A => ram_0_0_port, B => n367, Y => n364);
   U368 : na210 port map( A => n368, B => n369, Y => n363);
   U369 : na310 port map( A => n370, B => n371, C => n372, Y => n360);
   U370 : na210 port map( A => ram_1_1_port, B => n362, Y => n372);
   U371 : na210 port map( A => ram_0_1_port, B => n367, Y => n371);
   U372 : na210 port map( A => n373, B => n369, Y => n370);
   U373 : na310 port map( A => n374, B => n375, C => n376, Y => n359);
   U374 : na210 port map( A => ram_1_2_port, B => n362, Y => n376);
   U375 : na210 port map( A => ram_0_2_port, B => n367, Y => n375);
   U376 : na210 port map( A => n377, B => n369, Y => n374);
   U377 : na310 port map( A => n378, B => n379, C => n380, Y => n358);
   U378 : na210 port map( A => ram_1_3_port, B => n362, Y => n380);
   U379 : na210 port map( A => ram_0_3_port, B => n367, Y => n379);
   U380 : na210 port map( A => n381, B => n369, Y => n378);
   U381 : na310 port map( A => n382, B => n383, C => n384, Y => n357);
   U382 : na210 port map( A => ram_1_4_port, B => n362, Y => n384);
   U383 : na210 port map( A => ram_0_4_port, B => n367, Y => n383);
   U384 : na210 port map( A => n385, B => n369, Y => n382);
   U385 : na310 port map( A => n386, B => n387, C => n388, Y => n356);
   U386 : na210 port map( A => ram_1_5_port, B => n362, Y => n388);
   U387 : na210 port map( A => ram_0_5_port, B => n367, Y => n387);
   U388 : na210 port map( A => n389, B => n369, Y => n386);
   U389 : na310 port map( A => n390, B => n391, C => n392, Y => n355);
   U390 : na210 port map( A => ram_1_6_port, B => n362, Y => n392);
   U391 : na210 port map( A => ram_0_6_port, B => n367, Y => n391);
   U392 : na210 port map( A => n393, B => n369, Y => n390);
   U393 : na310 port map( A => n394, B => n395, C => n396, Y => n354);
   U394 : na210 port map( A => ram_1_7_port, B => n362, Y => n396);
   U395 : na210 port map( A => ram_0_7_port, B => n367, Y => n395);
   U396 : iv110 port map( A => n397, Y => n367);
   U397 : na210 port map( A => n398, B => n399, Y => n397);
   U398 : na210 port map( A => n369, B => n400, Y => n399);
   U399 : na210 port map( A => n401, B => n369, Y => n394);
   U400 : no310 port map( A => address(1), B => address(2), C => address(0), Y 
                           => n369);
   U401 : na310 port map( A => n402, B => n403, C => n404, Y => n353);
   U402 : na210 port map( A => ram_2_0_port, B => n362, Y => n404);
   U403 : na210 port map( A => n405, B => ram_1_0_port, Y => n403);
   U404 : na210 port map( A => n406, B => n368, Y => n402);
   U405 : na310 port map( A => n407, B => n408, C => n409, Y => n352);
   U406 : na210 port map( A => ram_2_1_port, B => n362, Y => n409);
   U407 : na210 port map( A => n405, B => ram_1_1_port, Y => n408);
   U408 : na210 port map( A => n406, B => n373, Y => n407);
   U409 : na310 port map( A => n410, B => n411, C => n412, Y => n351);
   U410 : na210 port map( A => ram_2_2_port, B => n362, Y => n412);
   U411 : na210 port map( A => n405, B => ram_1_2_port, Y => n411);
   U412 : na210 port map( A => n406, B => n377, Y => n410);
   U413 : na310 port map( A => n413, B => n414, C => n415, Y => n350);
   U414 : na210 port map( A => ram_2_3_port, B => n362, Y => n415);
   U415 : na210 port map( A => n405, B => ram_1_3_port, Y => n414);
   U416 : na210 port map( A => n406, B => n381, Y => n413);
   U417 : na310 port map( A => n416, B => n417, C => n418, Y => n349);
   U418 : na210 port map( A => ram_2_4_port, B => n362, Y => n418);
   U419 : na210 port map( A => n405, B => ram_1_4_port, Y => n417);
   U420 : na210 port map( A => n406, B => n385, Y => n416);
   U421 : na310 port map( A => n419, B => n420, C => n421, Y => n348);
   U422 : na210 port map( A => ram_2_5_port, B => n362, Y => n421);
   U423 : na210 port map( A => n405, B => ram_1_5_port, Y => n420);
   U424 : na210 port map( A => n406, B => n389, Y => n419);
   U425 : na310 port map( A => n422, B => n423, C => n424, Y => n347);
   U426 : na210 port map( A => ram_2_6_port, B => n362, Y => n424);
   U427 : na210 port map( A => n405, B => ram_1_6_port, Y => n423);
   U428 : na210 port map( A => n406, B => n393, Y => n422);
   U429 : na310 port map( A => n425, B => n426, C => n427, Y => n346);
   U430 : na210 port map( A => ram_2_7_port, B => n362, Y => n427);
   U431 : na210 port map( A => n405, B => ram_1_7_port, Y => n426);
   U432 : iv110 port map( A => n428, Y => n405);
   U433 : na210 port map( A => n398, B => n429, Y => n428);
   U434 : na210 port map( A => n406, B => n400, Y => n429);
   U435 : na210 port map( A => n406, B => n401, Y => n425);
   U436 : no310 port map( A => address(1), B => address(2), C => n430, Y => 
                           n406);
   U437 : na310 port map( A => n431, B => n432, C => n433, Y => n345);
   U438 : na210 port map( A => ram_3_0_port, B => n362, Y => n433);
   U439 : na210 port map( A => n434, B => ram_2_0_port, Y => n432);
   U440 : na210 port map( A => n435, B => n368, Y => n431);
   U441 : na310 port map( A => n436, B => n437, C => n438, Y => n344);
   U442 : na210 port map( A => ram_3_1_port, B => n362, Y => n438);
   U443 : na210 port map( A => n434, B => ram_2_1_port, Y => n437);
   U444 : na210 port map( A => n435, B => n373, Y => n436);
   U445 : na310 port map( A => n439, B => n440, C => n441, Y => n343);
   U446 : na210 port map( A => ram_3_2_port, B => n362, Y => n441);
   U447 : na210 port map( A => n434, B => ram_2_2_port, Y => n440);
   U448 : na210 port map( A => n435, B => n377, Y => n439);
   U449 : na310 port map( A => n442, B => n443, C => n444, Y => n342);
   U450 : na210 port map( A => ram_3_3_port, B => n362, Y => n444);
   U451 : na210 port map( A => n434, B => ram_2_3_port, Y => n443);
   U452 : na210 port map( A => n435, B => n381, Y => n442);
   U453 : na310 port map( A => n445, B => n446, C => n447, Y => n341);
   U454 : na210 port map( A => ram_3_4_port, B => n362, Y => n447);
   U455 : na210 port map( A => n434, B => ram_2_4_port, Y => n446);
   U456 : na210 port map( A => n435, B => n385, Y => n445);
   U457 : na310 port map( A => n448, B => n449, C => n450, Y => n340);
   U458 : na210 port map( A => ram_3_5_port, B => n362, Y => n450);
   U459 : na210 port map( A => n434, B => ram_2_5_port, Y => n449);
   U460 : na210 port map( A => n435, B => n389, Y => n448);
   U461 : na310 port map( A => n451, B => n452, C => n453, Y => n339);
   U462 : na210 port map( A => ram_3_6_port, B => n362, Y => n453);
   U463 : na210 port map( A => n434, B => ram_2_6_port, Y => n452);
   U464 : na210 port map( A => n435, B => n393, Y => n451);
   U465 : na310 port map( A => n454, B => n455, C => n456, Y => n338);
   U466 : na210 port map( A => ram_3_7_port, B => n362, Y => n456);
   U467 : na210 port map( A => n434, B => ram_2_7_port, Y => n455);
   U468 : iv110 port map( A => n457, Y => n434);
   U469 : na210 port map( A => n398, B => n458, Y => n457);
   U470 : na210 port map( A => n435, B => n400, Y => n458);
   U471 : na210 port map( A => n435, B => n401, Y => n454);
   U472 : no310 port map( A => address(0), B => address(2), C => n459, Y => 
                           n435);
   U473 : na310 port map( A => n460, B => n461, C => n462, Y => n337);
   U474 : na210 port map( A => ram_4_0_port, B => n362, Y => n462);
   U475 : na210 port map( A => n463, B => ram_3_0_port, Y => n461);
   U476 : na210 port map( A => n464, B => n368, Y => n460);
   U477 : na310 port map( A => n465, B => n466, C => n467, Y => n336);
   U478 : na210 port map( A => ram_4_1_port, B => n362, Y => n467);
   U479 : na210 port map( A => n463, B => ram_3_1_port, Y => n466);
   U480 : na210 port map( A => n464, B => n373, Y => n465);
   U481 : na310 port map( A => n468, B => n469, C => n470, Y => n335);
   U482 : na210 port map( A => ram_4_2_port, B => n362, Y => n470);
   U483 : na210 port map( A => n463, B => ram_3_2_port, Y => n469);
   U484 : na210 port map( A => n464, B => n377, Y => n468);
   U485 : na310 port map( A => n471, B => n472, C => n473, Y => n334);
   U486 : na210 port map( A => ram_4_3_port, B => n362, Y => n473);
   U487 : na210 port map( A => n463, B => ram_3_3_port, Y => n472);
   U488 : na210 port map( A => n464, B => n381, Y => n471);
   U489 : na310 port map( A => n474, B => n475, C => n476, Y => n333);
   U490 : na210 port map( A => ram_4_4_port, B => n362, Y => n476);
   U491 : na210 port map( A => n463, B => ram_3_4_port, Y => n475);
   U492 : na210 port map( A => n464, B => n385, Y => n474);
   U493 : na310 port map( A => n477, B => n478, C => n479, Y => n332);
   U494 : na210 port map( A => ram_4_5_port, B => n362, Y => n479);
   U495 : na210 port map( A => n463, B => ram_3_5_port, Y => n478);
   U496 : na210 port map( A => n464, B => n389, Y => n477);
   U497 : na310 port map( A => n480, B => n481, C => n482, Y => n331);
   U498 : na210 port map( A => ram_4_6_port, B => n362, Y => n482);
   U499 : na210 port map( A => n463, B => ram_3_6_port, Y => n481);
   U500 : na210 port map( A => n464, B => n393, Y => n480);
   U501 : na310 port map( A => n483, B => n484, C => n485, Y => n330);
   U502 : na210 port map( A => ram_4_7_port, B => n362, Y => n485);
   U503 : na210 port map( A => n463, B => ram_3_7_port, Y => n484);
   U504 : iv110 port map( A => n486, Y => n463);
   U505 : na210 port map( A => n398, B => n487, Y => n486);
   U506 : na210 port map( A => n464, B => n400, Y => n487);
   U507 : na210 port map( A => n464, B => n401, Y => n483);
   U508 : no310 port map( A => n430, B => address(2), C => n459, Y => n464);
   U509 : na310 port map( A => n488, B => n489, C => n490, Y => n329);
   U510 : na210 port map( A => ram_5_0_port, B => n362, Y => n490);
   U511 : na210 port map( A => n491, B => ram_4_0_port, Y => n489);
   U512 : na210 port map( A => n492, B => n368, Y => n488);
   U513 : na310 port map( A => n493, B => n494, C => n495, Y => n328);
   U514 : na210 port map( A => ram_5_1_port, B => n362, Y => n495);
   U515 : na210 port map( A => n491, B => ram_4_1_port, Y => n494);
   U516 : na210 port map( A => n492, B => n373, Y => n493);
   U517 : na310 port map( A => n496, B => n497, C => n498, Y => n327);
   U518 : na210 port map( A => ram_5_2_port, B => n362, Y => n498);
   U519 : na210 port map( A => n491, B => ram_4_2_port, Y => n497);
   U520 : na210 port map( A => n492, B => n377, Y => n496);
   U521 : na310 port map( A => n499, B => n500, C => n501, Y => n326);
   U522 : na210 port map( A => ram_5_3_port, B => n362, Y => n501);
   U523 : na210 port map( A => n491, B => ram_4_3_port, Y => n500);
   U524 : na210 port map( A => n492, B => n381, Y => n499);
   U525 : na310 port map( A => n502, B => n503, C => n504, Y => n325);
   U526 : na210 port map( A => ram_5_4_port, B => n362, Y => n504);
   U527 : na210 port map( A => n491, B => ram_4_4_port, Y => n503);
   U528 : na210 port map( A => n492, B => n385, Y => n502);
   U529 : na310 port map( A => n505, B => n506, C => n507, Y => n324);
   U530 : na210 port map( A => ram_5_5_port, B => n362, Y => n507);
   U531 : na210 port map( A => n491, B => ram_4_5_port, Y => n506);
   U532 : na210 port map( A => n492, B => n389, Y => n505);
   U533 : na310 port map( A => n508, B => n509, C => n510, Y => n323);
   U534 : na210 port map( A => ram_5_6_port, B => n362, Y => n510);
   U535 : na210 port map( A => n491, B => ram_4_6_port, Y => n509);
   U536 : na210 port map( A => n492, B => n393, Y => n508);
   U537 : na310 port map( A => n511, B => n512, C => n513, Y => n322);
   U538 : na210 port map( A => ram_5_7_port, B => n362, Y => n513);
   U539 : na210 port map( A => n491, B => ram_4_7_port, Y => n512);
   U540 : iv110 port map( A => n514, Y => n491);
   U541 : na210 port map( A => n398, B => n515, Y => n514);
   U542 : na210 port map( A => n492, B => n400, Y => n515);
   U543 : na210 port map( A => n492, B => n401, Y => n511);
   U544 : no310 port map( A => address(0), B => address(1), C => n516, Y => 
                           n492);
   U545 : na310 port map( A => n517, B => n518, C => n519, Y => n321);
   U546 : na210 port map( A => ram_6_0_port, B => n362, Y => n519);
   U547 : na210 port map( A => n520, B => ram_5_0_port, Y => n518);
   U548 : na210 port map( A => n521, B => n368, Y => n517);
   U549 : na310 port map( A => n522, B => n523, C => n524, Y => n320);
   U550 : na210 port map( A => ram_6_1_port, B => n362, Y => n524);
   U551 : na210 port map( A => n520, B => ram_5_1_port, Y => n523);
   U552 : na210 port map( A => n521, B => n373, Y => n522);
   U553 : na310 port map( A => n525, B => n526, C => n527, Y => n319);
   U554 : na210 port map( A => ram_6_2_port, B => n362, Y => n527);
   U555 : na210 port map( A => n520, B => ram_5_2_port, Y => n526);
   U556 : na210 port map( A => n521, B => n377, Y => n525);
   U557 : na310 port map( A => n528, B => n529, C => n530, Y => n318);
   U558 : na210 port map( A => ram_6_3_port, B => n362, Y => n530);
   U559 : na210 port map( A => n520, B => ram_5_3_port, Y => n529);
   U560 : na210 port map( A => n521, B => n381, Y => n528);
   U561 : na310 port map( A => n531, B => n532, C => n533, Y => n317);
   U562 : na210 port map( A => ram_6_4_port, B => n362, Y => n533);
   U563 : na210 port map( A => n520, B => ram_5_4_port, Y => n532);
   U564 : na210 port map( A => n521, B => n385, Y => n531);
   U565 : na310 port map( A => n534, B => n535, C => n536, Y => n316);
   U566 : na210 port map( A => ram_6_5_port, B => n362, Y => n536);
   U567 : na210 port map( A => n520, B => ram_5_5_port, Y => n535);
   U568 : na210 port map( A => n521, B => n389, Y => n534);
   U569 : na310 port map( A => n537, B => n538, C => n539, Y => n315);
   U570 : na210 port map( A => ram_6_6_port, B => n362, Y => n539);
   U571 : na210 port map( A => n520, B => ram_5_6_port, Y => n538);
   U572 : na210 port map( A => n521, B => n393, Y => n537);
   U573 : na310 port map( A => n540, B => n541, C => n542, Y => n314);
   U574 : na210 port map( A => ram_6_7_port, B => n362, Y => n542);
   U575 : na210 port map( A => n520, B => ram_5_7_port, Y => n541);
   U576 : iv110 port map( A => n543, Y => n520);
   U577 : na210 port map( A => n398, B => n544, Y => n543);
   U578 : na210 port map( A => n521, B => n400, Y => n544);
   U579 : na210 port map( A => n521, B => n401, Y => n540);
   U580 : no310 port map( A => n430, B => address(1), C => n516, Y => n521);
   U581 : na310 port map( A => n545, B => n546, C => n547, Y => n313);
   U582 : na210 port map( A => n548, B => n368, Y => n547);
   U583 : na210 port map( A => ram_7_0_port, B => n362, Y => n546);
   U584 : na210 port map( A => n549, B => ram_6_0_port, Y => n545);
   U585 : na310 port map( A => n550, B => n551, C => n552, Y => n312);
   U586 : na210 port map( A => n548, B => n373, Y => n552);
   U587 : na210 port map( A => ram_7_1_port, B => n362, Y => n551);
   U588 : na210 port map( A => n549, B => ram_6_1_port, Y => n550);
   U589 : na310 port map( A => n553, B => n554, C => n555, Y => n311);
   U590 : na210 port map( A => n548, B => n377, Y => n555);
   U591 : na210 port map( A => ram_7_2_port, B => n362, Y => n554);
   U592 : na210 port map( A => n549, B => ram_6_2_port, Y => n553);
   U593 : na310 port map( A => n556, B => n557, C => n558, Y => n310);
   U594 : na210 port map( A => n548, B => n381, Y => n558);
   U595 : na210 port map( A => ram_7_3_port, B => n362, Y => n557);
   U596 : na210 port map( A => n549, B => ram_6_3_port, Y => n556);
   U597 : na310 port map( A => n559, B => n560, C => n561, Y => n309);
   U598 : na210 port map( A => n548, B => n385, Y => n561);
   U599 : na210 port map( A => ram_7_4_port, B => n362, Y => n560);
   U600 : na210 port map( A => n549, B => ram_6_4_port, Y => n559);
   U601 : na310 port map( A => n562, B => n563, C => n564, Y => n308);
   U602 : na210 port map( A => n548, B => n389, Y => n564);
   U603 : na210 port map( A => ram_7_5_port, B => n362, Y => n563);
   U604 : na210 port map( A => n549, B => ram_6_5_port, Y => n562);
   U605 : na310 port map( A => n565, B => n566, C => n567, Y => n307);
   U606 : na210 port map( A => n548, B => n393, Y => n567);
   U607 : na210 port map( A => ram_7_6_port, B => n362, Y => n566);
   U608 : na210 port map( A => n549, B => ram_6_6_port, Y => n565);
   U609 : na310 port map( A => n568, B => n569, C => n570, Y => n306);
   U610 : na210 port map( A => n548, B => n401, Y => n570);
   U611 : na210 port map( A => ram_7_7_port, B => n362, Y => n569);
   U612 : no310 port map( A => n571, B => state, C => n572, Y => n366);
   U613 : na210 port map( A => n549, B => ram_6_7_port, Y => n568);
   U614 : iv110 port map( A => n573, Y => n549);
   U615 : na210 port map( A => n398, B => n574, Y => n573);
   U616 : na210 port map( A => n548, B => n400, Y => n574);
   U617 : no310 port map( A => n459, B => address(0), C => n516, Y => n548);
   U618 : na210 port map( A => n575, B => n576, Y => n305);
   U619 : na210 port map( A => n577, B => n368, Y => n576);
   U620 : iv110 port map( A => n578, Y => n368);
   U621 : na210 port map( A => dIn(0), B => n579, Y => n578);
   U622 : na210 port map( A => n580, B => ram_7_0_port, Y => n575);
   U623 : na210 port map( A => n581, B => n582, Y => n304);
   U624 : na210 port map( A => n577, B => n373, Y => n582);
   U625 : iv110 port map( A => n583, Y => n373);
   U626 : na210 port map( A => dIn(1), B => n579, Y => n583);
   U627 : na210 port map( A => n580, B => ram_7_1_port, Y => n581);
   U628 : na210 port map( A => n584, B => n585, Y => n303);
   U629 : na210 port map( A => n577, B => n377, Y => n585);
   U630 : iv110 port map( A => n586, Y => n377);
   U631 : na210 port map( A => dIn(2), B => n579, Y => n586);
   U632 : na210 port map( A => n580, B => ram_7_2_port, Y => n584);
   U633 : na210 port map( A => n587, B => n588, Y => n302);
   U634 : na210 port map( A => n577, B => n381, Y => n588);
   U635 : iv110 port map( A => n589, Y => n381);
   U636 : na210 port map( A => dIn(3), B => n579, Y => n589);
   U637 : na210 port map( A => n580, B => ram_7_3_port, Y => n587);
   U638 : na210 port map( A => n590, B => n591, Y => n301);
   U639 : na210 port map( A => n577, B => n385, Y => n591);
   U640 : iv110 port map( A => n592, Y => n385);
   U641 : na210 port map( A => dIn(4), B => n579, Y => n592);
   U642 : na210 port map( A => n580, B => ram_7_4_port, Y => n590);
   U643 : na210 port map( A => n593, B => n594, Y => n300);
   U644 : na210 port map( A => n577, B => n389, Y => n594);
   U645 : iv110 port map( A => n595, Y => n389);
   U646 : na210 port map( A => dIn(5), B => n579, Y => n595);
   U647 : na210 port map( A => n580, B => ram_7_5_port, Y => n593);
   U648 : na210 port map( A => n596, B => n597, Y => n299);
   U649 : na210 port map( A => n577, B => n393, Y => n597);
   U650 : iv110 port map( A => n598, Y => n393);
   U651 : na210 port map( A => dIn(6), B => n579, Y => n598);
   U652 : na210 port map( A => n580, B => ram_7_6_port, Y => n596);
   U653 : na210 port map( A => n599, B => n600, Y => n298);
   U654 : na210 port map( A => n580, B => ram_7_7_port, Y => n600);
   U655 : iv110 port map( A => n601, Y => n580);
   U656 : na210 port map( A => n398, B => n602, Y => n601);
   U657 : na210 port map( A => n577, B => n400, Y => n602);
   U658 : na210 port map( A => n400, B => n603, Y => n398);
   U659 : na210 port map( A => n577, B => n401, Y => n599);
   U660 : iv110 port map( A => n604, Y => n401);
   U661 : na210 port map( A => dIn(7), B => n579, Y => n604);
   U662 : no210 port map( A => n603, B => n571, Y => n579);
   U663 : iv110 port map( A => n400, Y => n571);
   U664 : no210 port map( A => reset, B => n605, Y => n400);
   U665 : no210 port map( A => do, B => state, Y => n605);
   U666 : no310 port map( A => n459, B => n430, C => n516, Y => n577);
   U667 : iv110 port map( A => address(2), Y => n516);
   U668 : iv110 port map( A => address(0), Y => n430);
   U669 : iv110 port map( A => address(1), Y => n459);
   U670 : na210 port map( A => n606, B => n607, Y => n295);
   U671 : na210 port map( A => dOut_steady_7_port, B => n608, Y => n607);
   U672 : na210 port map( A => n609, B => n610, Y => n294);
   U673 : na210 port map( A => dOut_steady_6_port, B => n608, Y => n610);
   U674 : na210 port map( A => n611, B => n612, Y => n293);
   U675 : na210 port map( A => dOut_steady_5_port, B => n608, Y => n612);
   U676 : na210 port map( A => n613, B => n614, Y => n292);
   U677 : na210 port map( A => dOut_steady_4_port, B => n608, Y => n614);
   U678 : na210 port map( A => n615, B => n616, Y => n291);
   U679 : na210 port map( A => dOut_steady_3_port, B => n608, Y => n616);
   U680 : na210 port map( A => n617, B => n618, Y => n290);
   U681 : na210 port map( A => dOut_steady_2_port, B => n608, Y => n618);
   U682 : na210 port map( A => n619, B => n620, Y => n289);
   U683 : na210 port map( A => dOut_steady_1_port, B => n608, Y => n620);
   U684 : na210 port map( A => n621, B => n622, Y => n288);
   U685 : na210 port map( A => dOut_steady_0_port, B => n608, Y => n622);
   U686 : na210 port map( A => n297, B => n603, Y => n608);
   U687 : iv110 port map( A => reset, Y => n297);
   U688 : na310 port map( A => n606, B => n623, C => n624, Y => n287);
   U689 : na210 port map( A => dOut_7_port, B => reset, Y => n624);
   U690 : na210 port map( A => n625, B => dOut_steady_7_port, Y => n623);
   U691 : na210 port map( A => n626, B => ram_0_7_port, Y => n606);
   U692 : na310 port map( A => n609, B => n627, C => n628, Y => n286);
   U693 : na210 port map( A => dOut_6_port, B => reset, Y => n628);
   U694 : na210 port map( A => n625, B => dOut_steady_6_port, Y => n627);
   U695 : na210 port map( A => n626, B => ram_0_6_port, Y => n609);
   U696 : na310 port map( A => n611, B => n629, C => n630, Y => n285);
   U697 : na210 port map( A => dOut_5_port, B => reset, Y => n630);
   U698 : na210 port map( A => n625, B => dOut_steady_5_port, Y => n629);
   U699 : na210 port map( A => n626, B => ram_0_5_port, Y => n611);
   U700 : na310 port map( A => n613, B => n631, C => n632, Y => n284);
   U701 : na210 port map( A => dOut_4_port, B => reset, Y => n632);
   U702 : na210 port map( A => n625, B => dOut_steady_4_port, Y => n631);
   U703 : na210 port map( A => n626, B => ram_0_4_port, Y => n613);
   U704 : na310 port map( A => n615, B => n633, C => n634, Y => n283);
   U705 : na210 port map( A => dOut_3_port, B => reset, Y => n634);
   U706 : na210 port map( A => n625, B => dOut_steady_3_port, Y => n633);
   U707 : na210 port map( A => n626, B => ram_0_3_port, Y => n615);
   U708 : na310 port map( A => n617, B => n635, C => n636, Y => n282);
   U709 : na210 port map( A => dOut_2_port, B => reset, Y => n636);
   U710 : na210 port map( A => n625, B => dOut_steady_2_port, Y => n635);
   U711 : na210 port map( A => n626, B => ram_0_2_port, Y => n617);
   U712 : na310 port map( A => n619, B => n637, C => n638, Y => n281);
   U713 : na210 port map( A => dOut_1_port, B => reset, Y => n638);
   U714 : na210 port map( A => n625, B => dOut_steady_1_port, Y => n637);
   U715 : na210 port map( A => n626, B => ram_0_1_port, Y => n619);
   U716 : na310 port map( A => n621, B => n639, C => n640, Y => n280);
   U717 : na210 port map( A => dOut_0_port, B => reset, Y => n640);
   U718 : na210 port map( A => n625, B => dOut_steady_0_port, Y => n639);
   U719 : no210 port map( A => n603, B => reset, Y => n625);
   U720 : na210 port map( A => n641, B => n572, Y => n603);
   U721 : iv110 port map( A => state, Y => n641);
   U722 : na210 port map( A => n626, B => ram_0_0_port, Y => n621);
   U723 : no310 port map( A => reset, B => state, C => n572, Y => n626);
   U724 : na210 port map( A => do, B => n642, Y => n572);
   U725 : iv110 port map( A => we, Y => n642);

end synthesised;



