`include "uvm_macros.svh"

class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   // Please declare three variable of the following types: driver, scorboard, and printer
   driver drv;
   scoreboard sb;
   printer p;

   // Please declare a variable called 'verbose' of type int.
   int     verbose;
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please create an instance of the driver using the variable you declared above
      drv = driver::type_id::create("drv",this);

      // Please create an instance of the scoreboard using the variable you declared above
      sb  = scoreboard::type_id::create("sb",this);
      
      // Please test the verbose variable.  If it is non-zero create an instance of the printer object

      if (counter_pkg::verbose) p = printer::type_id::create("p",this);

      
   endfunction : build_phase
   
endclass // tester


   


   