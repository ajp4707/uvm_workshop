class quiet_test extends uvm_test;

   `uvm_component_utils(quiet_test)   
    
   virtual interface memory_if mif;
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
      
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mif = memory_pkg::global_mif;
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      int nloops=5;
      logic [3:0] tiny_addr;

      phase.raise_objection(this);
      mif.wr = 1'b1;
      for (int i=0; i< 'h10; i++) begin
         @(negedge mif.clk);
         mif.wr_data_reg = i;
         mif.addr = i;
      end

      `uvm_info("MEMORY TEST", $psprintf("Running %0d loops",nloops),UVM_MEDIUM);
      
      repeat (nloops) begin
         @(negedge mif.clk);
         mif.wr = $random;
         mif.rd = ~mif.wr;
         tiny_addr = $random;
         mif.addr = {12'd0,tiny_addr};
         if (mif.wr)  mif.wr_data_reg = $random;
      end
      @(negedge mif.clk);
      phase.drop_objection(this);
   endtask // run
   
endclass : quiet_test


