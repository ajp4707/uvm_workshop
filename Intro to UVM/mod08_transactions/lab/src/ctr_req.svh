// Please create a class called ctr_req that extends ctr_output

  // Please register ctr_req with the factory
  
  // Please declare a randomizable variable of type ctr_op

  function new(string name = "", uvm_component initiator = null);
    super.new(name, initiator);
  endfunction : new
  
   // Please define the convert2string function.  

   // Remember the {} concatenation operator for SystemVerilog strings
   // for extra credit use the super.convert2string() method and 
   // cocatenate it with the string you create here.
  endfunction : convert2string

  virtual function void do_copy(uvm_object rhs);

    // Please create a do_copy function that uses super.do_copy() to provide a deep copy.

  endfunction : do_copy

  function void load_data(logic[7:0] d, ctr_op o);
     // Please create a load_data function so that the testbench can manually load 
     // data into this transaction.   Remember that you can use super.load_data 
     // to set the d variable
  endfunction : load_data

endclass : ctr_req
