class consumer extends uvm_agent;

  `uvm_component_utils(consumer)
  
   uvm_get_port #(int) cons_port;
  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build();
    super.build();
     cons_port=new("cons_port",this);
  endfunction: build

 function void connect();
    super.connect();   
  endfunction: connect
  
 task run();
 integer i;
 forever begin : loop
   cons_port.get(i);
   uvm_report_info("run",$psprintf("get %0d",i));
 end : loop
 endtask : run
 

endclass: consumer