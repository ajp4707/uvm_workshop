class quiet_test extends verbose_test;
 `uvm_component_utils(quiet_test)   
  
  int error_file;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    error_file = $fopen("errors.txt");
    set_report_max_quit_count(5);
    set_report_severity_action_hier(UVM_ERROR, UVM_LOG | UVM_COUNT);
    set_report_severity_file_hier(UVM_ERROR, error_file);
    t_env.set_report_verbosity_level_hier(100);
    t_env.dump_report_state();
  endfunction : end_of_elaboration_phase
endclass : quiet_test


