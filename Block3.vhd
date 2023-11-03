library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
library work;
use work.Gates.all;

entity Block3 is
    port (Wt : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;h : out STD_LOGIC_VECTOR(31 downto 0));
end Block3;

architecture bhv of Block3 is
	 signal o1,o2, o3, o4, o5, o6, o7, o8: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
    signal T2, T1,t3, t4, t5, t6, t7, t8, Wt0: std_logic_vector(31 downto 0);
	 signal Wti, Wtj: std_logic_vector(31 downto 0);
	 signal notclock, choose, key : std_logic;
begin
a6: Count3 port map(clock => clock, Y => choose);
a7: plex port map(A => notclock, B => '1', L => choose, Y => key);
a8: Registo port map(A => Wt, clock => clock, reset => '0', Q => Wtj);
a9: Registo port map(A => Wtj, clock => notclock, reset => '0', Q => Wti);
a4: INVERTER port map(A => clock, Y => notclock);
a5: Blocks12 port map(A => Wti, clock => key, Y => Wt0);
a1: abcData port map(ai => o1, bi => o2, ci => o3, di => o4, ei => o5, fi => o6, gi => o7, hi => o8, clock => notclock, a => t1, b => t2, c => t3, d => t4, e => t5, f => t6, g => t7, h => t8);
a2: Compress port map(ai => t1, bi => t2, ci => t3, di => t4, ei => t5, fi => t6, gi => t7, hi => t8, Wt => Wt0, clock => clock, a => o1, b => o2, c => o3, d => o4, e => o5, f => o6, g => o7, h => o8);
a3:  h <= o8;
end bhv;
	  