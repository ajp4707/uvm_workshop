`include "uvm_macros.svh"

class quiet_test extends counter_test;

   `uvm_component_utils(quiet_test);

   int error_file;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      error_file = $fopen("error.txt");
      set_report_severity_file_hier(UVM_ERROR,error_file);
      set_report_severity_action_hier(UVM_ERROR, UVM_LOG | UVM_COUNT);
      set_report_verbosity_level_hier(UVM_LOW);
      set_report_max_quit_count(3);
      report_header(error_file);
      dump_report_state();  
   endfunction : end_of_elaboration_phase


   
endclass // tester





