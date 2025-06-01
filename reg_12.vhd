library ieee;
use ieee.std_logic_1164.all;

entity reg_N is
   port (ck, load, clr, set: in  std_logic;
   I : in std_logic_vector(9 downto 0);
   q : out std_logic_vector(9 downto 0) 
);
end reg_N;


architecture logica of reg_N is

  component mux_1
     port(
        A  : in std_logic_vector(9 downto 0);
        B  : in std_logic_vector(9 downto 0);
        Sl : in std_logic;
        Y  : out std_logic_vector(9 downto 0)
    );
  end component;

  component ffd
      port (ck, clr, set: in  std_logic;
   	d : in std_logic_vector(9 downto 0);
   	q : out std_logic_vector(9 downto 0)
	);
   
  end component;

  
  signal q_reg, S_mux: std_logic_vector(9 downto 0);	-- Saida do mux


		
begin
	
   S0_MUX: mux_1 port map(
	A  => q_reg,		
        B  => I,
        Sl => load,
        Y  => S_mux
	);

   FF_D: ffd port map( 
	ck => ck,
        clr => clr,
        set => set,
        d => S_mux,
        q => q_reg
	);
  
    q <= q_reg; 
   
end logica;