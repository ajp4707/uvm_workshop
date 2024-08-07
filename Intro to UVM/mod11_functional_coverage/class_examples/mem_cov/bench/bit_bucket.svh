class bit_bucket #(type T = mem_data) extends printer #(T);
  typedef bit_bucket#(T) thistype;
  `uvm_component_param_utils(thistype)    

  function new(string name = "bit_bucket", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

   task run_phase(uvm_phase phase);
     forever begin
       T data;
       a_fifo.get(data);
     end
endtask : run_phase

endclass : bit_bucket
