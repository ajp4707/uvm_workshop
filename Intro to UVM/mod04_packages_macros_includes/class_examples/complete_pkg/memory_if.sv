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

   assign data = (wr) ? wr_data_reg : 16'hZZZZ;
   
   // monitor data and generate clock
   
   initial begin
      $monitor("addr: %1h  data: %4h   rd: %1b  wr: %1b",
                  addr, data, rd, wr);
      clk = 0;
      forever begin
         #10;
         clk = ~clk;
      end
   end
   

endinterface : memory_if