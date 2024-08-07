module dff (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q);

   always @(posedge clk or
            negedge rst)
     if (!rst)
       q <= 0;
     else
       q <= d;

endmodule // dff



