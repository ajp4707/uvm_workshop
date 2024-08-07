//
// Test Bench Module systemver_primer_lib.adder_tb.adder_tester
//
// Created:
//          by - Ray.UNKNOWN (WRITINGMACHINE)
//          at - 20:32:29 04/20/2009
//
// Generated by Mentor Graphics' HDL Designer(TM) 2008.1 (Build 17)
//
`resetall
`timescale 1ns/10ps

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


