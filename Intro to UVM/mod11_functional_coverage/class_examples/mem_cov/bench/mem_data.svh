class mem_data extends uvm_transaction;
  `uvm_object_utils(mem_data)    
  
  rand logic[15:0] data;
  rand logic[15:0] addr;
  
  function new(string name = "");
    super.new(name);
  endfunction : new

  function string convert2string();
    return $psprintf("addr: %4h data: %4h",addr,data);
  endfunction : convert2string

  function void do_copy(uvm_object rhs);
    mem_data RHS;
    super.do_copy(rhs);
    $cast(RHS,rhs);
    data = RHS.data;
    addr = RHS.addr;
  endfunction : do_copy

  function bit comp (uvm_object rhs);
    mem_data RHS;
    $cast (RHS,rhs);
    return ((RHS.addr == addr) && (RHS.data == data));
  endfunction : comp

  function void load_data (logic[15:0] a,d);
    addr = a;     data = d;
  endfunction : load_data
  
endclass : mem_data
