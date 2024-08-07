class verbose_test extends uvm_test;

  `uvm_component_utils(verbose_test)    
   
   tester_env t_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t_env = tester_env::type_id::create("t_env", this);
  endfunction : build_phase

endclass : verbose_test

