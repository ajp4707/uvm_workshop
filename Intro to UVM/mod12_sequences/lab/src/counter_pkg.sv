package counter_pkg;
   import uvm_pkg::*;
   typedef enum {inc, load, nop, reset} ctr_op;

      virtual      interface counter_if global_cif;

   bit             verbose = 0;
   
`include "uvm_macros.svh"
      
   // uvm_objects
`include "interface_holder.svh"

  // uvm_transactions
  
`include "ctr_output.svh" 
`include "ctr_req.svh" 
`include "test_seq.svh" 

  // uvm_agents

`include "driver.svh"
`include "monitor.svh"
`include "printer.svh"
`include "predictor.svh" 
`include "comparator.svh" 
`include "coverage.svh" 

  // uvm_environments
`include "counter_env.svh"

  // uvm_tests
`include "counter_test.svh"   
`include "verbose_test.svh" 


endpackage // counter_pkg
   
