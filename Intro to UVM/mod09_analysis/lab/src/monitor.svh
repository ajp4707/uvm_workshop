class monitor extends counter_agent;

   `uvm_component_utils(monitor);

   uvm_analysis_port    #(ctr_output) rsp_p;
   uvm_analysis_port #(ctr_req)    req_p; 
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      ctr_output rsp=new();
      ctr_req    req=new();   
      forever begin : forever_loop
         @(posedge i.clk);
         #1;
         if (i.ld || i.inc || !i.rst) begin : got_an_op
           rsp.data = i.q;
           req.data = i.data_in;
           if (!i.rst) req.op = reset; 
            else
              req.op = i.ld ? load : inc;
            rsp_p.write(rsp);
            req_p.write(req);
         end : got_an_op
       end : forever_loop
   endtask // run

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rsp_p       = new("rsp_p", this); 
    req_p = new("req_p", this);
  endfunction : build_phase


endclass 


   


   
