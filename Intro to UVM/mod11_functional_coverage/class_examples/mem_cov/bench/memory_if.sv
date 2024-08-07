interface memory_if ;

   logic [15:0] wr_data_reg;
   wire  [15:0] data;
   logic [15:0] addr;
   bit          clk;
   bit          rd;
   bit          wr;
   
   modport mem_mp (
                   inout data,
                   input addr,
                   input clk,
                   input rd,
                   input wr);

   modport tester(
                  output wr_data_reg,
                  input clk,
                  output addr,
                  output rd,
                  output wr);
   modport responder(
                  input addr,
                  input data,
                  input rd,
                  input clk
                  );
   modport monitor(
                  input addr,
                  input data,
                  input rd,
                  input wr,
                  input clk
                  );                  

   assign data = (wr) ? wr_data_reg : 16'hZZZZ;
   
   // monitor data and generate clock
   
   initial begin
      clk = 0;
      forever begin
         #10;
         clk = ~clk;
      end
   end
   
   //  Self Checking Test Bench
   
   

endinterface : memory_if