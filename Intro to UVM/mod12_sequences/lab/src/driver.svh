// Please create the driver object by extending uvm_driver so that
// it will work with crt_req and ctr_output transction types


   `uvm_component_utils(driver);
   interface_holder ifh;
   uvm_object tmp;
   virtual interface counter_if i; 
   ctr_req req;
   ctr_output rsp;
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);


      i = counter_pkg::global_cif;

   endfunction : build_phase

   task run_phase(uvm_phase phase);
      forever begin : forever_loop
         @(negedge i.clk);
         i.inc = 0;
         i.ld  = 0;
         i.rst = 1;
         // Please get the next item from seq_item_port

         if (req!=null) begin : got_req
           // Please tell the UVM that you successfully got an item            

           `uvm_info("run",
                           $psprintf("Driver got %s",
                            req.convert2string()), 
                            UVM_DEBUG)
           case(req.op) 
             load : begin : do_load
               i.ld = 1;
               i.data_in = req.data;
             end : do_load
             
             inc : begin : do_inc
               i.inc = 1;
             end : do_inc
             
             reset : i.rst = 0;
               
             nop : begin end
           endcase
          end : got_req
          @(posedge i.clk);
          #1;
          rsp = new;
          rsp.data = i.cntr_mp.q;
          // Please set the response ID to be the same as the request ID

          // Please put the response into seq_item_port

      end : forever_loop
   endtask // run
endclass // tester


   


   
