library ieee;
use ieee.std_logic_1164.all;

entity controller is
    port(
        clk : in std_logic;
        T   : in std_logic;
        d   : in std_logic_vector(5 downto 0);
        C   : in std_logic_vector(5 downto 0);
        L   : out std_logic;
        sub : out std_logic;
        i   : out std_logic_vector(5 downto 0);
        s   : out std_logic_vector(2 downto 0)
    );
end controller;

architecture CKT of controller is
    type st is (S0, M0, SUB0, M1, SUB1, M2, SUB2, M3, SUB3, M4, SUB4, M5, SUB5);
    signal estado : st := S0;
begin

    process(clk)
    begin
        if clk' event and clk = '1' then
            case estado is
                when S0 =>
                    if T = '1' then
                        estado <= M0;
                    else
                        estado <= S0;
                    end if;

                when M0 =>
                    if d(0) = '0' and C(0) = '1' then
                        estado <= SUB0;
                    else
                        estado <= M1;
                    end if;

                when SUB0 =>
                    estado <= M0;

                when M1 =>
                    if d(1) = '0' and C(1) = '1' then
                        estado <= SUB1;
                    else
                        estado <= M2;
                    end if;

                when SUB1 =>
                    estado <= M1;

                when M2 =>
                    if d(2) = '0' and C(2) = '1' then
                        estado <= SUB2;
                    else
                        estado <= M3;
                    end if;

                when SUB2 =>
                    estado <= M2;

                when M3 =>
                    if d(3) = '0' and C(3) = '1' then
                        estado <= SUB3;
                    else
                        estado <= M4;
                    end if;

                when SUB3 =>
                    estado <= M3;

                when M4 =>
                    if d(4) = '0' and C(4) = '1' then
                        estado <= SUB4;
                    else
                        estado <= M5;
                    end if;

                when SUB4 =>
                    estado <= M4;

                when M5 =>
                    if d(5) = '0' and C(5) = '1' then
                        estado <= SUB5;
                    else
                        estado <= S0;
                    end if;

                when SUB5 =>
                    estado <= M5;

                when others =>
                    estado <= S0;
            end case;
        end if;
    end process;

    -- Sinal L ativo apenas durante operação (exceto S0)
    L <= '1' when estado /= S0 else '0';

    -- Saída i: ativa apenas durante estados de subtração
    with estado select
        i <= "000001" when SUB0,
             "000010" when SUB1,
             "000100" when SUB2,
             "001000" when SUB3,
             "010000" when SUB4,
             "100000" when SUB5,
             (others => '0') when others;

    -- Ativa subtração somente nos estados SUBx
    sub <= '1' when estado = SUB0 or estado = SUB1 or estado = SUB2 or
                      estado = SUB3 or estado = SUB4 or estado = SUB5 else '0';

    -- Estado atual codificado em s
    with estado select
    	s <= 	"000" when M0,
         	"000" when SUB0,
         	"001" when M1,
         	"001" when SUB1,
         	"010" when M2,
         	"010" when SUB2,
         	"011" when M3,
         	"011" when SUB3,
         	"100" when M4,
         	"100" when SUB4,
         	"101" when M5,
         	"101" when SUB5,
         	"111" when S0,
         	"111" when others;

end architecture;

