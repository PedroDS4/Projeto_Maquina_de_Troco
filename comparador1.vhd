library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador1 is
    port (
        A        : in  std_logic;
        B        : in  std_logic;
        maior_in : in  std_logic;
        igual_in : in  std_logic;
        menor_in : in  std_logic;
        maior    : out std_logic;
        igual    : out std_logic;
        menor    : out std_logic
    );
end comparador1;


architecture CKT of comparador1 is
    signal maior_bit, igual_bit, menor_bit : std_logic;
begin
    maior_bit <= A and not(B);
    igual_bit <= A xnor B;
    menor_bit <= not(A) and B;
 
	
    -- lógica de propagação
    maior <= (maior_in or (igual_in and maior_bit));
    igual <= (igual_in and igual_bit);
    menor <= (menor_in or (igual_in and menor_bit));
end CKT;