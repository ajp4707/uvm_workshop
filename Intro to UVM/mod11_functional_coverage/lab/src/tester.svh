class tester extends uvm_agent;

   `uvm_component_utils(tester)   

     uvm_put_port       #(ctr_req) req_p; 
   // constructor
   function new(string name, uvm_component parent);

      super.new(name, parent);
      // Insert Constructor Code Here

   endfunction : new

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Insert Build Code Here
      req_p     = new("req_p", this); 
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      ctr_req req = new();

      int nloops=5;
      phase.raise_objection(this);
      req.load_data(0, reset);
      put_txn(req);
      req.load_data(8'hFF,load);
      put_txn(req);
      req.load_data(8'h00,inc);
      put_txn(req);
      for (int i=1; i <= nloops; i++) begin
         assert(req.randomize());
         put_txn(req);
      end
      #500ns;
      phase.drop_objection(this);
   endtask : run_phase

   task put_txn;
      input ctr_req req;
      ctr_req cln;
      $cast(cln, req.clone());
      req_p.put(cln);
      `uvm_info("run",req.convert2string(),UVM_MEDIUM);
   endtask : put_txn
   
endclass : tester
