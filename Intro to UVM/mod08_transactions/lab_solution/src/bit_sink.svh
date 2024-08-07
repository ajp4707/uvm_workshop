// Please create an class called bit_sink that extends printer
 class bit_sink extends printer;

  `uvm_component_utils(bit_sink)    
  
  function new(string name = "", uvm_component parent );
    super.new(name, parent);
  endfunction : new

// Please create a run task that loops forever and gets transactions out of a port called out_p.
// out_p was declared in printer and is built in printer, so you don't have to worry about it.
    task run_phase(uvm_phase phase);
     ctr_output out_txn;
     forever  out_p.get(out_txn);
  endtask : run_phase

endclass : bit_sink
