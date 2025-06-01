library ieee;
use ieee.std_logic_1164.all;


entity somador_1_bit is
	port(

	A : in std_logic;
	B : in std_logic;
	C_i : in std_logic;
	
	C_0 : out std_logic;
	S :   out std_logic 
	);
end somador_1_bit;


architecture CKT of somador_1_bit is 
begin 
	C_0 <= ((A xor B) and C_i) or (A and B);
	S <= A xor B xor C_i;

end CKT;
