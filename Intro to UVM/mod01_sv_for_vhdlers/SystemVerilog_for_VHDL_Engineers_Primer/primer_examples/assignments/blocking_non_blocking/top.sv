module top;

logic[7:0] a, b, c, d;
logic [16:0] vhdl_out, sv_out, predicted;
bit clk, rst_n;

multadd_vhdl VHDL_MUX(.*, .mulsum(vhdl_out));
multadd_sv SV_MUX (.*, .mulsum(sv_out));

initial begin
 $monitor("%t: a: %h  b: %h  c: %h  d: %h   predicted: %h  vhdl_out: %h   sv_out:  %h",
     $time,a, b, c, d, predicted, vhdl_out, sv_out);
 clk = 0;
 rst_n = 0;
 @(posedge clk);
 @(negedge clk);
 rst_n = 1;
end

always #10ns clk = ~clk;

initial begin
   @(negedge clk);
   @(negedge clk);
   repeat (10) begin
     @(negedge clk);
     a = $random;
     b = $random;
     c = $random;
     d = $random;
     predicted = a*b + c*d;
     @(posedge clk);
     #1ns;
     assert((vhdl_out == predicted) && (sv_out == predicted));
    end
    $stop;
  end


endmodule

