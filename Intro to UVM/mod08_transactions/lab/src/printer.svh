class printer extends uvm_agent;

   `uvm_component_utils(printer);
   
   uvm_get_port #(ctr_output) out_p; 
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      ctr_output out_txn;
      forever begin
         out_p.get(out_txn);
         uvm_report_info("run",$psprintf("data: %2h",
                                         out_txn.data));
      end
   endtask : run_phase

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      out_p = new("out_p", this, , ); 
   endfunction : build_phase

endclass // tester






