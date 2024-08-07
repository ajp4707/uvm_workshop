class driver extends interface_base;
   `uvm_component_utils(driver)    

   uvm_get_port #(mem_req) req_f;

   function new(string name = "driver", 
                uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     req_f = new("req_f",this);
   endfunction: build_phase
   
   task run_phase(uvm_phase phase);
     mem_req req;
      forever begin : driver_loop
         @(negedge mif.clk);
         mif.wr = 0;
         mif.rd = 0;
         if (req_f.try_get(req)) begin : got_a_txn
            mif.wr = (req.op == write);
            mif.rd = (req.op == read);
            mif.addr = req.addr;
            mif.wr_data_reg = req.data;
         end : got_a_txn   
      end : driver_loop
    endtask 

endclass : driver

