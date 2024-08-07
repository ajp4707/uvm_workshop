module mux_sv(
   input[7:0] a, b,
   input sel,
   output logic [7:0] dat_out);

   assign dat_out = (sel) ? a : b;

endmodule

