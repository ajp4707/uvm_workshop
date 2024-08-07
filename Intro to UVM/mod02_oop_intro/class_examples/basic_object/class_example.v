  class rectangle_t;
    int length;
    int width;
    
    function new(int l, int w);
      length = l;
      width  = w;
    endfunction
    
    function integer area;
      return length * width;
    endfunction
  endclass
  
  class square_t extends rectangle_t;
  
    function new(int side);
      super.new(side,side);
    endfunction
  
  endclass
  
  module class_example ;
    rectangle_t rectangle;
    square_t    square;
    initial begin
      rectangle = new(50,20);
      $display("rectangle area: %0d", rectangle.area);
      square = new(50);
      $display("square area: %0d", square.area);
    end
  endmodule

