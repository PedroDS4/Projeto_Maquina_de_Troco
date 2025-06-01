library ieee;
use ieee.std_logic_1164.all;

entity mux_8 is
	port(
		A: in std_logic_vector(9 downto 0);
		B: in std_logic_vector(9 downto 0);
		C: in std_logic_vector(9 downto 0);
		D: in std_logic_vector(9 downto 0);
		E: in std_logic_vector(9 downto 0);
		F: in std_logic_vector(9 downto 0);
		G: in std_logic_vector(9 downto 0);
		H: in std_logic_vector(9 downto 0);

		S: in std_logic_vector(2 downto 0);

		Y_8: out std_logic_vector(9 downto 0)
	);
end mux_8;

architecture CKT of mux_8 is

	signal X: std_logic_vector(1 downto 0);
	signal Y1: std_logic_vector(9 downto 0);
	signal Y2: std_logic_vector(9 downto 0);

	component mux_1
	port(
		A: in std_logic_vector(9 downto 0);
		B: in std_logic_vector(9 downto 0);
		Sl: in std_logic;
		Y: out std_logic_vector(9 downto 0)
	);
	end component;

	component mux_4
	port(
		A: in std_logic_vector(9 downto 0);
		B: in std_logic_vector(9 downto 0);
		C: in std_logic_vector(9 downto 0);
		D: in std_logic_vector(9 downto 0);
		S: in std_logic_vector(1 downto 0);
		Y_4: out std_logic_vector(9 downto 0)
	);
	end component;

begin

	U0: mux_4 port map(
		A => A,
		B => B,
		C => C,
		D => D,
		S => S(1 downto 0),
		Y_4 => Y1
	);

	U1: mux_4 port map(
		A => E,
		B => F,
		C => G,
		D => H,
		S => S(1 downto 0),
		Y_4 => Y2
	);

	U2: mux_1 port map(
		A => Y1,
		B => Y2,
		Sl => S(2),
		Y => Y_8
	);

end CKT;
