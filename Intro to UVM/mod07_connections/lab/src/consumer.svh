class consumer extends uvm_agent;

  `uvm_component_utils(consumer)
  
   uvm_get_port #(int) phone2;
  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    phone2=new("phone2",this);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
   int i;
   forever begin : loop
     phone2.get(i);
     `uvm_info("run",$psprintf("get %0d",i),UVM_MEDIUM);
   end : loop
  endtask : run_phase
  
endclass: consumer

