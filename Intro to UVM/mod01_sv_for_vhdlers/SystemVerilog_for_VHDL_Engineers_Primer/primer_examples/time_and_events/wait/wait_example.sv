module top;

   integer x;

   initial begin
      x = 10;
      forever begin
         #1ns;
         x--;
      end
   end

   initial begin
      wait (!x);
      $display("At %0d: x is 0", $realtime);
      $finish;
   end
endmodule // top

