class tester_env extends uvm_env;
   `uvm_component_utils(tester_env)    

   tester    tst;
   driver    drv;
   responder rsp;
   printer   prt;
   uvm_tlm_fifo #(mem_req) tester2drv;
   uvm_tlm_fifo #(mem_data) rsp2printer;
   int verbose;
    
   function new(string name = "tester_env", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tst = tester::type_id::create("tst",this);
      drv = driver::type_id::create("drv",this);
      rsp = responder::type_id::create("rsp",this);
      prt = printer::type_id::create("prt",this);
      tester2drv = new("tester2drv");
      rsp2printer = new("rsp2printer");
   endfunction : build_phase      

   function void connect_phase(uvm_phase phase);
      super.connect;
      tst.tb_port.connect(tester2drv.put_export);
      drv.req_f.connect(tester2drv.get_export);
      rsp.data_out.connect(rsp2printer.put_export);
      prt.tb_port.connect(rsp2printer.get_export);
   endfunction : connect_phase
   
endclass : tester_env

