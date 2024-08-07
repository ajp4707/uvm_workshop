class counter_test extends uvm_test;

   `uvm_component_utils(counter_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Please insert code to create an instance of counter_env called env using the factory       
      counter_pkg::verbose = 1;
      env = counter_env::type_id::create("env",this);
      
   endfunction : build_phase
   
endclass : counter_test


   


   