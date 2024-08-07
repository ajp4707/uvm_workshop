class verbose_test extends uvm_test;
  `uvm_component_utils(verbose_test)    
  
  tester_env t_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     set_config_int("*","nloops",10);
     t_env = tester_env::type_id::create("t_env", this);
  endfunction : build_phase

   function void end_of_elaboration_phase(uvm_phase phase);
           t_env.set_report_verbosity_level_hier(500);
   endfunction : end_of_elaboration_phase

endclass : verbose_test

