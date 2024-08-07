module clock_gen (output bit clock);

   initial begin
      clock = 0;
   end

   always begin
      #10ns;
      clock = ~clock;
   end

endmodule


