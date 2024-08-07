module top;

   bit clk;
   
   initial begin
      clk = 0;
   end

   initial #200 begin
      $stop;
   end
   

   always #20 begin
      clk = ~clk;
   end
   

   always @(posedge clk) begin
      $display("always positive edge");
   end

   initial @(negedge clk) begin
      $display ("initial negative edge");
   end

endmodule // top
