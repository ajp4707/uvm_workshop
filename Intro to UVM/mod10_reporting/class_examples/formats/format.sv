module format_example;
  int myint = 15;
  real rn   = 13.1415926;
  
  initial begin 
    
    $display("myint:", myint);
    
    $display("binary: %0b,  hex: %0h   octal: %0O  decimal: %0d", 
              myint, myint, myint, myint);
              
              
    $display ("4.2:%4.2f / 4.0:%4.0f / 6.5:%6.5f",rn,rn,rn);
    
    
  end
endmodule
  
  