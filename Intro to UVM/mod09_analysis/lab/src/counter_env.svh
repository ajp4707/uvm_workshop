class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   tester        tst; 
   driver  drv;
   monitor mon;

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
      tst = tester::type_id::create("tst", this);
      drv = driver::type_id::create("drv",this);
      mon = monitor::type_id::create("mon",this);
      
      // analysis layer
      p_req   = printer#(ctr_req)::type_id::create("p_req",this);
      // Please add a call to create that will make a printer to handle ctr_rsp transactions

      tst2drv_f = new("tst2drv_f", this, ); 
      comp = comparator::type_id::create("comp", this);
      pred = predictor::type_id::create("pred", this);
      pred2comp_f       = new("pred2comp_f", this, ); 
   endfunction : build_phase
   

  // connect
  function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
     // test
     tst.req_p.connect(tst2drv_f.put_export);
     drv.req_p.connect(tst2drv_f.nonblocking_get_export);
     
     // analysis
     pred.rsp_f.connect(pred2comp_f.blocking_put_export); 
     comp.predicted_f.connect(pred2comp_f.blocking_get_export);
     // Please connect the predictor to the monitor's request analysis port

     // Please connect the compariator to the monitor's response analysis port


     
     
     if (counter_pkg::verbose) begin
        // Please connect the request printer to the monitor's request analysis port

        // Please connect the response printer to the monitor's response analysis port

     end
     
endfunction : connect_phase


endclass // tester


   


   