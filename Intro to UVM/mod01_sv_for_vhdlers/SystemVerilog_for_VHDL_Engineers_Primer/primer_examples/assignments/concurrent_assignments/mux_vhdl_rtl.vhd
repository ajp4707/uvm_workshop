LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY mux_vhdl IS
   PORT( 
      a       : IN     std_logic_vector ( 7 DOWNTO 0 );
      b       : IN     std_logic_vector ( 7 DOWNTO 0 );
      sel     : IN     std_logic;
      dat_out : OUT    std_logic_vector ( 7 DOWNTO 0 )
   );

-- Declarations

END mux_vhdl ;

--
ARCHITECTURE rtl OF mux_vhdl IS
BEGIN
  dat_out <=  a when (sel = '1') else b; 
END ARCHITECTURE rtl;

