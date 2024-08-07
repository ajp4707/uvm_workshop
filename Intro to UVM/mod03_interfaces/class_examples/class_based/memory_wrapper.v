module memory_wrapper (memory_if.mem_mp m);

   
   memory VHDL_DUT 
     (.clk(m.clk),
      .rd(m.rd),
      .wr(m.wr),
      .addr(m.addr),
      .data(m.data));


endmodule // memory
