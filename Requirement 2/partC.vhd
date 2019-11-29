LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY partC is
GENERIC (n : integer := 8);
	port(	a: in std_logic_vector(n-1 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0) );
END ENTITY partC;


ARCHITECTURE arch3 OF partC IS
BEGIN

f <=  std_logic_vector(shift_right(signed(a), 1) )  when (sel="00")
else	( a(0) & a(n-1 downto 1) ) when ( sel="01")
else	( cin & a(n-1 downto 1) ) when ( sel="10")
else	( std_logic_vector(shift_right(unsigned(a), 1) ) ) when ( sel="11") ;


cout <= ('U' ) when ( sel="00" )
else ( a(0) ) when ( sel="01")
else ( a(0) ) when ( sel="10")
else ('U') when ( sel="11");

END arch3;