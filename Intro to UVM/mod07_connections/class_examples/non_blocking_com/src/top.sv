import uvm_pkg::*;
import producer_consumer_pkg::*;

module top;

  timeunit 1ns;
  timeprecision 1ns; 

  initial run_test("producer_consumer_test");  

endmodule: top
