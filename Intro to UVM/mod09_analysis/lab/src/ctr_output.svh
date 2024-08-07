class ctr_output extends uvm_transaction;

  `uvm_object_utils(ctr_output)    
  
  rand logic [7:0] data;
  
  function new(string name = "", uvm_component initiator = null);
    super.new(name, initiator);
  endfunction : new

  function string convert2string();
    return $psprintf("data: %2h", data);
  endfunction : convert2string

  function void do_copy(uvm_object rhs);
    ctr_output  RHS;
    super.do_copy(rhs);
    $cast(RHS, rhs);
    data = RHS.data;
  endfunction : do_copy
  
  function bit comp(uvm_object rhs);
     // Please create a comp function that returns 1 if rhs is identical to this object.
     // Please remove the line below.
     `uvm_fatal("ctr_output.svh", "The comp() function has not been written");
  endfunction : comp
  
  function void load_data(logic[7:0] d);
    data = d;
  endfunction
endclass : ctr_output
