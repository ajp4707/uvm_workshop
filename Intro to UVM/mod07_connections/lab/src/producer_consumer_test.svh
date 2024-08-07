class producer_consumer_test extends uvm_test;

  `uvm_component_utils(producer_consumer_test)    

  producer_consumer_env env;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction: new

   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = producer_consumer_env::type_id::create("env",this);
  endfunction: build_phase

endclass: producer_consumer_test

