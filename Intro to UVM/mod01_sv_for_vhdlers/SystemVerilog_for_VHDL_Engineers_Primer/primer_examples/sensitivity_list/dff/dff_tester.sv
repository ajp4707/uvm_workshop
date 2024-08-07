module top ;

reg clk;
reg rst;
reg d;
wire q_sv, q_vhd;

initial begin
  clk = 0;
  rst = 1;
  #1ns;
  rst = 0;
  @(posedge clk);
  rst = 1;
end

always @(negedge clk) d = $random;

always @(posedge clk) begin
  #1ns;
  assert((d == q_sv) && (d == q_vhd));
end

always #10ns clk = ~clk;

   dff dff_sv(
      .clk (clk),
      .rst (rst),
      .d   (d),
      .q   (q_sv)
   );

   dff_vhdl dff_vhdl(
      .clk (clk),
      .d   (d),
      .rst (rst),
      .q   (q_vhd)
   );

endmodule
