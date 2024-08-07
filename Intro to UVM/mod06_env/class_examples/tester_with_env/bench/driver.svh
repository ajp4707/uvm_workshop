class driver extends uvm_agent;

   `uvm_component_utils(driver)    
     virtual interface memory_if mif;

   // constructor
   function new(string name = "driver", uvm_component parent = null );

      super.new(name, parent);
      // Insert Constructor Code Here
   endfunction : new

   // build
   virtual   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mif = memory_pkg::global_mif;
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      int nloops=5;
      logic [3:0] tiny_addr;
      phase.raise_objection(this);
      mif.wr = 1'b1;
      
      //initialize memory
      for (int i=0; i< 'h10; i++) begin
         @(negedge mif.clk);
         mif.wr_data_reg = i;
         mif.addr = i;
      end

      repeat (nloops) begin
         @(negedge mif.clk);
         mif.wr = $random;
         mif.rd = ~mif.wr;
         tiny_addr = $random;
         mif.addr = {12'd0,tiny_addr};
         if (mif.wr) begin
            mif.wr_data_reg = $random;
         end
      end
      @(negedge mif.clk);
      phase.drop_objection(this);
   endtask : run_phase
   
endclass : driver
