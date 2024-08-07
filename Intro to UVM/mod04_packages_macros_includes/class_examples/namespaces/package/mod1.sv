module mod1;
   initial begin
      #5ns;
      mypackage::a = 1;
      $display("%0t: a in %m:%0d",$time,mypackage::a);
   end
endmodule // mod1

