//----------------------------------------------------------------------
//                   Mentor Graphics Inc
//----------------------------------------------------------------------
// Project         : counter_hw
// Unit            : bit_sink
// File            : bit_sink.svh
//----------------------------------------------------------------------
// Created by      : rsalemi.neae
// Creation Date   : 2009/11/06
//----------------------------------------------------------------------
// Title: 
//
// Summary:
//
// Description:
//
//----------------------------------------------------------------------

`ifndef __BIT_SINK
`define __BIT_SINK

`include "uvm_macros.svh"

class bit_sink extends printer;

  `uvm_component_utils(bit_sink)    
  
  // constructor
  function new(string name = "", uvm_component parent );

    super.new(name, parent);
    // Insert Constructor Code Here

  endfunction : new

  task run_phase(uvm_phase phase);
     ctr_output out_txn;
     forever  out_p.get(out_txn);
  endtask : run_phase

endclass : bit_sink

`endif