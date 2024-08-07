module memory (memory_if.mem_mp m);
   logic [15:0] mem [2**16-1 : 0];
   
   assign m.data = (m.rd) ? mem[m.addr] : 16'hZZZZ;
   
   always @(posedge m.clk) 
     if (m.wr) 
       if (m.addr == 3)        // inserting an error
         mem[m.addr] = m.data+1;
       else
         mem[m.addr] = m.data;
         

endmodule // memory
