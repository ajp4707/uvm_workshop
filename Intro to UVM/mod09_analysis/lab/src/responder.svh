`include "uvm_macros.svh"

class responder extends counter_agent;

   `uvm_component_utils(responder);

   uvm_put_port	#(ctr_output) output_p; 
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run;
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
   endtask // run

  function void build();
    super.build();
    output_p	= new("output_p", this, , ); 
  endfunction : build


endclass 


   


   
