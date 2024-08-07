`include "macros.svh"
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
