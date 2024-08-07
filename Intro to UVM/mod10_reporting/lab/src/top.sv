import uvm_pkg::*;
import counter_pkg::*;

module top;

   counter_if ctr_if();
   counter DUT(ctr_if.cntr_mp);

   initial begin
      string test_name;
      global_cif = ctr_if;
      run_test();
      
   end   
      
endmodule // top

   