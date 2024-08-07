module mod2;
  integer a;
   initial begin
      mypackage::a = 10;
      #6ns;
      $display ("%0t: a in %m:%0d",$time,mypackage::a);
   end
endmodule // mod2


