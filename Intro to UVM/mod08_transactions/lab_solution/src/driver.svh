class driver extends counter_agent;

   `uvm_component_utils(driver);

   // Please declare an uvm_get_port called req_p that works with ctr_req objects
   uvm_get_port #(ctr_req) req_p; 

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      // Please use super.build_phase() to access the interface. 
      super.build_phase(phase);    
      // Please create a new port called req_p.
      req_p     = new("req_p", this); 
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      ctr_req req;
      forever begin : forever_loop
         @(negedge i.clk);
         i.inc = 0;
         i.ld  = 0;
         // Please use try_get to get a req transaction.  
         if (req_p.try_get(req)) begin : got_req

            // If you get a transaction, then
            // check the transaction operation to see what to do. 
            // The possible operations are "load" "inc" "nop" you can use a case 
            // statement to switch between them.

           case(req.op) 

             // To load you raise the signal i.ld and put req.data
             // on the i.data_in bus.
             load : begin : do_load
               i.ld = 1;
               i.data_in = req.data;
             end : do_load
             
             // To increment you raise the signals i.inc.             
             inc : begin : do_inc
               i.inc = 1;
             end : do_inc
             
             nop : begin end
           endcase
          end : got_req
      end : forever_loop
   endtask :run_phase
endclass : driver


   


   
