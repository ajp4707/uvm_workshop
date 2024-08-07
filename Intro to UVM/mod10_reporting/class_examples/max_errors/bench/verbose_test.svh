class verbose_test extends uvm_test;
  `uvm_component_utils(verbose_test)    
  
  tester_env t_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build();
    super.build();
     set_config_int("*","nloops",50000);
     t_env = tester_env::type_id::create("t_env", this);
  endfunction : build

   function void end_of_elaboration();
     t_env.set_report_verbosity_level_hier(500);
   endfunction : end_of_elaboration

endclass : verbose_test

