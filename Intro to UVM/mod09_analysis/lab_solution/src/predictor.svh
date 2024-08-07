class predictor  extends uvm_agent;

   `uvm_component_utils(predictor)
  
   uvm_tlm_analysis_fifo        #(ctr_req)    req_f;
   uvm_put_port      #(ctr_output) rsp_f; 
   
   logic [7:0] beh_ctr;
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   task run_phase(uvm_phase phase);
      ctr_req req;
      ctr_output rsp=new(), cln;
      forever begin : forever_loop
         req_f.get(req);
         case (req.op) 
           reset : beh_ctr = 0;
           inc   : beh_ctr++;
           load  : beh_ctr = req.data;
         endcase
         
         rsp.load_data(beh_ctr);
         $cast(cln,rsp.clone());
         rsp_f.put(cln);
        
      end : forever_loop
   endtask : run_phase

  // build
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  req_f = new("req_f", this); 
  rsp_f = new("rsp_f", this);
endfunction : build_phase


endclass : predictor



   


   
