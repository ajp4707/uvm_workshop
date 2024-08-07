class printer extends uvm_agent;
   `uvm_component_utils(printer)    
   uvm_get_port #(mem_data) tb_port;
   
   function new(string name = "printer", 
                uvm_component parent = null);
      super.new(name, parent);
   endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tb_port = new("tb_port",this);
  endfunction : build_phase

   task run_phase(uvm_phase phase);
      forever begin
        mem_data data;
        tb_port.get(data);
        `uvm_info("run",data.convert2string());
      end
   endtask : run_phase
endclass : printer


