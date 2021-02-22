# Seven-Segment-Display

This is a verilog code written in Xilinx Vivavdo to design a time-multiplexed quad seven-segment display by implementing it on a 7-segment display of the Real Digital Blackboard. The Blackboard is an ARM and FPGA development board based on the ZYNQ device from Xilinx. The 16 switches on the board are used and depending on the combination of switches pressed, it will display 16 possible values: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, and F on the display segment of the board. The 16 switches are divided into sets of four each, each digit to bring in a 4-bit binary value to be displayed. The value for left-most switches quad display 3rd digit of the display segment, the value for left-center switches quad display 2nd digit, the value for right-center switches quad display 1st digit and the value for right-most switches quad display 0th digit of the display segment.
