class driver extends counter_agent;

   `uvm_component_utils(driver);

   uvm_get_port #(ctr_req) req_p; 

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);    
      req_p     = new("req_p", this); 
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      ctr_req req;
      forever begin : forever_loop
         @(negedge i.clk);
         i.inc = 0;
         i.ld  = 0;
         i.rst = 1;
         if (req_p.try_get(req)) begin : got_req
           case(req.op) 
             load : begin : do_load
               i.ld = 1;
               i.data_in = req.data;
             end : do_load
             
             inc : begin : do_inc
               i.inc = 1;
             end : do_inc
             
             reset : i.rst = 0;
               
             nop : begin end
           endcase
          end : got_req
      end : forever_loop
   endtask : run_phase
   
endclass // tester


   


   
