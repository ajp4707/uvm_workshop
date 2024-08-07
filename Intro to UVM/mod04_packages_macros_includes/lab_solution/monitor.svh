class monitor;
   // Please declare a virtual interface of type counter_if called i.
   virtual interface counter_if i;

   // Please create a constructor called new that accepts a virtual interface counter_if as an argument
   function new(virtual interface counter_if vif);
      i = vif; 
   endfunction // new
   
   // Please create a task called run that loops forever and prints the counter's out on the negative  edge of i.clk.
   task run;
      forever begin
         @(negedge i.clk);
         #1;
         $display ("data_in: %2h =>   q: %2h   inc: %1b  ld: %1b",
                   i.data_in, i.q, i.inc, i.ld);
      end
   endtask // run
endclass // monitor

