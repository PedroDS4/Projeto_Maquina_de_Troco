library ieee;
use ieee.std_logic_1164.all;



entity datapath is

   port (

        V : in std_logic_vector(9 downto 0);

        s : in std_logic_vector(2 downto 0);

        sub: in std_logic;

        T : in std_logic;

        clk : in std_logic;

        d: out std_logic_vector(5 downto 0);

            d_i: out std_logic;

        V_actual : out std_logic_vector(9 downto 0)

);

end datapath;











architecture CKT of datapath is







    signal V_reg, V_mux,V_future : std_logic_vector(9 downto 0);

    signal V_SUB,M0,M1,M2,M3,M4,M5,M_i     : std_logic_vector(9 downto 0);

    signal Sl_sub, d_i_p, not_d_i, ck: std_logic;

    signal d_p,d_i_vec : std_logic_vector(5 downto 0);



    component mux_1

      port(

        A  : in std_logic_vector(9 downto 0);

        B  : in std_logic_vector(9 downto 0);

        Sl : in std_logic;

        Y  : out std_logic_vector(9 downto 0)

    );

    end component;



    component mux_8

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

    end component;







    component reg_N

      port (ck, load, clr, set: in  std_logic;

    I : in std_logic_vector(9 downto 0);

    q : out std_logic_vector(9 downto 0) 

     );

     end component;




    component decoder_3x6

      port (

        en : in std_logic;

        s : in std_logic_vector(2 downto 0);

        d : out std_logic_vector(5 downto 0)

);

     end component;





   component comparador_12

     port (

        A      : in  std_logic_vector(9 downto 0);

        B      : in  std_logic_vector(9 downto 0);

        maior  : out std_logic;

        igual  : out std_logic;

        menor  : out std_logic

    );

     end component; 





   component subtrator_8_bit

     port(

	A,B : in std_logic_vector(9 downto 0);


	C_0 : out std_logic;

	S :  out std_logic_vector(9 downto 0)

	);

     end component; 











begin





    



     MUX_LOAD: mux_1 port map(

          A => V_future,

  	       B => V,

          Sl => T,

          Y => V_mux

         );

    

     V_REGISTER: reg_N port map(

         ck => clk,

         load => '1',

         clr => '0',

         set => '0',

         I => V_mux,

q => V_reg

        );



     M0_REG: reg_N port map(

         ck => clk,

         load => T,

         clr => '0',

         set => '0',

         I => "0001100100",

q => M0

        );



      M1_REG: reg_N port map(

         ck => clk,

         load => T,

         clr => '0',

         set => '0',

         I => "0000110010",

q => M1

        );

      

      M2_REG: reg_N port map(

         ck => clk,

         load => T,

         clr => '0',

         set => '0',

         I => "0000011001",

q => M2

        );



      M3_REG: reg_N port map(

         ck => clk,

         load => T,

         clr => '0',

         set => '0',

         I => "0000001010",

              q => M3

        );



      M4_REG: reg_N port map(

         ck => clk,

         load => T,

         clr => '0',

         set => '0',

         I => "0000000101",

              q => M4

        );

 

          M5_REG: reg_N port map(

         	ck => clk,

         	load => T,

         	clr => '0',

         	set => '0',

        	I => "0000000001",

		q => M5

        );



	mux_M_i: mux_8 port map(
	
	  A => M0,

	  B => M1,

	  C => M2,

	  D => M3,

	  E => M4,

	  F => M5,

	  G => "0000000000",

	  H => "0000000000",
	
	  S => s,

	  Y_8 => M_i

	); 





      SUBTRATOR: subtrator_8_bit port map(

          A => V_reg,

          B => M_i,

          C_0 => open,

          S => V_SUB

         );

 

       COMPARADOR_10_bits: comparador_12 port map(

          A => V_reg,

          B => M_i,

          maior => open,

          igual => open,

          menor => d_i_p

         );



       Sl_sub <= sub;


       MUX_1_SUB_OR_REG: mux_1 port map(

          A => V_reg,

               B => V_sub,

          Sl => Sl_sub,

          Y => V_future

		);


      not_d_i <= not(d_i_p);


      Decoder_3x6_d: decoder_3x6 port map(

         --en => d_i,

  	      en => '1',

         s => s,

         d => d_p

        );


	generate_d_i_vec : for i in 5 downto 0 generate

            d_i_vec(i) <= d_i_p;

     end generate;


	d <= d_p and d_i_vec;

	d_i <= d_i_p;

	V_actual <= V_reg;





end CKT;