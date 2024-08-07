import mypackage::*;

module mod2;
   initial begin
      a = 10;
      #6ns;
      $display ("%0t: a in %m:%0d",$time,a);
   end
endmodule // mod2
