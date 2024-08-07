// Please declare a class called printer that will take any transaction
// with a convert2string() method and print it to the screen using
// `uvm_info.  The parameter should be called "T"
class printer #(type T=ctr_output) extends uvm_agent;

   typedef printer#(T) thistype;   
   `uvm_component_param_utils(thistype)
      
     uvm_tlm_analysis_fifo        #(T) data_f; 
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      T data;
      forever begin
         data_f.get(data);
         `uvm_info("run",data.convert2string(),UVM_MEDIUM);
      end
   endtask // run

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      data_f        = new("data_f", this); 
   endfunction : build_phase

endclass // tester






