class interface_base extends uvm_agent;

  `uvm_component_utils(interface_base)    
  
  virtual interface memory_if mif;
  logic [15:0] testmem [2**16-1:0];    

  function new(string name = "interface_base", uvm_component parent = null );
     super.new(name, parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     mif = global_mif;
  endfunction : build_phase

endclass : interface_base
