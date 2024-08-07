class producer_consumer_env extends uvm_env;

  `uvm_component_utils(producer_consumer_env)

  producer p;
  consumer c;
  
  uvm_tlm_fifo #(int) satellite;
  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);      
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    p = producer::type_id::create("p",this);
    c = consumer::type_id::create("c",this);
    satellite = new ("satellite",this);
    
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    p.phone1.connect(satellite.put_export);
    c.phone2.connect(satellite.get_export);
  endfunction: connect_phase
 
endclass: producer_consumer_env
