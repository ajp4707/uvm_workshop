package memory_pkg;
   import uvm_pkg::*;
   
class tester;
   
   logic [3:0]  tiny_addr;
   virtual      interface memory_if t;
   
   function new(virtual interface memory_if it);
      t = it;
   endfunction // new

   task run;
      t.wr = 1'b1;
      for (int i=0; i< 'h10; i++) begin
         @(negedge t.clk);
         t.wr_data_reg = i;
         t.addr = i;
      end
      
      repeat (50) begin
         @(negedge t.clk);
         t.wr = $random;
         t.rd = ~t.wr;
         tiny_addr = $random;
         t.addr = {12'd0,tiny_addr};
         if (t.wr) begin
            t.wr_data_reg = $random;
         end
      end 
      $stop;
   endtask // run
endclass // tester

class monitor;
   virtual interface memory_if mi;

   function new (virtual interface memory_if imi);
      mi = imi;
   endfunction
     
   task run;
      forever begin
         @(mi.addr or mi.data or mi.rd or mi.wr);
         `info($psprintf("addr: %1h  data: %4h   rd: %1b  wr: %1b",mi.addr, mi.data, mi.rd, mi.wr));
      end
      
   endtask // run
   
endclass // monitor
  
class scoreboard;

   virtual interface memory_if mi;
   logic [15:0] testmem [2**16-1:0];    
   
   function new(virtual interface memory_if imi);
     mi = imi;
   endfunction // new
   
   
   task run;
      forever begin
         @(posedge mi.clk);
         if (mi.rd) begin
            #1;
            assert(mi.data === testmem[mi.addr]) else
              `error($psprintf("expected data to be %4h but saw %4h",testmem[mi.addr],mi.data));
         end
         
         if (mi.wr) 
           testmem[mi.addr] = mi.data;
      end
   endtask // run
endclass // scoreboard


         
         
         
   
  `include "tester.svh"
`include "monitor.svh"
`include "scoreboard.svh"
endpackage // memory_pkg
   
   
   