class quiet_test extends uvm_test;

   `uvm_component_utils(quiet_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void end_of_elaboration_phase(uvm_phase phase);
      // Please set the verbosity level so that env and all components 
      // below it have a verbosity of 100

   endfunction : end_of_elaboration_phase


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      env = counter_env::type_id::create("env",this);
      
     // Please override the printer object in the factory with the bit_sink object

   endfunction : build_phase
   
endclass : quiet_test


   


   