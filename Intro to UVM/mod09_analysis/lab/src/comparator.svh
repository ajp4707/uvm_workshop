class comparator  extends uvm_agent;

   `uvm_component_utils(comparator)
  
   // Please declare a uvm_tlm_analysis_fifo that works with ctr_output transactions.  
   // Call this fifo actual_f.


   uvm_get_port      #(ctr_output) predicted_f; 

   ctr_output actual, predicted;
   
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      forever begin : forever_loop
         // Please use the actual_f fifo to get a transaction called actual.

         predicted_f.get(predicted);
         // Please use the comp() method to do the comparison

        begin   `uvm_info("run", $psprintf("passed: %s",actual.convert2string()),UVM_MEDIUM); end
         else begin
           `uvm_error("run", $psprintf("FAILED: Expected: %s   Actual: %s", predicted.convert2string(),actual.convert2string()));

         end
         
      end : forever_loop
   endtask 

  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  predicted_f   = new("req_f", this); 
  actual_f    = new("actual_f", this);
endfunction : build_phase

endclass : comparator



   


   
