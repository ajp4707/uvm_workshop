`include "macros.svh"
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


