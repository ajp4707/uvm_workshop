library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memory is
  
  port (
    clk  : in    std_logic;
    rd   : in    std_logic;
    wr   : in    std_logic;
    addr : in    std_logic_vector(15 downto 0);
    data : inout std_logic_vector (15 downto 0)
  );

end memory;

architecture rtl of memory is

type ram_type is array (65535 downto 0) of  std_logic_vector(15 downto 0);

signal mem : ram_type;
                        

begin  -- rtl

writemem: process (clk)
  begin  -- process writemem
    if (clk'event and clk='1') then
      if wr = '1' then
        mem(conv_integer(addr)) <= data;
      end if;
    end if;
  end process writemem;
  
readmem: process (rd, addr)
  begin  -- process readmem
    if rd = '1' then
      data <= mem(conv_integer(addr));
    else
      data <= (data'range => 'Z');
    end if;
  end process readmem;  
end rtl;
         
