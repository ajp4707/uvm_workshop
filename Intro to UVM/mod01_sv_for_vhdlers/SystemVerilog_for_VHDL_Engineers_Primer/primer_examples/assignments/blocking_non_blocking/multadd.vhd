LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY multadd_vhdl IS
   PORT( 
      a      : IN     std_logic_vector ( 7 DOWNTO 0 );
      b      : IN     std_logic_vector ( 7 DOWNTO 0 );
      c      : IN     std_logic_vector ( 7 DOWNTO 0 );
      d      : IN     std_logic_vector ( 7 DOWNTO 0 );
      clk    : IN     std_logic;
      rst_n  : IN     std_logic;
      mulsum : OUT    std_logic_vector ( 16 DOWNTO 0 )
   );

-- Declarations

END multadd_vhdl ;

--
ARCHITECTURE rtl OF multadd_vhdl IS
shared variable ab : std_logic_vector (15 downto 0) ;
shared variable cd :	std_logic_vector( 15	downto 0) ; 
shared variable ab_cd : std_logic_vector(16 downto 0);
BEGIN

 mul_add_logic : process ( A , B, C, D) 

			begin 
				ab :=	A * B; 
				cd := C * D;
				ab_cd := ("0"&ab) + ("0"&cd);
			end process;
			
 mul_add_reg : process (clk)
      begin
        if rst_n = '0' then       
             mulsum <= "00000000000000000";
        elsif clk'event and clk = '1' then  
             mulsum <= ab_cd;
        end if;
      end process;  
END ARCHITECTURE rtl;

