class comparator extends uvm_agent;

  `uvm_component_utils(comparator)

  uvm_tlm_analysis_fifo #(mem_data) actual_f;
  uvm_get_port #(mem_data)      predicted_p;
  mem_data     actual_rsp, predicted_rsp;

  function new (string name, 
                uvm_component parent);
    super.new(name,parent);
  endfunction: new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    actual_f    = new("actual_f",this);
    predicted_p    = new("predicted_p",this);   
  endfunction: build_phase
 
  task run_phase(uvm_phase phase);
    forever begin : run_loop
      actual_f.get(actual_rsp);
      predicted_p.get(predicted_rsp);
      if(actual_rsp.comp(predicted_rsp)) 
        uvm_report_info("run", 
                        $psprintf("passed: %s",
                                   actual_rsp.convert2string()));
      else
        uvm_report_error("run",
                         $psprintf("ERROR expected: %s actual:%s",
                                   predicted_rsp.convert2string(),
                                   actual_rsp.convert2string()));
    end : run_loop
  endtask: run_phase
endclass: comparator
