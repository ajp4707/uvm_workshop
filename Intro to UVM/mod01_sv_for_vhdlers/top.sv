module top;
    logic [7:0] data_in;
    bit         clk, inc, ld, rst_n;
	wire [7:0]  q;
	
	logic [7:0] predicted_q;
	
	
	counter DUT(.data_in(data_in),.q(q),.clk(clk),.inc(inc),.ld(ld),.rst(rst_n));
	
	initial begin
		clk = 0;
		data_in = 0;
		inc = 0;
		ld = 0;
		rst_n = 0;
		predicted_q = 0;
		
		@(posedge clk);
		@(negedge clk);
		rst_n = 1;
	end	
	
	always begin
		#10ns
		clk = ~clk;
	end
	
	initial begin
		// Increment input, assert output

		@ (posedge clk);
		@ (negedge clk);
		repeat(200) begin
			inc = 1;
			predicted_q ++;
			@(posedge clk);
			#1ns
			assert(q == predicted_q);
		end
		inc = 0;
		
		@ (posedge clk);
		@ (negedge clk);
		// verify reset works
		rst_n = 0;
		#1ns assert(q == predicted_q); // verify that rst is synch, not asynch
		@ (posedge clk);
		#1ns assert (q == 0);
		@ (posedge clk);
		rst_n = 1;
		
		// verify load
		@ (posedge clk);
		data_in = 'hF0;
		ld = 1;
		repeat(2) begin
			@ (posedge clk);
			#1ns assert(q == data_in);
		end
		
		// ld has precedence over inc
		inc = 1;
		repeat(2) begin
			@ (posedge clk);
			#1ns assert(q == data_in);
		end
		inc = 0;
		
		// check that inc wraps to 0
		@(posedge clk);
		data_in = 'hFF;
		ld = 1;
		@(posedge clk);
		#1ns assert(q == data_in);
		inc = 1;
		@(posedge clk);
		#1ns assert(q == 0);

		$display("Time: %t - Simulation Complete", $time);
		$stop;
	end
	
	
	// verfiy load works
   
endmodule // top

   