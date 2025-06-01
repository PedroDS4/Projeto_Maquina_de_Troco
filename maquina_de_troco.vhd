library ieee;
use ieee.std_logic_1164.all;


entity maquina_de_troco is
   port (
        V : in std_logic_vector(9 downto 0);
        T : in std_logic;
        c : in std_logic_vector(5 downto 0);
        clk : in std_logic;
        L : out std_logic;
        i:  out std_logic_vector(5 downto 0);
        d_i: out std_logic;
	V_actual : out std_logic_vector(9 downto 0)
);
end maquina_de_troco;




architecture CKT of maquina_de_troco is
        

	signal s: std_logic_vector(2 downto 0);
	signal d: std_logic_vector(5 downto 0);
   	signal clock: std_logic;
   	signal sub, T_barrado: std_logic;
	
	component datapath
	port (
        V : in std_logic_vector(9 downto 0);
        s : in std_logic_vector(2 downto 0);
        sub: in std_logic;
        T : in std_logic;
        clk : in std_logic;	
        d: out std_logic_vector(5 downto 0);
        d_i: out std_logic;
	V_actual: out std_logic_vector(9 downto 0)
	);
	end component; 


	component controller
	port(
        clk : in std_logic;
        T   : in std_logic;
        d   : in std_logic_vector(5 downto 0);
        C   : in std_logic_vector(5 downto 0);
        L   : out std_logic;
	sub: out std_logic;
        i   : out std_logic_vector(5 downto 0);
        s   : out std_logic_vector(2 downto 0)
    );
	end component;

	component ck_div
	port(
	ck_in  : in  std_logic;
	ck_out : out  std_logic
	);
    	end component;


begin
    
	T_barrado <= T;
	
	--FREQ_DIV: ck_div 
	--       port map(
	--	  ck_in => clk,
	--	  ck_out => clock
	-- );

 	clock <= clk;

    
	DATAPATH_CIRCUIT: datapath 
		port map(
     	        V => V,
		s => s,
                sub => sub,
		T => T_barrado,
		clk => clock,
		d => d,
                d_i => d_i,
                V_actual => V_actual
	);

	CONTROLLER_CIRCUIT: controller
		port map(
		clk => clock,
		T => T_barrado,
		d => d,
		C => c,
		L => L,
                sub => sub,
		i => i,
		s => s
	);

	
	  
end CKT;