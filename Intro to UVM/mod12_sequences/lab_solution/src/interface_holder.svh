class interface_holder extends uvm_object;

  virtual interface  counter_if  cif;
  
  function new(virtual interface counter_if icif);

    cif = icif;

  endfunction : new

endclass : interface_holder
