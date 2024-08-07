class monitor extends uvm_agent;

   `uvm_component_utils(monitor);
   interface_holder ifh;
   uvm_object tmp;
   virtual interface counter_if i; 

   uvm_analysis_port    #(ctr_output) rsp_p;
   uvm_analysis_port #(ctr_req)    req_p; 
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      ctr_output rsp=new();
      ctr_req    req=new();   
      @(negedge i.rst);
      forever begin : forever_loop
         @(posedge i.clk);
         #1;
         req.op = nop;
         rsp.data = i.q;
         if (i.ld || i.inc || !i.rst) begin : got_an_op
           req.data = i.data_in;
           if (!i.rst) req.op = reset; 
            else
              req.op = i.ld ? load : inc;
          end : got_an_op
          rsp_p.write(rsp);
          req_p.write(req);
          `uvm_info("run",
                 $psprintf("Monitor got req %s",
                 req.convert2string()), 
                 UVM_DEBUG);
          `uvm_info("run",
                 $psprintf("Monitor got %s",
                 rsp.convert2string()), 
                 UVM_DEBUG);                   
       end : forever_loop
   endtask // run

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     i = counter_pkg::global_cif;
     
     rsp_p = new("rsp_p", this); 
     req_p = new("req_p", this);
  endfunction : build_phase


endclass 


   


   
