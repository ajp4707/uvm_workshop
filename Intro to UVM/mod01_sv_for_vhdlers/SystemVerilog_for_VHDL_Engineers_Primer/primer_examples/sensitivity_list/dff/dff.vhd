--
-- VHDL Architecture systemver_primer_lib.dff_vhdl.rtl
--
-- Created:
--          by - Ray.UNKNOWN (WRITINGMACHINE)
--          at - 06:18:52 05/ 1/2009
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY dff_vhdl IS
   PORT( 
      clk : IN     std_logic;
      d   : IN     std_logic;
      rst : IN     std_logic;
      q   : OUT    std_logic
   );

-- Declarations

END dff_vhdl ;

--
ARCHITECTURE rtl OF dff_vhdl IS
BEGIN

 flop : process ( clk , rst) 
	begin 
		if (rst = '0')then 
		  q <= '0' ; 
	  elsif rising_edge(clk) then
			q <= d;
	  end if;
	end process; 
			
 END ARCHITECTURE rtl;

