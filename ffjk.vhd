library ieee;
use ieee.std_logic_1164.all;

entity ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end ffjk;

architecture logica of ffjk is

signal qS : std_logic;

begin
   process(ck, clr, set)
   begin
      if    (set = '0')            then qS <= '1';
      elsif (clr = '0')            then qS <= '0';
      elsif (ck'event and ck ='1') then 
     	   if    j='1' and k = '1' then qS <= not qS;
     	   elsif j='1' and k = '0' then qS <= '1';  
     	   elsif j='0' and k = '1' then qS <= '0';
         end if;   
      end if;   
   end process;   
   q <= qS;
end logica;
