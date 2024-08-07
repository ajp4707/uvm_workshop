`include "uvm_macros.svh"

package counter_pkg;
   import uvm_pkg::*;

   // Please create a global virtual variable to hold the counter_if interface

   virtual interface counter_if global_ctr_if;

`include "counter_test.svh"   

endpackage // counter_pkg
   
