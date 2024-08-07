// Please declare a class called counter_test that extends uvm_test
class counter_test extends uvm_test;

   // Please use the uvm_component_utils macro to tell the UVM about counter_test
   `uvm_component_utils(counter_test);

   integer nloops = 5;

   virtual interface counter_if i;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

    // Please create a build() method that will do the following:
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      // Please set the local virtual interface "i" equal to the 
      // global counter_if that you created in the package file.
      
      i = counter_pkg::global_ctr_if;
      
   endfunction : build_phase
   
   
   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      repeat (nloops) begin
         @(negedge i.clk);
         {i.ld, i.inc} = $random;
         i.data_in = $random;
         `uvm_info("run",$psprintf("data_in: %2h q: %2h  ld: %1b,  inc: %1b",
                                         i.data_in, i.q, i.ld, i.inc),UVM_MEDIUM);
      end
      phase.drop_objection(this);
   endtask : run_phase
endclass // tester


   


   