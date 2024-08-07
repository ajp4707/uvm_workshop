package mypackage;
   typedef enum {read, write} op_t;
   typedef logic [7:0] data_t;
   typedef logic [15:0] addr_t;
   
class mem_op;
   rand op_t op;
   rand data_t data;
   rand addr_t addr;
   
   function string convert2string();
      string            s;
      $sformat(s,"data: %2h  addr: %4h   op: %0s", data, addr, op);
      return s;
   endfunction // convert2string
endclass // mem_op

   mem_op common_op = new();
   
endpackage // mypackage


   
   