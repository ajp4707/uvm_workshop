class producer_consumer_env extends uvm_env;

  // declaration macros
  `uvm_component_utils(producer_consumer_env)

  producer p;
  consumer c;
  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);      
  endfunction: new

  function void build();
    super.build();
    p = producer::type_id::create("p",this);
    c = consumer::type_id::create("c",this);
  endfunction: build

  function void connect();
    super.connect();
  endfunction: connect
 
endclass: producer_consumer_env
