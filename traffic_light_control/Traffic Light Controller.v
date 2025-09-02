// Simple Traffic Light Controller
// Sequence: Red -> Green -> Yellow

module traffic_light(
    input clk,      // Clock input
    input rst,      // Reset input
    output reg red,
    output reg yellow,
    output reg green
);

reg [1:0] state; // 2-bit state: 0=Red, 1=Green, 2=Yellow

// State transition on clock
always @(posedge clk or posedge rst) begin
    if (rst)
        state <= 2'b00; // Start with Red
    else begin
        case(state)
            2'b00: state <= 2'b01; // Red -> Green
            2'b01: state <= 2'b10; // Green -> Yellow
            2'b10: state <= 2'b00; // Yellow -> Red
            default: state <= 2'b00;
        endcase
    end
end

// Output logic
always @(*) begin
    red = (state == 2'b00);
    green = (state == 2'b01);
    yellow = (state == 2'b10);
end

endmodule
