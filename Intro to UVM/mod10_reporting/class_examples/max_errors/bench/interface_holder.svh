class interface_holder extends uvm_object;

  virtual interface memory_if mif;
  
  function new(virtual interface memory_if imif);

    mif = imif;

  endfunction : new

endclass : interface_holder
