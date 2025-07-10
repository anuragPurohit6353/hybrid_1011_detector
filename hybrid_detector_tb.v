`timescale 1ns / 1ps


module tb_hybrid_1011_detector;
reg clk, reset, din;
wire dout_moore, dout_mealy;

// Instantiate the DUT
hybrid_1011_detector uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout_moore(dout_moore),
    .dout_mealy(dout_mealy)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("hybrid_1011.vcd");
    $dumpvars(0, tb_hybrid_1011_detector);

    clk = 0;
    reset = 1;
    din = 0;
    #10;

    reset = 0;

    // Apply test pattern: 1011011 (should detect two overlapping sequences)
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // 1011 → 1st match
    din = 0; #10;
    din = 1; #10;
    din = 1; #10; // 1011 → 2nd match
    din = 0; #10;

    #20;
    $finish;
end
endmodule
