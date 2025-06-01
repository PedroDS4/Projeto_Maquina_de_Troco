library ieee;
use ieee.std_logic_1164.all;

entity mux_1 is
    port(
        A  : in std_logic_vector(9 downto 0);
        B  : in std_logic_vector(9 downto 0);
        Sl : in std_logic;
        Y  : out std_logic_vector(9 downto 0)
    );
end mux_1;

architecture CKT of mux_1 is
    signal sl0 : std_logic_vector(9 downto 0);
    signal sl1 : std_logic_vector(9 downto 0);
begin
    sl0 <= (others => not Sl);
    sl1 <= (others => Sl);

    Y <= (A and sl0) or (B and sl1);
end CKT;
