class verbose_test extends counter_test;

   `uvm_component_utils(verbose_test)    

     function new(string name = "", uvm_component parent);
        super.new(name, parent);
     endfunction : new


   function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      env.set_report_verbosity_level_hier(UVM_LOW);
   endfunction : end_of_elaboration_phase

endclass : verbose_test


