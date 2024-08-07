module memory (memory_if.mem_mp m);
   logic [15:0] mem [2**16-1 : 0];
   
   assign m.data = (m.rd) ? mem[m.addr] : 16'hZZZZ;
   
   always @(posedge m.clk) 
     if (m.wr) 
       mem[m.addr] = m.data;

endmodule // memory

