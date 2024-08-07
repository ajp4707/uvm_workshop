class responder extends counter_agent;

   `uvm_component_utils(responder);

   uvm_put_port #(ctr_output) output_p; 
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      ctr_output out_txn=new(), cln;
      
      forever begin
         @(posedge i.clk);
         #1;
         if (i.ld || i.inc) begin
           out_txn.data = i.q;
           $cast(cln,out_txn);
           assert(output_p.try_put(cln)) else
             uvm_report_fatal("run","responder not connected");
         end
      end
   endtask : run_phase

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    output_p    = new("output_p", this, , ); 
  endfunction : build_phase

endclass 


   


   
