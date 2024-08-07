import mypackage::*;

module mod1;
   initial begin
      #5ns;
      a = 1;
      $display("%0t: a in %m:%0d",$time,a);
   end
endmodule // mod1
