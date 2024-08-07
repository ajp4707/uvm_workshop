module top;
   logic [7:0] data_in;
   bit         clk, inc, ld, rst;
   wire [7:0]  q;


   counter DUT(.data_in(data_in),.q(q),.clk(clk),.inc(inc),.ld(ld),.rst(rst));

   
endmodule // top

   