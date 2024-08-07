class dog extends uvm_test;

  `uvm_component_utils(dog)    
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  task run_phase(uvm_phase phase);
     phase.raise_objection(this);
     super.run();
     `uvm_info ("dog","En espanol, el perro dice 'guau, guau'", UVM_INFO);
     phase.drop_objection(this);
  endtask
 
endclass : dog

