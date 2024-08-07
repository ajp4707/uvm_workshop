package memory_pkg;
  import uvm_pkg::*;

   virtual interface memory_if global_mif;

  `include "uvm_macros.svh"
  `include "driver.svh"
  `include "scoreboard.svh"
  `include "printer.svh"
  `include "bit_bucket.svh"
  `include "tester_env.svh"  
  `include "quiet_test.svh"
  `include "verbose_test.svh"
endpackage: memory_pkg
