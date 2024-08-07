module multadd_sv
   (input [7:0] a, b, c, d,
    input clk, rst_n,
    output logic [16:0] mulsum
    );

    logic[16:0] ab, cd, ab_cd;

    always @(a or b or c or d)
      begin
        ab = a * b;
        cd = c * d;
        ab_cd = ab + cd;
      end

    always @(posedge clk)
      if (!rst_n)
        mulsum <= 0;
      else
        mulsum <= ab_cd;

endmodule


