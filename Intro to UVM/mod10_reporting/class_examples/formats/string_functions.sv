module string_functions;
  string str1;
  string str2;
  logic [7:0] a = 8'h2E;
  
  initial begin
    $sformat (str1, "%m : a = %2h", a);
    str2 = $psprintf("%m : a = %8b", a);
    $display (str1);
    $display (str2);
    $display ("%m : a = %3o",a);
    $display("concatenate str1 and str2");
    str1 = {str1, " cocatenated with " , str2};
    $display (str1);
  end
endmodule
