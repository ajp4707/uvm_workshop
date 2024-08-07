class quiet_test extends uvm_test;
   `uvm_component_utils(quiet_test)    

     tester_env t_env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      printer#(mem_data)::type_id::set_type_override(bit_bucket#(mem_data)::get_type());
      printer#(mem_req)::type_id::set_type_override(bit_bucket#(mem_req)::get_type());
      t_env = tester_env::type_id::create("t_env", this);
   endfunction : build_phase
endclass : quiet_test


