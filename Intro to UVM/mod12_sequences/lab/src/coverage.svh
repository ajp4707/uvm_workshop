class coverage extends uvm_agent;

   `uvm_component_utils(coverage)
  
   uvm_tlm_analysis_fifo	#(ctr_req)    req_f;
   uvm_tlm_analysis_fifo #(ctr_output) output_f;  
   
   ctr_op op;
   logic [7:0] ctr_val;
   
   // 1.  A covergroup with a bin for every operation
   covergroup c_ops;
     coverpoint op;
   endgroup;
   
   // 2. A covergroup that contains a bin for every possible
   //    transition between two operations
   covergroup c_counter;
    coverpoint op  {
      bins op_trans[] = ([inc:reset] => [inc:reset]);}
   endgroup
   
   
   // 3.  A covergroup two bins and a cross:
   //    a.  A coverpoint for every operation
   //    b.  A coverpoint that captures the transition from 
   //        8'ff to 8'00
   //    c.  A cross between two coverpoints using the binsof operator
   covergroup c_rollover;
     coverpoint op;
     coverpoint ctr_val {
      bins  FF200 = (8'hFF => 8'h00);
      }
      rollover : cross op, ctr_val {
        bins inc_rollover = binsof(op) intersect {inc}; 
        ignore_bins noinc = !binsof(op) intersect {inc};}
    endgroup
  
   function new(string name="", uvm_component parent);
      super.new(name, parent);
      c_ops = new();
      c_counter = new();
      c_rollover = new();
   endfunction : new
   

    
   task run_phase(uvm_phase phase);
      ctr_req req;  
      ctr_output rsp; 
      forever begin : forever_loop
         output_f.get(rsp);
         req_f.get(req);
         op = req.op;
         ctr_val = rsp.data;
         c_ops.sample();
         c_counter.sample();
         c_rollover.sample();
      end : forever_loop
   endtask // run

  // build
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  req_f	= new("req_f", this); 
  output_f = new("rsp_f", this);
endfunction : build_phase


endclass : coverage



   


   
