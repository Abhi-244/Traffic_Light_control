# Traffic Light Control Project

## Description
This project implements a **Traffic Light Control System** for managing vehicle and pedestrian traffic at an intersection. The system ensures smooth traffic flow and safety using timed light changes.  

The project can be implemented using **Verilog, Arduino, or any other simulation platform**.

---

## Features
- Red, Yellow, and Green lights for vehicles  
- Pedestrian crossing signals  
- Timer-based automatic light changes  
- Simulation report and waveform diagrams included  

---

## Code Files
- `traffic_light.v` → Verilog implementation of the traffic light controller  
- `traffic_light_testbench.v` → Testbench for simulating the traffic light system  
- `traffic_light.ino` → Arduino implementation (if using Arduino)  
- `simulation.pdf` → Simulation results and waveforms  
- `images/` → Diagram images of the traffic light system  

---

## How to Run
### Verilog Simulation
1. Open `traffic_light.v` in **ModelSim/Quartus/any Verilog simulator**.  
2. Run `traffic_light_testbench.v` to simulate the system.  
3. Observe the timing sequence of Red → Green → Yellow lights.  

### Arduino Implementation
1. Connect LEDs to the Arduino board according to the code.  
2. Upload `traffic_light.ino` to the Arduino.  
3. Observe the traffic light sequence in real-time.  

---

## Sample Code Snippet
Here’s a basic Verilog example of the traffic light controller:

```verilog
module traffic_light(
    input clk,
    input rst,
    output reg [2:0] lights  // 3 bits: Red, Yellow, Green
);

reg [25:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(*) begin
    case(counter[25:24])
        2'b00: lights = 3'b100; // Red
        2'b01: lights = 3'b010; // Yellow
        2'b10: lights = 3'b001; // Green
        default: lights = 3'b100;
    endcase
end

endmodule
