module counter (
                input wire [7:0] data_in,
                output reg [7:0] q,
                input wire clk,
                input wire inc,
                input wire ld,
                input wire rst);
`protect
   always @(posedge clk)
     if (!rst)
       q <= 0;
     else
       if (ld)
         q <= data_in;
       else
         q++;
`endprotect
endmodule // counter
