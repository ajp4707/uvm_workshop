class responder extends interface_base;

  `uvm_component_utils(responder)    
  uvm_put_port   #(mem_data)   data_out;

  function new(string name, uvm_component parent=null);
    super.new(name, parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    data_out = new("data_out",this);
  endfunction : build_phase
  
  task run_phase(uvm_phase phase);
     mem_data    data_txn = new(), cln;
     forever begin : clock_loop
       @(posedge mif.clk);
       #1;
       if (mif.rd) begin : read_data
         data_txn.addr = mif.addr;
         data_txn.data = mif.data;
         $cast(cln,data_txn.clone());
         assert (data_out.try_put(cln)) else
            `uvm_fatal("run","responder not connected");
       end : read_data
     end : clock_loop
  endtask : run_phase
endclass : responder

