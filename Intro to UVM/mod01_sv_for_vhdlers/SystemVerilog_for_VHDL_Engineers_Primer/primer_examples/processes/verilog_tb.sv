
module top;

// Local declarations

// Internal signal declarations
wire [7:0] A;
wire [7:0] B;
wire       clk;
wire       rst_n;
wire       carry;
wire [7:0] sum;


adder U_0(
   .A     (A),
   .B     (B),
   .clk   (clk),
   .rst_n (rst_n),
   .carry (carry),
   .sum   (sum)
);
//  hds hds_inst

adder_tester U_1(
   .A     (A),
   .B     (B),
   .clk   (clk),
   .rst_n (rst_n),
   .carry (carry),
   .sum   (sum)
);

endmodule // adder_tb


