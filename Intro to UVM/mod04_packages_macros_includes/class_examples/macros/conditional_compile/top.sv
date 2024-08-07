import uvm_pkg::*;

`define INFO(msg)       uvm_top.uvm_report_info($psprintf("%m"), msg);

`ifdef FIRST
module top;
   initial `INFO("FIRST Defined");
endmodule // top

`else

module top;
   initial `INFO("FIRST Undefined");
endmodule // top

`endif // !`ifdef FIRST
