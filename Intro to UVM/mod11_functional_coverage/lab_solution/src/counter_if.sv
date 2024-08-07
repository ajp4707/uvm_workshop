interface counter_if ;

  // Port List
  
   logic [7:0] data_in;
   logic [7:0] q;
   logic       clk=0;
   logic       inc=0;
   logic       ld=0;
   logic       rst=1;

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
   


      
endinterface : counter_if