`include "uvm_macros.svh"

class counter_env extends uvm_env;

   `uvm_component_utils(counter_env);

   // Please create a declaration for your sequence
   test_seq      tst;
   // Please create a declaration for your driver
   driver  drv;
   // Please create a declaration for an uvm_sequencer
   uvm_sequencer #(ctr_req, ctr_output) seqr;


   monitor mon;
   coverage cov;
   comparator   comp; 
   
   predictor    pred; 
   
   printer #(ctr_req) p_req;
   printer #(ctr_output) p_rsp;

   
   uvm_tlm_fifo #(ctr_req) tst2drv_f; 

   uvm_tlm_fifo #(ctr_output) pred2comp_f; 
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new




   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      // test layer
      // Please create a call to the factory to create your test sequence
      tst = test_seq::type_id::create("tst", this);
      // Please create a call to the factory to create your driver      
      drv = driver::type_id::create("drv",this);
      // Please create a new sequencer using the new() method      
      seqr = new("seqr",this);
      
      mon = monitor::type_id::create("mon",this);
      cov = coverage::type_id::create("cov", this);
      // analysis layer
      p_req   = printer#(ctr_req)::type_id::create("p_req",this);
      p_rsp   = printer#(ctr_output)::type_id::create("p_rsp",this);
      tst2drv_f = new("tst2drv_f", this, ); 
      comp = comparator::type_id::create("comp", this);
      pred = predictor::type_id::create("pred", this);
      pred2comp_f       = new("pred2comp_f", this, ); 
   endfunction : build_phase
   

  // connect
  function void connect_phase(uvm_phase phase);

     super.connect_phase(phase);

     // test
     // Please connect the seq_item_port from your driver to the uvm_sequencer
     drv.seq_item_port.connect(seqr.seq_item_export);
     
     // analysis
     pred.rsp_f.connect(pred2comp_f.blocking_put_export); 
     comp.predicted_f.connect(pred2comp_f.blocking_get_export);
     mon.req_p.connect(pred.req_f.analysis_export);
     mon.rsp_p.connect(comp.actual_f.analysis_export);
     mon.req_p.connect(p_req.data_f.analysis_export);
     mon.rsp_p.connect(p_rsp.data_f.analysis_export); 
     mon.req_p.connect(cov.req_f.analysis_export);
     mon.rsp_p.connect(cov.output_f.analysis_export);
     
endfunction : connect_phase

task run_phase(uvm_phase phase);
   phase.raise_objection(this);
  //Please start the test sequence
   tst.start(seqr);
   phase.drop_objection(this);
endtask


endclass : counter_env


   


   