library ieee;
use ieee.std_logic_1164.all;


entity decoder_3x6 is
   port (
        en : in std_logic;
        s : in std_logic_vector(2 downto 0);

        d : out std_logic_vector(5 downto 0)
);
end decoder_3x6;




architecture CKT of decoder_3x6 is


begin
    
    d(0) <= en and not(s(2)) and not(s(1)) and not(s(0));
    d(1) <= en and not(s(2)) and not(s(1)) and s(0);
    d(2) <= en and not(s(2)) and s(1) and not(s(0));
    d(3) <= en and not(s(2)) and s(1) and s(0);
    d(4) <= en and s(2) and not(s(1)) and not(s(0));
    d(5) <= en and s(2) and not(s(1)) and s(0);	
    ---d(5) <= en and s(2) and s(1) and s(0);

end CKT;
