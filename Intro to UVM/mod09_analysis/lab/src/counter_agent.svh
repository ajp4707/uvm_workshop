`include "uvm_macros.svh"

class counter_agent extends uvm_agent;


   virtual interface counter_if i;
   logic [7:0] beh_q;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      i = global_cif;

   endfunction : build_phase
   
   
endclass


   


   
