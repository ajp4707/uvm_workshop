class coverage extends uvm_agent;

   `uvm_component_utils(coverage)
      
     uvm_tlm_analysis_fifo      #(ctr_req)    req_f;
   uvm_tlm_analysis_fifo #(ctr_output) output_f;  
   
   ctr_op op;
   logic [7:0] ctr_val;
   
   // Please create a covergroup that contains a bin for every operation in the ctr_op enumerated type.   
   covergroup c_ops;
      coverpoint op;
   endgroup;

   // Please create a covergroup that contains a bin for every possible transition between two operations   
   covergroup c_counter;
      coverpoint op  {
         bins op_trans[] = ([inc:reset] => [inc:reset]);}
   endgroup

   // Please create a covergroup with two bins and a cross.
   covergroup c_rollover;
      //  1. A coverpoint with a bin for every operation in ctr_op.      
      coverpoint op;
      //  2. A a coverpoint bin that captures transitions in ctr_val from 8'hff to 8'h00      
      coverpoint ctr_val {
         bins  FF200 = (8'hFF => 8'h00);
      }

      //  3. A cross between the op bin and the transition bin that only watches for transitions from 8'hff to 8'h00 when the operation is "inc"
      
      rollover : cross op, ctr_val {
         bins inc_rollover = binsof(op) intersect {inc}; 
         ignore_bins noinc = !binsof(op) intersect {inc};}
   endgroup
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
      //   Please create new instances of the covergroups
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
         // Please add sample() calls to sample the data in the covergroups.
         c_ops.sample();
         c_counter.sample();
         c_rollover.sample();
      end : forever_loop
   endtask // run

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      req_f     = new("req_f", this); 
      output_f = new("rsp_f", this);
   endfunction : build_phase


endclass : coverage







