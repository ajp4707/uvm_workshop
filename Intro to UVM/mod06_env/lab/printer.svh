// Please declare a class called printer that extends agent_with_interface


   // Please use the uvm_component_utils macro to tell the UVM about the 
   // printer class


   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   // Please create a run task that loops forever and prints 
   // out the data on the counter pins at the negative edge 
   // of the clock

endclass : printer


   


   
