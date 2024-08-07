interface counter_if ;

  // Port List
  
   logic [7:0] data_in;
   logic [7:0] q;
   logic       clk;
   logic       inc;
   logic       ld;
   logic       rst;

  // Monitor Modport
   
   modport cntr_mp (
                   input data_in,
                   output  q,
                   input  clk,
                   input  inc,
                   input  ld,
                   input  rst
                   );

   initial begin : clock_gen
      clk = 0;
      forever #10 clk = ~clk;
   end
   
   initial begin : reset_dut
      rst = 0;
      @(posedge clk);
      @(negedge clk);
      rst = 1;
   end

      
endinterface : counter_if