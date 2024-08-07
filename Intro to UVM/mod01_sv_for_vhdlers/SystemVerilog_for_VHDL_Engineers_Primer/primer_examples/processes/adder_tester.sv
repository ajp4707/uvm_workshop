module adder_tester (
output reg[7:0]   A,
output reg[7:0]   B,
output reg        clk,
output reg        rst_n,
input  wire       carry,
input  wire [7:0] sum);

initial begin
  clk = 0;
  rst_n = 0;
  A = 0;
  B = 0;
  @(posedge clk);
  @(posedge clk);
  rst_n = 1;
end

always #10 clk = ~clk;

initial begin
   @(posedge rst_n);
   for (A = 0; A <= 25; A ++) begin
      for (B = 0; B <= 10; B++) begin
         @(posedge clk);
         @(negedge clk);
         assert({carry,sum} == A + B) else begin
            $display("%0d + %0d = %0d not %0d",A, B, A+B,{carry,sum});
            $stop;
         end
      end
   end
   $stop;
end


endmodule // adder_tester


