

library ieee;
use ieee.std_logic_1164.all;


entity subtrator_8_bit is
	port(

	A,B : in std_logic_vector(9 downto 0);
		
	C_0 : out std_logic;
	S :   out std_logic_vector(9 downto 0)
	);
end subtrator_8_bit;



architecture CKT of subtrator_8_bit is 
	
	
	component somador_1_bit
		port(
			A: in std_logic;
			B: in std_logic;
			C_i: in std_logic;

			C_0: out std_logic;
			S: out std_logic
			);
	end component;

	
	signal c : std_logic_vector(9 downto 0);
		
	signal B_inv : std_logic_vector(9 downto 0);


begin 
	
	B_inv <= not(B);

	S0: somador_1_bit port map(
  	A => A(0),
  	B => B_inv(0),
  	C_i => '1',       -- carry-in inicial
  	C_0 => c(0),      -- carry-out vai pro próximo estágio
  	S => S(0)
);
	S1: somador_1_bit port map(
  	A => A(1),
  	B => B_inv(1),
  	C_i => c(0),
  	C_0 => c(1),
  	S => S(1)
);
	S2: somador_1_bit port map(
  	A => A(2),
  	B => B_inv(2),
  	C_i => c(1),
  	C_0 => c(2),
  	S => S(2)
);
	S3: somador_1_bit port map(
  	A => A(3),
  	B => B_inv(3),
  	C_i => c(2),
  	C_0 => c(3),
  	S => S(3)
);
	S4: somador_1_bit port map(
  	A => A(4),
  	B => B_inv(4),
  	C_i => c(3),
  	C_0 => c(4),
  	S => S(4)
);
	S5: somador_1_bit port map(
  	A => A(5),
  	B => B_inv(5),
  	C_i => c(4),
  	C_0 => c(5),
  	S => S(5)
);
	S6: somador_1_bit port map(
  	A => A(6),
  	B => B_inv(6),
  	C_i => c(5),
  	C_0 => c(6),
  	S => S(6)
);
	S7: somador_1_bit port map(
  	A => A(7),
  	B => B_inv(7),
  	C_i => c(6),
  	C_0 => c(7),
  	S => S(7)
);
	S8: somador_1_bit port map(
  	A => A(8),
  	B => B_inv(8),
  	C_i => c(7),
  	C_0 => c(8),
  	S => S(8)
);
	S9: somador_1_bit port map(
  	A => A(9),
  	B => B_inv(9),
  	C_i => c(8),
  	C_0 => c(9),
  	S => S(9)
);
	C_0 <= c(9);

end CKT;