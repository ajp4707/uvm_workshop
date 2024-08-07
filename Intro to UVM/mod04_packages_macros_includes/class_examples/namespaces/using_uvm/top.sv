import uvm_pkg::*;

module top;
   initial begin
      #10ns;
      uvm_top.uvm_report_info($psprintf("%m"),"THIS IS AN INFO MESSAGE");
   end
endmodule // top
