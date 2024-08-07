`define info(msg)     uvm_top.uvm_report_info($psprintf("%m"), msg);
`define warning(msg)  uvm_top.uvm_report_warning($psprintf("%m"), msg);
`define error(msg) \
                      uvm_top.uvm_report_error($psprintf("%m"), msg);
`define fatal(msg)    uvm_top.uvm_report_fatal($psprintf("%m"), msg);

import uvm_pkg::*;

module top;
  initial begin
     `info ("My INFO message");
     `warning("My WARNING message");
     `error("My ERROR message");
     `fatal("It's FATAL!");
  end
endmodule // top

   