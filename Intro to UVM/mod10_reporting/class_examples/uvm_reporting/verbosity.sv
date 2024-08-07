import uvm_pkg::*;
`include "uvm_macros.svh"

class verbosity_test extends uvm_test;

   `uvm_component_utils(verbosity_test)    
     int warning_file, error_file, printer_file, warning_error_files;
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

   task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
      
      `uvm_info   ("MSG","This is INFO", 300);
      `uvm_warning("PRINTER","This is a PRINTER WARNING");
      `uvm_warning("MSG", "This is a WARNING");
      
      `uvm_error  ("MSG","This is an ERROR");
      `uvm_error ("PRINTER","This is a PRINTER ERROR");
      `uvm_fatal ("MSG", "This is FATAL");
      
      phase.drop_objection(this);

   endtask
   
   function void end_of_elaboration_phase(uvm_phase phase);
      warning_file = $fopen("warnings.txt");
      error_file   = $fopen("errors.txt");
      printer_file   = $fopen("printer.txt");
      
      set_report_id_file("PRINTER", printer_file); 
      
      set_report_severity_action(UVM_WARNING, UVM_DISPLAY | UVM_LOG);
      set_report_severity_file(UVM_WARNING,warning_file);
      
      set_report_severity_action(UVM_ERROR, UVM_DISPLAY | UVM_LOG);
      set_report_severity_file  (UVM_ERROR, error_file);

      dump_report_state();
   endfunction : end_of_elaboration_phase
   
endclass : verbosity_test


module verbosity;
   
   initial run_test("verbosity_test");
   
endmodule
