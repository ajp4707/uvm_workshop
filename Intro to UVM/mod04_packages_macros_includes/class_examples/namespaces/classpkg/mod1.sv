import mypackage::*;

module mod1;
   mem_op my_op =new();
   initial begin
      common_op.op=write;
      common_op.addr = 0;
      common_op.data = 8'hFF;
      my_op.op = write;
      my_op.addr = 0;
      my_op.data = 8'hFF;
      #10;
      $display("%0t: common_op in %m:%0s",
                    $time,common_op.convert2string());
      $display("%0t: myop in %m:%0s",
                    $time,my_op.convert2string());
   end
endmodule // mod1

