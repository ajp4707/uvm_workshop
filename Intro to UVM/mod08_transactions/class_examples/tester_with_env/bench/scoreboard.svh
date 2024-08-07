 `include "uvm_macros.svh"

class scoreboard extends uvm_agent;

   `uvm_component_utils(scoreboard)    
   uvm_object tmp;
   interface_holder ifh;
   virtual interface memory_if mif;
   logic [15:0] testmem [2**16-1:0];    

   // constructor
   function new(string name = "scoreboard", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Insert Build Code Here
      if(!get_config_object("ifh", tmp, 0)) begin
         `uvm_error("build", "no virtual interface available");
      end
      else begin
         if(!$cast(ifh, tmp)) begin
            `uvm_error("build", "virtual interface is incorrect type");
         end
         else begin
            mif = ifh.mif;
         end
      end 
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      forever begin
         @(posedge mif.clk);
         if (mif.rd) begin
            #1;
            assert(mif.data === testmem[mif.addr]) else
              `uvm_error("run",
                               $psprintf("expected %0h  actual: %0h",
                                         testmem[mif.addr],mif.data));
         end
         if (mif.wr) 
           testmem[mif.addr] = mif.data;
      end
   endtask : run_phase
   
  
endclass : scoreboard
