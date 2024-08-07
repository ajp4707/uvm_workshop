`include "uvm_macros.svh"

class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   responder    rsp; 
   tester       tst; 
   driver drv;
   printer p;
   uvm_tlm_fifo #(ctr_req) tst2drv_f; 
   uvm_tlm_fifo #(ctr_output) rsp2p_f; 
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tst = tester::type_id::create("tst", this);
      drv = driver::type_id::create("drv",this);
      rsp = responder::type_id::create("rsp", this); 
      p   = printer::type_id::create("p",this);
      tst2drv_f = new("tst2drv_f", this, ); 
      rsp2p_f   = new("rsp2p_f", this, ); 
   endfunction : build_phase
   

  // connect
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
     tst.req_p.connect(tst2drv_f.put_export);
     drv.req_p.connect(tst2drv_f.nonblocking_get_export);
     rsp.output_p.connect(rsp2p_f.nonblocking_put_export);
     p.out_p.connect(rsp2p_f.blocking_get_export);  
endfunction : connect_phase


endclass // tester


   


   