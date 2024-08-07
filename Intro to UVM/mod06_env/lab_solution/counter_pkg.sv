`include "uvm_macros.svh"
package counter_pkg;
   import uvm_pkg::*;

   // Please create a virtual interface variable to hold a counter_if

   virtual interface counter_if global_ctr_if;

   bit     verbose = 0;
   
`include "agent_with_interface.svh"
`include "driver.svh"
`include "scoreboard.svh"
`include "printer.svh"
`include "counter_env.svh"
`include "counter_test.svh"   
`include "quiet_test.svh"


endpackage // counter_pkg
   
