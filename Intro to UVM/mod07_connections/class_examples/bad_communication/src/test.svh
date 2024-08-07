class bad_com_test extends uvm_test;

  `uvm_component_utils(bad_com_test)    

  bad_com_env env;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

  function void build();
    super.build();
    env = bad_com_env::type_id::create("env",this);
    
  endfunction: build

  task run();
    #1;
    global_stop_request;
  endtask : run
endclass: bad_com_test

