# Systolic-array-fpga
## 2x2 to 4x4 Systolic Array Matrix Multiplier on FPGA

I am building this project in order to make the systolic array from scratch by myself and understand the smaller building blocks of the hardware/AI accelerator. 
It is divided into 3 phases:
**Phase 1**: Making the 2x2 systolic array and simulating it.
**Phase 2**: Upgrading it to 4x4, synthesizing it and implementing it on FPGA.
**Phase 3**: Having a PC interface and completing the demo and making a clean Github profile. 

Currently I am done with Phase 1. 
### Phase 1 Simulation Results
Test case: A = [[1,2],[3,4]], B = [[5,6],[7,8]]
Expected output: C = [[19,22],[43,50]]
Verified on EDA Playground using Icarus Verilog
