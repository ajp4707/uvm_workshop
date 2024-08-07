class consumer extends uvm_agent;

  `uvm_component_utils(consumer)
 
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new
  
  task run();
    integer i;
    repeat(nloops) begin : loop
      i = producer_consumer_pkg::shared;
      uvm_report_info("run",$psprintf("get %0d",i));
    end : loop
  endtask : run

endclass: consumer

