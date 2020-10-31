------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--               suma genérica                --
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

entity sum_gen is
    generic(N: integer:= 4);
       port(
            a,b: in std_logic_vector(N-1 downto 0);
            suma: out std_logic_vector(N downto 0);
            enable: in std_logic
            );
       
    
end sum_gen;

architecture Behavioral of sum_gen is
    signal a_ext, b_ext,suma_ext: signed(N downto 0);
begin
    a_ext <= signed(a(N-1) & a);
    b_ext <= signed(b(N-1) & b);
    suma_ext <= a_ext + b_ext;
    
   with enable select
      suma <=  std_logic_vector(suma_ext) when '1',
               (others=>'0') when others;
   -- suma <= std_logic_vector(suma_ext(N-1 downto 0));
    
 


end Behavioral;
