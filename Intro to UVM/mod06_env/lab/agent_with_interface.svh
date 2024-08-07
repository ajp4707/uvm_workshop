// The agent_with_interface class will be the base class for all
// objects that wish to have access to the DUT.

// Please define a class called agent_with_interface that extends uvm_agent



   // Please declare a variable called 'i' that will hold a
   // counter_if interface.  This is a "virtual interface" so be sure
   // to use the "virtual" keyword
   


   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   // Please create the build() function.    
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Please copy the global counter interface into i

   endfunction : build_phase
   
endclass


   


   
