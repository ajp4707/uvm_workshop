class producer extends uvm_agent;

   uvm_put_port         #(int) prod_port; 

  `uvm_component_utils(producer)
 
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build();
    super.build();
     prod_port=new("prod_port",this);
  endfunction: build

 function void connect();
    super.connect();   
  endfunction: connect
  
 task run();

   integer i;
   for (i = 1; i<=nloops; i++) begin : loop
     prod_port.put(i);
     uvm_report_info("run",$psprintf("put %0d",i));
   end : loop
 endtask : run

endclass: producer

