class predictor extends uvm_agent;

  `uvm_component_utils(predictor)

  logic [15:0] mem [2**16-1 : 0];
     
  uvm_tlm_analysis_fifo #(mem_req) req_fifo;
  uvm_put_port #(mem_data)     rsp_p;
  mem_data     rsp = new();
  
 
  function new (string name, 
                uvm_component parent);
    super.new(name,parent);
  endfunction: new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req_fifo    = new("req_fifo",this);
    rsp_p    = new("rsp_po",this);   
  endfunction: build_phase
 
  task run_phase(uvm_phase phase);
    mem_data cln;
    mem_req  req_txn;
    forever begin : run_loop
      req_fifo.get(req_txn);
      case (req_txn.op)
        write : mem[req_txn.addr] = req_txn.data;
        read  : begin : read_op
          rsp.load_data(req_txn.addr, mem[req_txn.addr]);
          $cast (cln,rsp.clone());
          rsp_p.put(cln);
        end : read_op
      endcase
    end : run_loop;
  endtask: run_phase
endclass: predictor
