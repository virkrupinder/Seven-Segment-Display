// File: testbench.v
// This is a top level testbench for the quad_seven_seg design, which is part of
// the EE178 Lab #2 assignment.
// The `timescale directive specifies what the simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
module testbench;
// Declare wires to be driven by the outputs
// of the design, and regs to drive the inputs.
// The testbench will be in control of inputs
// to the design, and will check the outputs.
// Then, instantiate the design to be tested.
wire an3, an2, an1, an0;
wire ca, cb, cc, cd, ce, cf, cg, dp;
reg [3:0] val3, val2, val1, val0;
reg clk;
// Instantiate the quad_seven_seg module.
quad_seven_seg my_quad (
.clk(clk),
.val3(val3),
.val2(val2),
.val1(val1),
.val0(val0),
.an3(an3),
.an2(an2),
.an1(an1),
.an0(an0),
.ca(ca),
.cb(cb),
.cc(cc),
.cd(cd),
.ce(ce),
.cf(cf),
.cg(cg),
.dp(dp)
);
// Describe a simulation process that generates
// a clock signal. The clock is 100 MHz.
always
begin
clk = 1'b0;
#5;
clk = 1'b1;
#5;
end

initial
begin
$display("If simulation ends before the testbench");
$display("completes, use the menu option to run all.");
// This should get "0 1 2 3 " on the display.
val3 <= 4'h0;
val2 <= 4'h1;
val1 <= 4'h2;
val0 <= 4'h3;
$display("Prepare to wait a long time...");
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
#5000000;
$display("Checkpoint, simulation time is %t",$time);
// End the simulation.
$display("Simulation is over, check the waveforms.");
$stop;
end
endmodule