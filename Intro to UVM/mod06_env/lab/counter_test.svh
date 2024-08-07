class counter_test extends uvm_test;

   `uvm_component_utils(counter_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please set verbose in the counter_pkg to 1
      counter_pkg::verbose = 1;
      // Please insert code to create an instance of counter_env called env using the factory
      env = counter_env::type_id::create("env",this);
      
   endfunction : build_phase
   
endclass : counter_test


   


   