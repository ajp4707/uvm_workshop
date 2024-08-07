module other_formats;
  timeunit 1ns;
  timeprecision 100ps;
  
  string str = "A sample string";
  
  initial begin
    $timeformat (-9, 2, " ns", 5);
    $display("Here is my string: %s", str);
    $display("This is my module: %m");
    $printtimescale;
    for (int i = 1; i<= 3; i++) begin
      #1.23;
      $display("$time gives 64-bit integer:  %t",  $time);
      $display("$stime gives 32-bit integer: %t", $stime);
      $display("$realtime gives real number: %t", $realtime);
    end
  end
endmodule
 