------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--               resta genérica               --
------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity res_gen is
    generic(N: integer:= 4);
       port(
            a,b: in std_logic_vector(N-1 downto 0);
            resta: out std_logic_vector(N downto 0);
            enable: in std_logic
            );
       
    
end res_gen;

architecture Behavioral of res_gen is
    signal a_ext, b_ext,resta_ext: signed(N downto 0):=(others=>'0');
begin
    a_ext <= signed(a(N-1) & a);
    b_ext <= signed(b(N-1) & b);
    resta_ext <= a_ext - b_ext;
    
   with enable select
      resta <=  std_logic_vector(resta_ext) when '1',
               (others=>'0') when others;
   -- suma <= std_logic_vector(suma_ext(N-1 downto 0));
    
 


end Behavioral;
