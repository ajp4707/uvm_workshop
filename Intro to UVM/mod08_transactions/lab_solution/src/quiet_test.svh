class quiet_test extends uvm_test;

   `uvm_component_utils(quiet_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void end_of_elaboration_phase(uvm_phase phase);
      // Please set the verbosity level so that env and all components 
      // below it have a verbosity of 100
      env.set_report_verbosity_level_hier(100);
   endfunction : end_of_elaboration_phase


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      env = counter_env::type_id::create("env",this);
      
     // Please override the printer object in the factory with the bit_sink object
      printer::type_id::set_type_override(bit_sink::get_type());
   endfunction : build_phase
   
endclass : quiet_test


   


   