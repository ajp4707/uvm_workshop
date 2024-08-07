interface counter_if ;

   // Please declare the following signals:
   // data_in is an 8-bit logic value
   // q, and q_beh are 8-bit logic values
   // clk, inc, ld, and rst are single bit logic values

   // Please define a modport called cntr_mp.  The modport should declare inputs
   // and outputs.
   // inputs: data_in, clk, inc, ld, rst
   // output q

   // Please create an initial block with a forever loop to generate the clock

   // Please create an initial block that holds the reset low for two clock cycles

   always @(posedge clk) begin: beh_cntr
      if (!rst)
        q_beh <= 0;
      else
        if (ld)
          q_beh <= data_in;
        else if (inc)
          q_beh++;
   end

   // Please create an always block that runs on the negative edge of the clock and asserts that q = q_beh

endinterface : counter_if