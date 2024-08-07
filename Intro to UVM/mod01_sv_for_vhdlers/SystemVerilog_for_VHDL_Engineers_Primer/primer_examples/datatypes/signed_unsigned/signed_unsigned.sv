module top;

byte             abyte;
byte   unsigned  usbyte;

initial begin
  abyte   = 8'b1111_1111;
  usbyte = 8'b1111_1111;
  $display("signed: %d, unsigned: %d",abyte, usbyte);
end

endmodule

