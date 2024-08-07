module top;

   bit clk;

   initial begin
      clk = 0;
      forever begin
       #10ns;
       clk = ~clk;
      end
   end

   always begin
      @(clk);
      $display("At %0d Saw edge", $realtime);
   end

   always begin
      @(posedge clk);
      $display ("At %0d Saw positive edge", $realtime);
   end

   always begin
      @(negedge clk);
      $display ("At %0d Saw negative edge", $realtime);
   end

endmodule


