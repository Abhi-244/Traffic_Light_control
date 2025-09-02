`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg rst;
wire red, yellow, green;

// Instantiate the traffic light
traffic_light tl(
    .clk(clk),
    .rst(rst),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock generation: 10ns period
initial clk = 0;
always #5 clk = ~clk; // Toggle every 5ns

// VCD waveform generation
initial begin
    $dumpfile("traffic_light.vcd");    // VCD filename
    $dumpvars(0, traffic_light_tb);    // Dump all signals

    // Reset sequence
    rst = 1;
    #10 rst = 0;

    // Run simulation
    #100 $finish;   // Stop simulation after 100ns
end

// Monitor outputs in console
initial begin
    $monitor("Time=%0t | Red=%b Yellow=%b Green=%b", $time, red, yellow, green);
end

endmodule
