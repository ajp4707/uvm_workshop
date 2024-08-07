class square_it extends uvm_agent;

  `uvm_component_utils(square_it)    
  
   // Please declare an "uvm_get_port #(int)" that will get data from the producer.
   uvm_get_port #(int) input_port; 
   // Please declare an "uvm_put_port #(int)" that will put data into the consumer.
   uvm_put_port #(int) output_port; 


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  task run_phase(uvm_phase phase);
    int i;
    super.run();
    forever begin
       // Please get an integer out of the uvm_get_port
      input_port.get(i);
       // Please put the square of the integer in the uvm_put_port
       // The square operator in verilog is ** as in "3**2 is 9"
      output_port.put(i**2);
    end
  endtask: run_phase


  // build
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);

     // Please create a new uvm_get_port using the variable you declared above
     input_port = new("input_port", this);

     // Please create a new uvm_put_port using the variable you declared above     
     output_port        = new("output_port", this); 
  endfunction : build_phase


endclass : square_it
