//Please complete the class declaration for the test_seq sequence

class test_seq extends uvm_sequence #( ctr_req, ctr_output );

  `uvm_object_utils(test_seq)

  ctr_req req;
  ctr_output rsp;    
  
  function new(string name = "");
    super.new(name);
  endfunction: new

  task body();
      req = new();

      start_item(req);
      req.op = reset;
      `uvm_info("test_seq",{"Sending transaction ",req.convert2string()}, UVM_MEDIUM);
      finish_item(req);
      get_response(rsp);
      `uvm_info("test_seq",{"Got back: ",rsp.convert2string()},UVM_MEDIUM);

     repeat (20) begin
        // Please create a new request by calling new()        

        // Please add the start_item and finish_item  calls around this randomization        

        assert(req.randomize() with {op dist {reset:=10,[inc:nop]:/90};});
        `uvm_info("test_seq", {"Sending transaction ",req.convert2string()}, UVM_MEDIUM);

        //Please get the response        

        `uvm_info("test_seq",{"Got back: ",rsp.convert2string()},UVM_MEDIUM);
     end
     
      start_item(req);
      req.op = load;
      req.data = 8'hFF;
      `uvm_info("test_seq",{"Sending transaction ",req.convert2string()}, UVM_MEDIUM);
      finish_item(req);
      get_response(rsp);
      `uvm_info("test_seq",{"Got back: ",rsp.convert2string()},UVM_MEDIUM);
      start_item(req);
      req.op = inc;
      `uvm_info("test_seq",{"Sending transaction ",req.convert2string()}, UVM_MEDIUM);
      finish_item(req);       
      get_response(rsp);
      `uvm_info("test_seq",{"Got back: ",rsp.convert2string()},UVM_MEDIUM);
  endtask: body

endclass: test_seq
