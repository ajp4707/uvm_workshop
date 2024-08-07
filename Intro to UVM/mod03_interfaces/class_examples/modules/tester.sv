module tester (memory_if.tester t);
   logic [3:0]  tiny_addr;
   
   initial begin
      t.wr = 1'b1;
      for (int i=0; i< 'h10; i++) begin
         @(negedge t.clk);
         t.wr_data_reg = i;
         t.addr = i;
      end
      
      repeat (50) begin
         @(negedge t.clk);
         t.wr = $random;
         t.rd = ~t.wr;
         tiny_addr = $random;
         t.addr = {12'd0,tiny_addr};
         if (t.wr) begin
            t.wr_data_reg = $random;
         end
      end // repeat (50)
      $stop;
   end // initial begin
endmodule // tester


   
            
         
         
         
   
  