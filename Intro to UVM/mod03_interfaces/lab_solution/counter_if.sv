interface counter_if ;


   // Please declare the following signals:
   // data_in, and q_beh are 8-bit logic values
   // clk, inc, ld, and rst are single bit logic values
  
   logic [7:0] data_in;
   logic [7:0] q, q_beh;
   logic       clk;
   logic       inc;
   logic       ld;
   logic       rst;


   // Please define a modport called cntr_mp.  The modport should declare inputs
   // and outputs.
   // inputs: data_in, clk, inc, ld, rst
   // output q
   
   modport cntr_mp (
                   input data_in,
                   output  q,
                   input  clk,
                   input  inc,
                   input  ld,
                   input  rst
                   );

   // Please create an initial block with a forever loop to generate the clock
   initial begin : clock_gen
      clk = 0;
      forever #10 clk = ~clk;
   end

   // Please create an initial block that holds the reset low for two clock cycles
   initial begin : reset_dut
      rst = 0;
      @(posedge clk);
      @(negedge clk);
      rst = 1;
   end

   always @(posedge clk) begin: beh_cntr
      if (!rst)
        q_beh <= 0;
      else
        if (ld)
          q_beh <= data_in;
        else if (inc)
          q_beh++;
   end

   // Please create an always block that runs on the negative edge of the clock and asserts that q = q_beh
   always @(negedge clk) begin : check_dut
      $display ("data_in: %2h =>   q: %2h   inc: %1b  ld: %1b",
                data_in, q, inc, ld);
      assert(q === q_beh) else 
        $display ("mismatch q: %2h   q_beh: %2h",q,q_beh);
   end
      
endinterface : counter_if