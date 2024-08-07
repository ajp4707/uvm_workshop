module counter (counter_if.cntr_mp i);
   always @(posedge i.clk)
     if (!i.rst)
       i.q <= 0;
     else
       if (i.ld)
         i.q <= i.data_in;
       else if (i.inc)
         i.q++;
endmodule // counter
