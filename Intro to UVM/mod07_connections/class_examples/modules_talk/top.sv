import uvm_pkg::*;

module top;
   wire [7:0] data;

   producer p (data);
   consumer c (data);

endmodule // top

module producer (output logic [7:0] data);
   initial 
      for (int i = 1; i<= 5; i++) begin
         data = i;
         #1;
      end
   
endmodule // producer

module consumer (input wire [7:0] data);
   always @(data) 
      uvm_top.uvm_report_info($psprintf("%m"),
                              $psprintf("data:  %0d", data));
endmodule // consumer

     