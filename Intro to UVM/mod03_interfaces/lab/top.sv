`include "tester.svh"

module top;

   counter_if ctr_if();
   counter DUT(ctr_if);
   tester my_tester;
   
   initial begin
      my_tester=new(ctr_if);
      fork
         my_tester.run();
      join_none
   end   
      
endmodule // top

   