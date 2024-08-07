class tester;
   virtual interface counter_if i;
   integer num_loops;


   function new (virtual interface counter_if vif, integer n=50);
     i = vif;
     num_loops = n;
   endfunction // new
   
   task run;
      repeat (num_loops) begin
         @(negedge i.clk);
         {i.ld, i.inc} = $random;
         i.data_in = $random;
      end
      $finish;
   endtask // run
endclass // tester


   
