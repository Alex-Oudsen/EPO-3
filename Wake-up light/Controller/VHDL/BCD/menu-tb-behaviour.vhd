--In case of doubt, blame Kevin.
--
--In case of no-doubt, follow the following procedure:
--Assume the state of no-mind using ancient Japanese techniques,
--If that does not take away no-doubt, beat the shit out of a brick (or stone) wall;
--If that does not work, acquaintance one´s face with a heavy metal object, preferably a chair.

--Then, blame Kevin.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

architecture behaviour of menu_test is
component menu is        --component initialiseren, met de volgende in/uitgangen:
    port(clk        :in        std_logic;
        reset        :in        std_logic;
        knoppen        :in        std_logic_vector    (3 downto 0);    --dit zijn de fysieke knoppen
        wekdata        :in        std_logic_vector    (15 downto 0);    --komt bij het register vandaan
        enable        :out    std_logic;
        wekker        :out    std_logic_vector    (15 downto 0);
        menu_signal    :out    std_logic_vector    (2 downto 0)); --voor de LCD'
end component menu;

signal clk, reset, enable    :    std_logic;
signal menu_signal            :    std_logic_vector (2 downto 0);
signal knoppen,minuten_enkel,uren_enkel            :    std_logic_vector (3 downto 0);        --signalen voor de port map
signal wekdata, wekker        :    std_logic_vector (15 downto 0);
--signal uren            :    std_logic_vector (5 downto 0);
--signal minute            :    std_logic_vector (6 downto 0);
signal uren_dubdle        :    std_logic_vector (1 downto 0);
signal minuten_duble        :    std_logic_vector (2 downto 0);

begin
    clk        <=    '1' after 0 ns,
            '0' after 80 ns when clk /= '0' else '1' after 80 ns;

    reset    <=    '1' after 0 ns,            --knoppen(0) = menu;
            '0' after 62 ns;            --knoppen(1) = set;
                                        --knoppen(2) = up;
    knoppen <=    "0000" after 0 ns,        --knoppen(3) = down.
            "0100" after 308 ns,        --state rust -> wekker_toggle
            "0000" after 468 ns,        --FOR DA KNOPJES & wekker_toggle > rust)

            "1000" after 628 ns,        --rust -> wekkertijd
            "0000" after 788 ns,        --FOR DA KNOPJES
            "1000" after 948 ns,        --wekkertijd -> rust
            "0000" after 1108 ns,        --FOR DA KNOPJES

            "1000" after 1268 ns,        --rust -> wekkertijd
            "0000" after 1428 ns,        --FOR DA KNOPJES
            "0100" after 1588 ns,        --wekkertijd -> tijd_uren
            "0000" after 1748 ns,        --FOR DA KNOPJES
            "1000" after 1908 ns,        --tijd_uren -> rust
            "0000" after 2068 ns,        --FOR DA KNOPJES

            "1000" after 2228 ns,        --rust -> wekkertijd
            "0000" after 2388 ns,        --FOR DA KNOPJES
            "0100" after 2548 ns,        --wekkertijd -> tijd_uren
            "0000" after 2708 ns,        --FOR DA KNOPJES
            "0010" after 2868 ns,        --tijd_uren -> uren_plus (critical high)    OUTPUT_CHECK
            "0000" after 3028 ns,        --FOR DA KNOPJESCH (uren_plus -> tijd_uren)
            "0001" after 3188 ns,        --tijd_uren -> uren_min     (critical low)        OUTPUT_CHECK
            "0000" after 3348 ns,        --FOR DA KNOPJES (uren_min -> tijd_uren)
            "1000" after 3508 ns,        --tijd_uren -> rust
            "0000" after 3668 ns,        --FOR DA KNOPJES
            "1000" after 3828 ns,        --rust -> wekkertijd
            "0000" after 3988 ns,        --FOR DA KNOPJES
            "0100" after 4148 ns,        --wekkertijd -> tijd_uren
            "0000" after 4308 ns,        --FOR DA KNOPJESCH
            "0100" after 4468 ns,        --tijd_uren -> tijd_minuten
            "0000" after 4628 ns,        --FOR DA KNOPJESCH
            "0010" after 4788 ns,        --tijd_minuten -> minuten_plus        OUTPUT_CHECK
            "0000" after 4948 ns,        --FOR DA KNOPJES (minuten_plus -> tijd_minuten)
            "0001" after 5108 ns,        --tijd_minuten -> minuten_min        OUTPUT_CHECK
            "0000" after 5268 ns,        --FOR DA KNOPJES (min_min -> tijd_min)
            "1000" after 5428 ns,        --minuten_min -> rust
            "0000" after 5588 ns,        --FOR DA KNOPJES
            "1000" after 5748 ns,        --rust -> wekkertijd
            "0000" after 5908 ns,        --FOR DA KNOPJES
            "0100" after 6068 ns,        --wekkertijd -> tijd_uren
            "0000" after 6228 ns,        --FOR DA KNOPJES
            "0100" after 6388 ns,        --tijd_uren -> tijd_minuten
            "0000" after 6548 ns,        --FOR DA KNOPJES
            "0100" after 6708 ns,        --tijd_minuten -> rust
            "0000" after 6868 ns,        --FOR DA KNOPJES

            "1000" after 7028 ns,        --rust -> wekkertijd
            "0000" after 7188 ns,        --FOR DA KNOPJES
            "0010" after 7348 ns,        --wekkertijd -> geluid
            "0000" after 7508 ns,        --FOR DA KNOPJES
            "0010" after 7668 ns,        --geluid -> licht
            "0000" after 7828 ns,        --FOR DA KNOPJESCH
            "0010" after 7988 ns,        --licht -> wekkertijd
            "0000" after 8148 ns,        --FOR DA KNOPJESCH
            "0001" after 8308 ns,        --wekkertijd -> licht
            "0000" after 8468 ns,        --FOR DA KNOPJESCH
            "0001" after 8626 ns,        --licht -> geluid
            "0000" after 8788 ns,        --FOR DA KNOPJESCH
            "0001" after 8948 ns,        --geluid -> wekkertijd
            "0000" after 9108 ns,        --FOR DA KNOPSCHEN

            "0010" after 9268 ns,        --wekkertijd -> geluid
            "0000" after 9428 ns,        --FOR DA KNOPSCHEN
            "0100" after 9588 ns,        --geluid -> geluid_toggle
            "0000" after 9748 ns,        --FOR DA KNOPSCHEN (geluid_toggle -> geluid)
            "1000" after 9908 ns,        --geluid -> rust
            "0000" after 10068 ns,        --FOR DA KNOPSCHEN
            "1000" after 10228 ns,        --rust -> wekkertijd
            "0000" after 10388 ns,        --FOR DA KNOPSCHEN
            "0001" after 10548 ns,        --wekkertijd -> led
            "0000" after 10708 ns,        --FOR DA KNOPSCHEN
            "0100" after 10868 ns,        --led -> led_toggle
            "0000" after 11028 ns,        --FOR DA KNOPSCHEN (led_toggle -> led)
            "1000" after 11188 ns,        --led -> rust
            "0000" after 11348 ns,        --FOR DA KNOPSCHEN
            "1000" after 11668 ns,        --rust -> wekkertijd
            "0000" after 11828 ns,        --FOR DA KNOPSCHEN
            "0100" after 11988 ns,        --wekkertijd -> uren_set
            "0000" after 12148 ns,        --FOR DA KNOPSCHEN
            "0010" after 12308 ns,        --uren_set -> uren_plus  
            "0000" after 12468 ns,        --FOR DA KNOPSHCEN (uren_plus -> uren_set) OUTPUT CHECK
            "0001" after 12628 ns,        --uren_set -> uren_min
            "0000" after 12788 ns,        --FOR DA KNOPSCHEN (uren_min -> uren_set)
            "0100" after 12948 ns,        --uren_set -> minuten_set
            "0000" after 13108 ns,        --FOR KNOPSCHEN
            "0010" after 13268 ns,        --minuten_set -> minuten_plus
            "0000" after 13428 ns,        --FOR KNOP (minuten_plus -> minuten_set)
            "0001" after 14588 ns,        --minuten_set -> minuten_min
            "0000" after 13748 ns;        --FOR DA KNOPSHCNE (minuten_min -> minuten_set) OUTPUTCHECK


            --Wekdata: van links naar rechts, 3 + 2 + 4 + 3 + 4
    wekdata <= "1111000111011001" after 308 ns, --crit. point HIGH
            "1110000000000000" after 3188 ns, --crit. point LOW
            "1111000111011001" after 4788 ns, --crit. point HIGH
            "111 00 0000 000 0000" after 5108 ns,     --crit. point LOW
            "111 01 1001 000 0000" after 12308 ns,
            "111 00 0000 000 0000" after 12628 ns,
            "111 00 0000 000 1001" after 13108 ns,
            "111 00 0000 100 0000" after 13588 ns;



 ---?   uren <= wekker(12 downto 7);
  ---?  minuten <= wekker(6 downto 0);
--111 10 0011 101 1001 critical point HIGH

--111 00 0000 000 0000 critical point LOW

    menu_pm: menu port map(clk, reset, knoppen, wekdata, enable, wekker, menu_signal); --de daadwerkelijke port map
end architecture;
