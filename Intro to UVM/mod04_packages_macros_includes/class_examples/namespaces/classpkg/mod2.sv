import mypackage::*;

module mod2;
   mem_op my_op = new();
   initial begin
      #6ns;
      assert(common_op.randomize());
      assert(my_op.randomize());
      $display ("%0t: common_op in %m:%0d",
                $time,common_op.convert2string());
      $display ("%0t: my_op in %m:%0d",
                $time,my_op.convert2string());
   end
endmodule // mod2


