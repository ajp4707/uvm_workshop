class bit_bucket extends printer;

  `uvm_component_utils(bit_bucket)    
  
  // constructor
  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  task run_phase(uvm_phase phase);
  // this object does nothing
  endtask : run_phase
  
endclass : bit_bucket


