module tb_counter;
	logic 	clk, rst_n, en;
	logic [7:0] count;
	
	counter dut (.*); //auto connect
	
	initial clk = 0;
	always #5 clk = ~clk; // Clock 10ns (100MHz)
	
	initial begin 
		$dumpfile("counter.vcd");
		$dumpvars(0, tb_counter);
		
		rst_n = 0; en =0; // Reset
		#20;
		rst_n = 1; en = 1; // Start counting
		#200;
		en = 0; //Stop counting
		#50;
		en = 1; // Start counting
		#100;
		$display("Final count = %0d", count);
		$finish;
	end
	
endmodule
