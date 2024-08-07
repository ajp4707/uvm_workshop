`include "uvm_macros.svh"

class counter_test extends uvm_test;

   `uvm_component_utils(counter_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      counter_pkg::nloops = 5;
      env = counter_env::type_id::create("env",this);     
   endfunction : build_phase
   
endclass // tester


   


   