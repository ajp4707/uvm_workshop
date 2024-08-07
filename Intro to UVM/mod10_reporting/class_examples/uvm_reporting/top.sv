import uvm_pkg::*;
`include "uvm_macros.svh"

class report_test extends uvm_test;

  `uvm_component_utils(report_test)    
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  task run_phase(uvm_phase phase);
     super.run_phase(phase);
     $display(`__FILE__);
     phase.raise_objection(this);
     `uvm_info ("DEBUG" ,"This is rarely seen.  Only in debug mode.", 500);
     `uvm_info("NEED TO ASK", "This is unusual to see.",300 );
     `uvm_info("SOP", "This is a typical message.",200);
     `uvm_info("EXPECT TO SEE","This is almost always seen", 100);
     `uvm_info("ERROR OR WARNING", "This message cannot be turned off with verbosity", 0);
     `uvm_warning("ROBOT", "Danger, Will Robinson!");
     `uvm_warning("SCOTTY", "She canna' take any more captain!")
     `uvm_error("HAL", "Sorry.  I can't do that, Dave");
     `uvm_error("C3P0", "R2, where are you?");
     `uvm_fatal("SLASHER MOVIE VICTIM", "We should split up.");
     `uvm_fatal("WALKING DEAD", "I don't see any zombies...");
     
     phase.drop_objection(this);
  endtask

endclass : report_test


module top;
  
  initial run_test("report_test");
  
endmodule

