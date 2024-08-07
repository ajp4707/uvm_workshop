class monitor extends interface_base;
   `uvm_component_utils(monitor)    

   uvm_analysis_port    #(mem_data) rsp_a; 
   uvm_analysis_port    #(mem_req) req_a; 
   
   function new(string name = "driver", 
                uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     req_a      = new("req_a", this); 
     rsp_a      = new("rsp_a", this); 
   endfunction: build_phase
   
   task run_phase(uvm_phase phase);
     mem_req  req=new(), c_req;
     mem_data rsp=new(), c_rsp;
     forever begin : monitor_loop
        @(posedge mif.monitor.clk);
        #1;
        req.load_data(mif.addr, mif.data, nop);
        rsp.load_data(mif.addr, mif.data);
        if (mif.wr) req.op = write;
        if (mif.rd) req.op = read;
        if (req.op != nop) begin
          $cast(c_req, req.clone());
          req_a.write(c_req); 
        end
        if (mif.rd) begin
          $cast(c_rsp, rsp.clone());
          rsp_a.write(c_rsp);
        end      
     end : monitor_loop
    endtask : run_phase

endclass : monitor

