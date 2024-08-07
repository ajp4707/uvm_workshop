class ctr_checker;
   virtual interface counter_if i;

   logic [7:0] q_beh;
   
   function new(virtual interface counter_if vif);
      i = vif; 
   endfunction // new
   
   task run;
      forever begin
         @(posedge i.clk);
         if (!i.rst)
           q_beh = 0;
         else
           if (i.ld)
             q_beh = i.data_in;
           else if (i.inc)
             q_beh++;
         @(negedge i.clk);
         #1;
         assert(i.q === q_beh) else 
           $display ("mismatch q: %2h   q_beh: %2h",i.q,q_beh);
      end
   endtask // run
endclass : ctr_checker

