------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--              igualdad genérica             --
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

entity equal_gen is
  generic(N: integer:=4);
  port (a,b:  in  std_logic_vector((N-1) downto 0);
        eq: out std_logic_vector(N downto 0);
        enable: in std_logic);   
end equal_gen;

architecture Behavioral of equal_gen is
    signal a_ext,b_ext: signed((N-1) downto 0);
    signal s_eq: std_logic_vector(N downto 0);
begin
    a_ext <=signed(a);
    b_ext <=signed(b);
    
    
   s_eq <= (others=>'1') when a_ext = b_ext else
           (others=>'0');
			
    
    with enable select
       eq <= s_eq when '1',
               (others=>'0') when others;
 

end Behavioral;
