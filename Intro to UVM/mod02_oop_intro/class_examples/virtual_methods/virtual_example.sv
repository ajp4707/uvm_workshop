class rectangle_t;
   int length;
   int width;
   
   function new(int l, int w);
      length = l;
      width  = w;
   endfunction
   
   function integer area;
      return length * width;
   endfunction // new

   virtual task print_area;
      $display ("rectangle area: %0d", area);
   endtask //
   
endclass

class square_t extends rectangle_t;
   
   function new(int side);
      super.new(side,side);
   endfunction // new
   
   virtual task print_area;
      $display("square area: %0d", area);
   endtask // print_area
   
   
endclass

module virtual_example ;
   rectangle_t rectangle, sq;
   square_t    square;
   initial begin
      rectangle = new(50,20);
      rectangle.print_area;
      square = new(50);
      rectangle = square;
      rectangle.print_area;
   end
endmodule
