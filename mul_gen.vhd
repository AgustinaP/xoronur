------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--          multiplucación genérica           --
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

entity mul_gen is
  generic(N: integer:=4);
  port (a,b:   in  std_logic_vector((N-1) downto 0);
        mul:   out std_logic_vector(N downto 0);
        error: out std_logic;
        enable:in  std_logic);   
end mul_gen;

architecture Behavioral of mul_gen is
    signal a_ext,b_ext: signed((N-1) downto 0);
    signal mul_ext:   signed((2*N-1) downto 0);
begin
    a_ext <=signed(a);
    b_ext <=signed(b);
    mul_ext <= a_ext * b_ext;
     with enable select
       mul <= std_logic_vector(mul_ext(N downto 0)) when '1',
               (others=>'0') when others;
    
   error <= '1' when (abs(mul_ext)> 2**N) AND (enable = '1') else
            '0';
			

end Behavioral;
