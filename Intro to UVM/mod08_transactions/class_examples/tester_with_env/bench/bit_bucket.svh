class bit_bucket extends printer;
  `uvm_component_utils(bit_bucket)    

  function new(string name = "bit_bucket", 
  	uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

   task run_phase(uvm_phase phase);
     forever begin
       mem_data data;
       tb_port.get(data);
     end
endtask : run_phase

endclass : bit_bucket


