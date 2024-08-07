class tester_env extends uvm_env;

   `uvm_component_utils(tester_env)    

   driver drv;
   scoreboard sb;
   printer prt;
    
   function new(string name = "tester_env", uvm_component parent = null );
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      drv = driver::type_id::create("drv",this);
      sb  = scoreboard::type_id::create("sb",this);
      prt = printer::type_id::create("prt",this);
   endfunction : build_phase
endclass : tester_env

