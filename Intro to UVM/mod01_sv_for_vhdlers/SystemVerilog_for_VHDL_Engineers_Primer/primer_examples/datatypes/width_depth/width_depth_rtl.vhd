--
-- VHDL Architecture width_depth.width_depth.rtl
--
-- Created:
--          by - Ray.UNKNOWN (WRITINGMACHINE)
--          at - 07:46:00 05/ 4/2009
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY width_depth IS
END ENTITY width_depth;

--
ARCHITECTURE rtl OF width_depth IS
signal halfbyte : std_logic_vector( 3	downto 0 ) ; 

type reversebits_mem_type is array (7 downto 0) of std_logic_vector(1 to 8); 

signal reversebits_mem: reversebits_mem_type;

BEGIN
END ARCHITECTURE rtl;

