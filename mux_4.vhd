
library ieee;
use ieee.std_logic_1164.all;


entity mux_4 is
	port(
	A: in std_logic_vector(9 downto 0);
	B: in std_logic_vector(9 downto 0);
	C: in std_logic_vector(9 downto 0);
	D: in std_logic_vector(9 downto 0);

	-----Chaves-----
	S : in std_logic_vector(1 downto 0);

	Y_4 :   out std_logic_vector( 9 downto 0) 
	);
end mux_4;


architecture CKT of mux_4 is 

	signal X1: std_logic_vector(9 downto 0);
	signal X2: std_logic_vector(9 downto 0);

	component mux_1
	port(
		A: in std_logic_vector(9 downto 0);
		B: in std_logic_vector(9 downto 0);
		Sl: in std_logic;
		Y: out std_logic_vector(9 downto 0)
		);
	end component;

	

begin 
	U0: mux_1 port map(
	A => A,
	B => B,
	Sl => S(0),
	Y => X1
	);
	
	U1: mux_1 port map(
	A => C,
	B => D,
	Sl => S(0),
	Y => X2
	);
	
	U2: mux_1 port map(
	A => X1,
	B => X2,
	Sl => S(1),
	Y => Y_4
	);
	
	
end CKT;