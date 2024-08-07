class multi extends uvm_test;

   `uvm_component_utils(multi)  
   
   animal_pen ap;
   uvm_object tmp;
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

   task run();
      super.run();
      assert(get_config_object("pen",tmp,0));
      assert($cast(ap,tmp));
      `uvm_info ("multi",$psprintf("%0d %0s make a %0s",
                                         ap.numb, ap.name, ap.group_name),UVM_MEDIUM);
      global_stop_request;
   endtask

endclass : multi

