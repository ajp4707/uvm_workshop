class tester extends uvm_agent;
 `uvm_component_utils(tester)    

  uvm_put_port #(mem_req) tb_port;

  function new(string name, uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  function void build();
    super.build();  
    tb_port = new("tb_port",this);
  endfunction : build

  task run();
    int nloops;
    mem_req cln;
    mem_req req = new();
    
    //initialize memory
    uvm_report_info ("run","Initializing memory");
    for (int i=0; i< 'h10; i++) begin : initialize
      req.load_data(i, i, write);
      put_txn(req);
    end : initialize

   // run nloop random transactions
    assert(get_config_int("nloops",nloops));
    uvm_report_info("run",$psprintf("running %0d transactions",nloops),500);
    for (int i = 1; i<=nloops; i++) begin : run_test
      assert(req.randomize() with {addr < 'h10;});
      put_txn(req);
    end : run_test
    #100ns;
    global_stop_request;
      
  endtask
  
  task put_txn(mem_req txn);
    mem_req cln;
    $cast(cln, txn.clone);
    tb_port.put(cln);
    uvm_report_info("run", cln.convert2string(),500);
  endtask : put_txn
  
endclass : tester
