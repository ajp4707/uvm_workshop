import uvm_pkg::*;
import counter_pkg::*;

module top;

   counter_if ctr_if();
   counter DUT(ctr_if.cntr_mp);

   initial begin
      string test_name;

      // Please copy ctr_if to the global virtual interface variable 
      // you created in counter_pkg.sv.



      run_test();
      
   end   
      
endmodule // top

   