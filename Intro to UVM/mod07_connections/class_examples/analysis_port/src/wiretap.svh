class wiretap extends uvm_agent;

  `uvm_component_utils(wiretap)
  
   uvm_tlm_analysis_fifo     #(int) afifo;
  
  function new(string name, 
               uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build();
    super.build();
     afifo    =new("afifo",this);
  endfunction: build
  
 task run();
 integer i;
 forever begin : loop
   afifo.get(i);
   uvm_report_info("SPY",$psprintf("get %0d",i));
 end : loop
 endtask : run
 

endclass: wiretap