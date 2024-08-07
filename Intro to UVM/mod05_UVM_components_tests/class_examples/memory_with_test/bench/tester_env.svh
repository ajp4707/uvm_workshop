class tester_env extends uvm_env;

   `uvm_component_utils(tester_env)    
   uvm_object tmp;
   interface_holder ifh;
   virtual interface memory_if mif;

   // constructor
   function new(string name = "tester_env", uvm_component parent = null );

      super.new(name, parent);
      // Insert Constructor Code Here
   endfunction : new

   // build
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Insert Build Code Here
      mif = memory_pkg::global_mif;
      
   endfunction : build_phase

   task run();
      int nloops=5;
      logic [3:0] tiny_addr;
      virtual     interface memory_if t;
      mif.wr = 1'b1;
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
   global_stop_request();
endtask // run

endclass : tester_env

`endif