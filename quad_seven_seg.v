// Company: San Jose State University
// Engineer: Rupinderjit Virk

// File: quad_seven_seg.v
// This is the top level design for EE178 Lab #2.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module quad_seven_seg (
input wire clk,
input wire [3:0] val3,
input wire [3:0] val2,
input wire [3:0] val1,
input wire [3:0] val0,
output wire an3,
output wire an2,
output wire an1,
output wire an0,
output wire ca,
output wire cb,
output wire cc,
output wire cd,
output wire ce,
output wire cf,
output wire cg,
output wire dp
);
// We aren't using dp, just de-activate this signal.
assign dp = 1'b1; // remember, it's active low
// Describe the actual circuit for the assignment.

// Assign counter and variable sizes
    reg [15:0] counter = 0;
    reg [1:0] segment = 0;
    reg [3:0] val;
    reg [6:0] Result;
    
    assign {ca, cb, cc, cd, ce, cf, cg} = Result;
    
    always @ (*)
    begin 
    case(val)
    4'h0: Result = 7'b0000001;    // "0"
    4'h1: Result = 7'b1001111;    // "1"
    4'h2: Result = 7'b0010010;    // "2"
    4'h3: Result = 7'b0000110;    // "3"
    4'h4: Result = 7'b1001100;    // "4"
    4'h5: Result = 7'b0100100;    // "5"
    4'h6: Result = 7'b0100000;    // "6"
    4'h7: Result = 7'b0001111;    // "7"
    4'h8: Result = 7'b0000000;    // "8"
    4'h9: Result = 7'b0000100;    // "9"
    4'hA: Result = 7'b0001000;    // "A"
    4'hB: Result = 7'b1100000;    // "b"
    4'hC: Result = 7'b0110001;    // "C"
    4'hD: Result = 7'b1000010;    // "d"
    4'hE: Result = 7'b0110000;    // "E"
    4'hF: Result = 7'b0111000;    // "F"
    default: Result = 7'b0000001; // "0"
    endcase
    end
    
    always @(posedge clk)
    begin
    if (counter == 20000) counter <= 0;
    else counter <= counter + 1;
    end
    
    always @(posedge clk)
    begin 
    if (counter == 20000) segment <= segment + 1;
    end
    
    always @ (*)
    begin
    case(segment)
    0: val = val0;
    1: val = val1;
    2: val = val2;
    3: val = val3;
    endcase
    end
    
    assign an0 = !(segment == 0);
    assign an1 = !(segment == 1);
    assign an2 = !(segment == 2);
    assign an3 = !(segment == 3);
    
endmodule