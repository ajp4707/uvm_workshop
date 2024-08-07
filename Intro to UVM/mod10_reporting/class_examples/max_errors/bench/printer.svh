class printer #(type T = mem_data) extends uvm_agent;
   `uvm_component_param_utils(printer #(T))
     uvm_tlm_analysis_fifo #(T) a_fifo;
   
   function new(string name = "printer", uvm_component parent = null);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      a_fifo = new("a_fifo",this);
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      forever begin
         T data;
         a_fifo.get(data);
         `uvm_info("run",data.convert2string(),500);
      end
   endtask : run_phase
endclass : printer


