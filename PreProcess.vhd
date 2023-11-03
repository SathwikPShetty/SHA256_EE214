library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity PreProcess is
port(A:in std_logic_vector(255 downto 0);
Y: out std_logic_vector(511 downto 0));
end PreProcess;
architecture bhv of PreProcess is
---------------Define state type here-----------------------------
---------------Define signals of state type-----------------------
signal B: std_logic_vector(511 downto 0);
signal C: INTEGER := 0;
signal ao: std_logic_vector(63 downto 0);
begin
clock_proc:process(A)
begin
	oo: for i in 0 to 255 loop
	B(511-i) <= A(i);
	if(A(i)='1') then
	C <= i;
	end if;
	end loop;
	ooO: for k in 0 to 511 loop
	next when k > C;
	Y(k) <= B(511-C+k);
	end loop;
	Y(C+1) <= '1';
	Oooo: for j in 0 to 447 loop
	next when j < C + 2;
   Y(j) <= '0';
   end loop;
   ao <= std_logic_vector(to_unsigned((C),64));
   OoooO: for l in 0 to 63 loop
   Y(l+448) <= a(l) ;
   end loop;
end process;
end bhv;