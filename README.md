# 32-bit ALU ASIC Implementation (SkyWater 130nm)

This project contains the RTL design, OpenLane physical design flow configuration, and signoff verification reports for a 32-Bit Arithmetic Logic Unit (ALU) implemented on the SkyWater 130nm (sky130A) PDK.

#  Layout (GDSII)
![ALU32 GDSII Layout] (alu32_layout_gdsfinal.png)

# Project Specifications & Design Flow
 **RTL Module:`alu32.v`
 **PDK: `sky130A` (SkyWater 130nm High Density)
 **Target Clock Period:15.0 ns (66.67 MHz)
 *Flow Toolchain:* OpenLane v1 / Yosys / OpenROAD / Magic / Netgen

 Signoff Verification Results
 **Design Rule Checking (DRC):** Clean (0 Magic / 0 TritonRoute violations)
  **Layout vs. Schematic (LVS):** Clean (Netgen match - `Circuits match uniquely`)
 **Static Timing Analysis (STA):** 
  **Worst Negative Slack (Setup):** 0.00 ns
    **Worst Slack (Hold):** +6.50 ns
