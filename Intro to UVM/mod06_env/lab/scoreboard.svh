// Please define a class called "scoreboard" that extends agent_with_interface and register it with the factory

   


   logic [7:0] beh_q;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   // Please note that scoreboard does not have a build() method.  
   // It inherits it from agent_with_interface
   
   task run_phase(uvm_phase phase);
      forever begin
         @(posedge i.clk);
         if (!i.rst)
           beh_q = 0;
         else
           if (i.ld)
             beh_q = i.data_in;
           else if (i.inc)
             beh_q++;
         @(negedge i.clk);
         assert(beh_q === i.q) else
           `uvm_error("run",$psprintf("Expected %2h  Received %2h",beh_q, i.q));
      end
   endtask // run
endclass


   


   
