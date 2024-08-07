`define info(msg)     uvm_top.uvm_report_info($psprintf("%m"), msg);
`define warning(msg)  uvm_top.uvm_report_warning($psprintf("%m"), msg);
`define error(msg) \
                      uvm_top.uvm_report_error($psprintf("%m"), msg);
`define fatal(msg)    uvm_top.uvm_report_fatal($psprintf("%m"), msg);

   