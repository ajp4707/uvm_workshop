`include "tester.svh"

module top;

   memory_if mi();
   memory dut (mi.mem_mp);
   tester tst;
   
   initial begin
      tst = new(mi);
      fork 
         tst.run;
      join_none
   end
   
endmodule // top

      
        
      