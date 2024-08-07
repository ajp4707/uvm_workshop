// Please create a class called ctr_req that extends ctr_output
class ctr_req extends ctr_output;

  // Please register ctr_req with the factory
  `uvm_object_utils(ctr_req)    

  // Please declare a randomizable variable of type ctr_op
  rand ctr_op             op;

  function new(string name = "", uvm_component initiator = null);
    super.new(name, initiator);
  endfunction : new

   // Please define the convert2string function.  
  function string convert2string();

   // Remember the {} concatenation operator for SystemVerilog strings
   // Use the super.convert2string() method and concatenate it with the string you create here.

    return {super.convert2string()," ",$psprintf("op: %s", op)};
  endfunction : convert2string

  function void do_copy(uvm_object rhs);

    // Please create a do_copy function that uses super.do_copy() to provide a deep copy.

    ctr_req  RHS;
    super.do_copy(rhs);
    $cast(RHS, rhs);
    data = RHS.data;
    op   = RHS.op;
  endfunction : do_copy

  function void load_data(logic[7:0] d, ctr_op o);

     // Please create a load_data function so that the testbench can manually load 
     // data into this transaction.   Remember that you can use super.load_data 
     // to set the d variable

    super.load_data(d);
    op   = o;
  endfunction : load_data

endclass : ctr_req
