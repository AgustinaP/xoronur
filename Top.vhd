------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--                    Top                     --
------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OPCION:in STD_LOGIC_VECTOR(1 downto 0);
           SALIDA : out STD_LOGIC_VECTOR (4 downto 0);
           ERROR : out STD_LOGIC);
end Top;

architecture Behavioral of Top is
    -----SEÑALES------
    signal a_c2,b_c2, s_enable: std_logic_vector(3 downto 0);
    signal s_sum,s_res,s_mul,s_eq,s_salida: std_logic_vector(4 downto 0);
    
    
    ----COMPONENTES----
    --complemento a 2--
    component a_compl2 is 
      generic(N: integer:=4);
      port (entrada:  in  std_logic_vector(N-1 downto 0);
            salida: out std_logic_vector(N-1 downto 0));
    end component;
    --suma generica--
    component sum_gen is
       generic(N: integer:= 4);
       port(
            a,b: in std_logic_vector(N-1 downto 0);
            suma: out std_logic_vector(N downto 0);
            enable: in std_logic
            );
    end component;
    --resta generica--
    component res_gen is
       generic(N: integer:= 4);
       port(
            a,b: in std_logic_vector(N-1 downto 0);
            resta: out std_logic_vector(N downto 0);
            enable: in std_logic
            );
     end component;
     --mul generica--
     component mul_gen is
        generic(N: integer:=4);
        port (a,b:  in  std_logic_vector((N-1) downto 0);
              mul: out std_logic_vector(N downto 0);
              error: out std_logic;
              enable: in std_logic);   
     end component;
     --igualdad generica--
     component equal_gen is
        generic(N: integer:=4);
        port (a,b:  in  std_logic_vector((N-1) downto 0);
              eq: out std_logic_vector(N downto 0);
              enable: in std_logic);
     end component;   
    
begin
    
    
    a_compl2_A: a_compl2
        port map(entrada=>A,salida=>a_c2);
        
    a_compl2_B: a_compl2
        port map(entrada=>B,salida=>b_c2);
        
    a_compl2_salida: a_compl2
        generic map(N=>5)
        port map(entrada=>s_salida,salida=>SALIDA);
        
    
     with OPCION select
      s_enable <= "0001" when "00",
                  "0010" when "01",
                  "0100" when "10",
                  "1000" when others;
	
	 with OPCION select
	  s_salida <= s_sum when "00",
                  s_res when "01",
                  s_mul when "10",
                  s_eq when others;
       
     sum_gen_1: sum_gen
        port map(a=>a_c2,b=>b_c2,enable=>s_enable(0),suma=>s_sum);
     
     res_gen_1: res_gen
        port map(a=>a_c2,b=>b_c2,enable=>s_enable(1),resta=>s_res);   
    
     mul_gen_1: mul_gen
        port map(a=>a_c2,b=>b_c2,enable=>s_enable(2),error=>ERROR,mul=>s_mul);    
     
     equal_gen_1: equal_gen
        port map(a=>a_c2,b=>b_c2,enable=>s_enable(3),eq=>s_eq);
        
     

end Behavioral;
