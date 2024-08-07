module top;

   logic [3:0] halfbyte;

   logic [1:8] reversebits_mem[7:0];

   int        address;

   initial begin
      for (address = 0; address <= 7; address++)
        reversebits_mem[address] = address;

      halfbyte = reversebits_mem[6][5:8];

      $display("reversebits_mem[6]: %b",reversebits_mem[6]);
      $display("halfbyte = reversebits_mem[6][5:8];");
      $display("halfbyte: %b", halfbyte);
      $display("two bits - halfbyte[2:1]: %b", halfbyte[2:1]);
   end

endmodule // top


