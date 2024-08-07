class driver extends counter_agent;

   `uvm_component_utils(driver);

   // Please declare an uvm_get_port called req_p that works with ctr_req objects


   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      // Please use super.build_phase() to access the interface. 

      // Please create a new port called req_p.

   endfunction : build_phase

   task run_phase(uvm_phase phase);
      ctr_req req;
      forever begin : forever_loop
         @(negedge i.clk);
         i.inc = 0;
         i.ld  = 0;
         // Please use try_get to get a req transaction.  


            // If you get a transaction, then
            // check the transaction operation to see what to do. 
            // The possible operations are "load" "inc" "nop" you can use a case 
            // statement to switch between them.



             // To load you raise the signal i.ld and put req.data
             // on the i.data_in bus.
             
             // To increment you raise the signals i.inc.             
             
             nop : begin end
           endcase
          end : got_req
      end : forever_loop
   endtask :run_phase
endclass : driver


   


   
