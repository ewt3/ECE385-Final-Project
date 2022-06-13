module TestBench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.

    logic [2:0] out;
    logic signed [10:0] in0;
    logic signed [10:0] in1;
    logic signed [10:0] in2;
    logic signed [10:0] in3;
    logic signed [10:0] in4;
    logic signed [10:0] in5;
    logic signed [10:0] in6;
    logic signed [10:0] in7;
    



		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
Max max0(
    .in({in0, in1, in2, in3, in4, in5, in6, in7}),
    .out(out)
);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
/*always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end */

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
//Reset = 0;		// Toggle Rest

    in0 = 0;
    in1 = 0;
    in2 = 0;
    in3 = 0;
    in4 = 0;
    in5 = 0;
    in6 = 0;
    in7 = 0;

    #10

    in0 = 3;
    in2 = -1;
    in6 = 5;





end
//


endmodule
