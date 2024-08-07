module top;
import uvm_pkg::*;
import memory_pkg::*;

   memory_if mi();
   memory dut (mi.mem_mp);
   
   initial begin
     string test_name;
       
      global_mif = mi;

     run_test(); 
   end
 
 endmodule: top

      
        
      