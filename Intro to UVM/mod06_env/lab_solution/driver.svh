// Please create a class called driver that extends counter_agent

class driver extends agent_with_interface;

   `uvm_component_utils(driver);

   integer nloops = 5;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      // Please call super.build_phase() so that you get access to the interface
      super.build_phase(phase);    
   endfunction : build_phase
   
   task run_phase(uvm_phase phase);
     // Please add a call to raise_objection to keep the simulation from ending
     phase.raise_objection(this);
      `uvm_info("run",
                $psprintf("Running with %0d loops",nloops),UVM_MEDIUM);
      repeat (nloops) begin
         @(negedge i.clk);
         {i.ld, i.inc} = $random;
         i.data_in = $random;
      end
      // Please add a call to drop_objection to let the simulation end
      phase.drop_objection(this);
   endtask // run
endclass // tester


   


   