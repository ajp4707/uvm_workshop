class producer extends uvm_agent;

  `uvm_component_utils(producer)
 
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new

  task run();
    integer i;
    for (i = 1; i<=nloops; i++) begin : loop
      uvm_report_info("run",$psprintf("putting %0d",i));
      producer_consumer_pkg::shared = i;
    end : loop
  endtask : run

endclass: producer

