package memory_pkg;
  import uvm_pkg::*;
  typedef enum {read, write, nop} mem_op;
  
  virtual interface memory_if global_mif;
  
// UVM Macros
 
  `include "uvm_macros.svh" 


  
// uvm_transactions
  `include "mem_data.svh" 
  `include "mem_req.svh" 
  
// uvm_agents 
  `include "interface_base.svh"
  `include "tester.svh"
  `include "responder.svh"
  `include "driver.svh"
  `include "printer.svh"
  `include "bit_bucket.svh" 
  
  
// uvm_envs
  `include "tester_env.svh"

// uvm_tests  
  `include "quiet_test.svh"
  `include "verbose_test.svh"
endpackage: memory_pkg
