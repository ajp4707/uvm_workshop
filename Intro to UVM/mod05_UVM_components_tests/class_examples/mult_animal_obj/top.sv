import uvm_pkg::*;
import multi_pkg::*;

module top;
   animal_pen ap;
   
   initial begin
      ap = new("crows", "murder", 9);
      set_config_object ("*","pen", ap, 0);
      run_test();
   end
   
endmodule

