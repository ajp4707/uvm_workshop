module adder
  ( input [7:0] A,
    input [7:0] B,
    input clk,
    input rst_n,
    output reg [7:0] sum,
    output reg carry);

  always @(posedge clk or negedge rst_n)
    if (!rst_n)
      {carry,sum} <= 0;
    else
      {carry,sum} <= A + B;
endmodule


