
class quiet_test extends counter_test;

   `uvm_component_utils(quiet_test);

  int error_file;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      counter_pkg::nloops = 5000;
      // Please open a file called error.txt with the MCD error_file
      error_file = $fopen("error.txt");
      // Please hierarchically have all UVM_ERROR messages write to error_file
      set_report_severity_file_hier(UVM_ERROR,error_file);
      // Please hierarchically set the actions on UVM_ERRORS to Log and Count but don't display
      set_report_severity_action_hier(UVM_ERROR, UVM_LOG | UVM_COUNT);
      // Please set the verbosity hierarchically to UVM_LOW      
      set_report_verbosity_level_hier(UVM_LOW);
      // Please set the test to quit after three errors      
      set_report_max_quit_count(3);
      // Please write the report header to the error_file      
      report_header(error_file);
      // Please dump the report state so we can check the reporting      
      dump_report_state();  
   endfunction : end_of_elaboration_phase
   
endclass : quiet_test


   


   