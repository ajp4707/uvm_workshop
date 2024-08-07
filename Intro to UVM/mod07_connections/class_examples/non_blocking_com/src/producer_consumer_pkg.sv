`include "uvm_macros.svh"

package producer_consumer_pkg;
  import uvm_pkg::*;
  int shared;
  int nloops=3;
`include "producer.svh" 
`include "consumer.svh" 
`include "producer_consumer_env.svh" 
`include "producer_consumer_test.svh" 
endpackage: producer_consumer_pkg
