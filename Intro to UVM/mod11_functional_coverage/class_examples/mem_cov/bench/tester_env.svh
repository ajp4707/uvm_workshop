class tester_env extends uvm_env;
   `uvm_component_utils(tester_env)    

   tester    tst;
   driver    drv;
   uvm_tlm_fifo #(mem_req) tester2drv;
   
   printer   #(mem_req)  req_prt;
   printer   #(mem_data) rsp_prt;
   monitor      mon; 
   predictor    pred; 
   comparator   cmp; 
   uvm_tlm_fifo #(mem_data) pred2cmp; 
   coverage     cov; 

   function new(string name = "tester_env", 
                uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tst = tester::type_id::create("tst",this);
      drv = driver::type_id::create("drv",this);
      tester2drv = new("tester2drv");
      
      req_prt = printer#(mem_req)::type_id::create("req_prt",this);
      rsp_prt = printer#(mem_data)::type_id::create("rsp_prt",this);
      mon = monitor::type_id::create("mon", this);
      pred = predictor::type_id::create("pred", this);
      cmp = comparator::type_id::create("cmp", this);
      pred2cmp  = new("pred2cmp", this, ); 
     cov = coverage::type_id::create("cov", this);
   endfunction : build_phase      

   function void connect_phase(uvm_phase phase);
      super.connect;
      tst.tb_port.connect(tester2drv.blocking_put_export);
      drv.req_f.connect(tester2drv.nonblocking_get_export);
      cmp.predicted_p.connect(pred2cmp.blocking_get_export); 
      pred.rsp_p.connect(pred2cmp.blocking_put_export); 
      mon.req_a.connect(pred.req_fifo.analysis_export); 
      mon.rsp_a.connect(cmp.actual_f.analysis_export); 
      mon.req_a.connect(req_prt.a_fifo.analysis_export);
      mon.rsp_a.connect(rsp_prt.a_fifo.analysis_export);   
      mon.req_a.connect(cov.req_fifo.analysis_export);   
   endfunction : connect_phase
   
endclass : tester_env

