class mem_req extends mem_data;
  `uvm_object_utils(mem_req)    
  
  rand mem_op        op;
  
  function new(string name = "");
    super.new(name);
  endfunction : new

  function string convert2string();
     return {super.convert2string()," ",$psprintf("op: %s",op)};
  endfunction : convert2string

  function void do_copy(uvm_object rhs);
    mem_req RHS;
    super.do_copy(rhs);
    $cast(RHS,rhs);
    op   = RHS.op;
  endfunction : do_copy
  
  function void load_data(logic[15:0] d,logic[15:0] a, mem_op o);
      super.load_data(a,d);
      op   = o;
  endfunction : load_data

endclass : mem_req

