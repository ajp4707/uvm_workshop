import uvm_pkg::*;
`include "uvm_macros.svh"

typedef enum {read, write, nop} op_t;
typedef logic[15:0] addr_t;
typedef logic[7:0]  data_t;

class myrsp extends uvm_sequence_item;
  rand data_t data;
  
  function new();
    super.new();
  endfunction 
  
  function string convert2string;
    return $psprintf("data : %h", data);
  endfunction:convert2string
  
endclass : myrsp

class myreq extends myrsp;
  rand addr_t addr;
  rand op_t   op;
  
  function new();
    super.new();
  endfunction
  
  function string convert2string;
    return {super.convert2string(),$psprintf(" addr: %h  op %s",addr,op)};
  endfunction : convert2string

endclass : myreq
class mydriver extends uvm_driver #(myreq, myrsp);
   `uvm_component_utils(mydriver)

   logic [7:0]      beh_mem [2**16-1:0];

   myreq req;
   myrsp rsp;

   function new (string name, uvm_component parent);
      super.new(name,parent);
   endfunction : new

   task run_phase(uvm_phase phase);
      forever begin
         seq_item_port.get_next_item(req); // nonblocking
         if (req != null) begin
            seq_item_port.item_done();
            `uvm_info ("driver",{"got ",req.convert2string()}, UVM_MEDIUM);
            //
            // imagine that we are accessing signals in a DUT here
            // through an interface instead of just doing this 
            // behavioral modelling.
            // 
            case (req.op)
              read: begin : read_op
                 rsp = new();
                 rsp.data = beh_mem[req.addr];
                 rsp.set_id_info(req);
                 seq_item_port.put_response(rsp);
              end : read_op
              write: beh_mem[req.addr] = req.data;
            endcase 
         end
      end
   endtask : run_phase
endclass : mydriver

class initialize_sequence extends uvm_sequence #(myreq, myrsp);
  `uvm_object_utils(initialize_sequence);
  
  function new(string name = "");
    super.new(name);
  endfunction: new
 
  myreq req;
  myrsp rsp;
  
 task body();
   for (int i = 0; i<= 100; i++) begin
     req = new();
     start_item(req);
     req.addr = i;
     req.data = i+1;
     req.op   = write;
     `uvm_info("INIT",{"Sending transaction ",req.convert2string()}, UVM_MEDIUM);
     finish_item(req);
   end
 endtask: body    

endclass : initialize_sequence

class test_sequence extends uvm_sequence #(myreq, myrsp);
  `uvm_object_utils(test_sequence);
  
  function new(string name = "");
    super.new(name);
  endfunction: new
 
  myreq req;
  myrsp rsp;
  
 task body();
   repeat (20) begin
     req = new();
     start_item(req);
     assert(req.randomize() with {addr <=100;});
     `uvm_info("SEQ",{"Sending transaction ",req.convert2string()}, UVM_MEDIUM);
     finish_item(req);
     if (req.op== read) begin
       get_response(rsp);
       `uvm_info("SEQ", {"Got back", rsp.convert2string()}, UVM_MEDIUM);
     end
   end
 endtask: body    

endclass : test_sequence

class top_sequence extends uvm_sequence #(myreq, myrsp);
  `uvm_object_utils(test_sequence);
  
  initialize_sequence init;
  test_sequence test;  
  
  function new(string name = "");
    super.new(name);
    init = new("init");
    test = new("test");
  endfunction: new

 task body();
    `uvm_info("TOPS", "Starting INIT", UVM_MEDIUM);
    init.start(m_sequencer);
    `uvm_info("TOPS", "Starting TEST", UVM_MEDIUM);
    test.start(m_sequencer);
 endtask: body    

endclass : top_sequence

class myenv extends uvm_env;
 `uvm_component_utils(myenv)
 
 mydriver drv;
 uvm_sequencer #(myreq, myrsp) seqr;
 top_sequence   tseq; 
 
 function new (string name, uvm_component parent);
   super.new(name,parent);
 endfunction : new;

 function void build_phase(uvm_phase phase);
   drv  = mydriver::type_id::create("drv",this);
   seqr = new("seqr",this);
   tseq = new("tseq"); 
 endfunction 
 
 function void connect_phase(uvm_phase phase);
   drv.seq_item_port.connect(seqr.seq_item_export);
 endfunction : connect_phase
 
 task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    tseq.start(seqr);
    phase.drop_objection(this);
 endtask : run_phase
endclass : myenv

class test extends uvm_test;
 `uvm_component_utils(test)
 
 myenv env;
 
 function new(string name, uvm_component parent);
   super.new(name, parent);
 endfunction : new

 virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    env = myenv::type_id::create("env", this);
 endfunction : build_phase
endclass : test

module top;
   initial run_test("test"); 
endmodule: top
