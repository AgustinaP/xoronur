------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
-- Conversor número y signo a complemento a 2 --
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

entity a_compl2 is
  generic(N: integer:=4);
      port (entrada:  in  std_logic_vector(N-1 downto 0);
            salida: out std_logic_vector(N-1 downto 0));
end a_compl2;

architecture Behavioral of a_compl2 is
       signal s_entrada: std_logic_vector(N downto 0);
begin
    
   with entrada(N-1) select
      salida <= entrada when '0',
                 s_entrada(N-1 downto 0) when others;
	  s_entrada <= std_logic_vector(to_unsigned(2**N,N+1)-("00" & unsigned(entrada(N-2 downto 0)))); 
	         --signed(not('0' & ent(N-1 downto 0))) + 1
end Behavioral;
