class printer extends uvm_agent;

   `uvm_component_utils(printer)    
   virtual interface memory_if mif;
   
   function new(string name = "printer", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mif = global_mif;
   endfunction : build_phase

   task run_phase(uvm_phase phase);
      forever begin
        @(posedge mif.clk);
        `uvm_info("run",
                        $psprintf("addr: %1h  data:%4h  rd: %1b  wr: %1b",
                                  mif.addr, mif.data, mif.rd, mif.wr),UVM_MEDIUM);
      end
   endtask : run_phase
   
endclass : printer
