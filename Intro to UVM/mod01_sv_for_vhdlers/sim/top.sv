module top;
   logic [7:0] data_in;
   bit         clk, inc, ld, rst;
   wire [7:0]  q;
   logic [7:0] q_beh;


   counter DUT(.data_in(data_in),.q(q),.clk(clk),.inc(inc),.ld(ld),.rst(rst));

   always #10 clk = ~clk;

   initial begin : reset_block
      clk = 0;
      rst = 0;
      @(posedge clk);
      @(negedge clk);
      rst = 1;
      data_in = $random;
      ld = 1'b1;
      inc = 1'b0;
      @(negedge clk);
      @(negedge clk);
      repeat(50) begin : do_mult_stim
         {ld, inc} = $random;
         data_in = $random;
         @(negedge clk);
         @(negedge clk);
      end
      $stop;
   end

   always @(posedge clk) begin: beh_cntr;
      if (!rst)
        q_beh <= 0;
      else
        if (ld)
          q_beh <= data_in;
        else if (inc)
          q_beh++;
   end

   always @(negedge clk) begin : test_dut
      assert(q == q_beh);
   end
          
endmodule // top

   