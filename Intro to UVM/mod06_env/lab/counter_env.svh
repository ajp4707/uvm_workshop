`include "uvm_macros.svh"

class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   // Please declare three variable of the following types: driver, scorboard, and printer

   // Please declare a variable called 'verbose' of type int.

   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please create an instance of the driver using the variable you declared above


      // Please create an instance of the scoreboard using the variable you declared above

      
      // Please test the verbose variable.  If it is non-zero create an instance of the printer object


      
   endfunction : build_phase
   
endclass // tester


   


   