import uvm_pkg::*;
import memory_pkg::*;

module top;

   memory_if mi();
   memory dut (mi.mem_mp);
   tester tst;
   scoreboard sb;
   monitor m;
   
   initial begin
      tst = new(mi);
      sb  = new(mi);
      m   = new(mi);
      fork 
         tst.run;
         sb.run;
         m.run;
      join_none
   end
   
endmodule // top

      
        
      