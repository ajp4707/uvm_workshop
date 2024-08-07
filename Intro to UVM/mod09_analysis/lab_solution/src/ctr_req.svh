class ctr_req extends ctr_output;

  `uvm_object_utils(ctr_req)    

  rand ctr_op             op;

  function new(string name = "", uvm_component initiator = null);
    super.new(name, initiator);
  endfunction : new

  function string convert2string();
    string s;
    if (op == load) s = super.convert2string();
    s = {s," ", $psprintf("op: %s", op)};
    return s;
  endfunction : convert2string

  function void do_copy(uvm_object rhs);
    ctr_req  RHS;
    super.do_copy(rhs);
    $cast(RHS, rhs);
    data = RHS.data;
    op   = RHS.op;
  endfunction : do_copy

  function void load_data(logic[7:0] d, ctr_op o);
    super.load_data(d);
    op   = o;
  endfunction : load_data

endclass : ctr_req
