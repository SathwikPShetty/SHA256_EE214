library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity TestBench is
end entity;
architecture Behave of TestBench is

component Block3 is
    port (Wt : in STD_LOGIC_VECTOR(31 downto 0);clock:in std_logic;h : out STD_LOGIC_VECTOR(31 downto 0));
end component Block3;

signal clk50: std_logic_vector(31 downto 0):= "01000010100000000000000000000000";
--signal clk51: std_logic_vector(20 downto 0):= "00000000000000000000111111111010";
--signal clk52: std_logic_vector(20 downto 0):= "00000000000000000000000000000000";
signal v: std_logic:= '0';
signal A: integer:=0;
signal clkout: std_logic_vector(31 downto 0);
constant clkper:time:= 20 ns;
begin
     student: Block3 port map(Wt => clk50, clock => v, h => clkout);
clc: process(v,clk50)
     begin
	  v <= not v after clkper/2;
	  A <= A + 1 after clkper;
	  if(A=15) then
	  clk50 <= clk50 + "00000000000000000000000000001000" after clkper;
	  else
	  clk50 <= "00000000000000000000000000000000" after clkper;
	  end if;
	  end process;
end Behave;
	  