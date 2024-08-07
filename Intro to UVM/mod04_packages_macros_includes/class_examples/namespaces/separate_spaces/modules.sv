module mod1;
   integer a;

   initial begin
      #5ns;
      a = 1;
      $display("%0t: a in %m:%0d",$time,a);
   end
endmodule // mod1

module mod2;
  integer a;

   initial begin
      a = 10;
      #6ns;
      $display ("%0t: a in %m:%0d",$time,a);
   end
endmodule // mod2

module top;
   initial       $timeformat(-12, 0, " ps");
   mod1 m1();
   mod2 m2();
endmodule // top
