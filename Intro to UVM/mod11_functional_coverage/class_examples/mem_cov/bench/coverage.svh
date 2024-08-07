class coverage extends uvm_agent;
  `uvm_component_utils(coverage)
  uvm_tlm_analysis_fifo #(mem_req) req_fifo;
  
  mem_req req;   
  mem_op op;
  logic [15:0] addr;
  
  covergroup mem_ops;
    coverpoint op {
      bins action[] = {read, write};}
    coverpoint addr {
       bins zeros = {0};
       bins others = {[1 : 16'hFFFE]};
       bins ones  = {16'hFFFF};
     }
     edges : cross op, addr;
  endgroup 
 
  function new (string name, uvm_component parent);
    super.new(name,parent);
    mem_ops = new();
  endfunction: new
  
  task run_phase(uvm_phase phase);
    mem_data cln;
    mem_req  req_txn;
    forever begin : run_loop
      req_fifo.get(req_txn);
      op = req_txn.op;
      addr = req_txn.addr;
      mem_ops.sample();
    end : run_loop;
  endtask: run_phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req_fifo    = new("req_fifo",this);
  endfunction: build_phase
 

endclass: coverage
