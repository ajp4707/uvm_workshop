
class producer_consumer_env extends uvm_env;

  // declaration macros
  `uvm_component_utils(producer_consumer_env)

  producer p;
  consumer c;
  wiretap  spy1,spy2;
  uvm_tlm_fifo #(int) fifo;

  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);      
  endfunction: new

  function void build();
    super.build();
    p = producer::type_id::create("p",this);
    c = consumer::type_id::create("c",this);
    spy1 = wiretap::type_id::create("spy1",this);
    spy2 = wiretap::type_id::create("spy2",this);
    fifo = new ("fifo",this);

    
  endfunction: build

  function void connect();
    super.connect();
    p.prod_port.connect(fifo.blocking_put_export);
    c.cons_port.connect(fifo.blocking_get_export);
    fifo.put_ap.connect(spy1.afifo.analysis_export);
    fifo.put_ap.connect(spy2.afifo.analysis_export);
  endfunction: connect
 
endclass: producer_consumer_env
