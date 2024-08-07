LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY adder IS
   PORT( 
      A     : IN     std_logic_vector ( 7 DOWNTO 0 );
      B     : IN     std_logic_vector ( 7 DOWNTO 0 );
      clk   : IN     std_logic;
      rst_n : IN     std_logic;
      carry : OUT    std_logic;
      sum   : OUT    std_logic_vector ( 7 DOWNTO 0 )
   );

END adder ;

ARCHITECTURE rtl OF adder IS
  signal sum_int : std_logic_vector (8 downto 0);
  signal A8      : std_logic_vector (8 downto 0);
  signal B8      : std_logic_vector (8 downto 0);
  
BEGIN
   
   A8 <= "0" & A;
   B8 <= "0" & B;
   sum_int <= A8 + B8;

  adder: process (clk, rst_n)
   begin 
     if rst_n = '0' then       
       carry <= '0';
       sum   <= "00000000";
     elsif clk'event and clk = '1' then  
       carry <= sum_int(8);
       sum   <= sum_int(7 downto 0);
     end if;
   end process adder; 
END ARCHITECTURE rtl;

