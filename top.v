`timescale 1ns/1ps
module top
#(parameter N=2, parameter W = 8,parameter accum_w = 18) //2*W + log2(N))
(input clk,
input reset,
input [W-1:0] a00,a01,a10,a11,
input[W-1:0] b00,b01,b10,b11,
output reg [accum_w-1:0] c00,c01,c10,c11
);
reg [3:0]counter;
wire [W-1:0] b01_delayed,a10_delayed;
wire [W-1:0] ain00,bin00;

//skewing the elements. delaying b01 and a10 by 1 cycle so correct elements meet at PE
assign ain00 = (counter == 0) ? a00 : (counter == 1) ? a01 : 0;
assign bin00 = (counter == 0) ? b00 : (counter == 1) ? b10 : 0;
assign b01_delayed = (counter == 0) ? b01 : (counter == 1) ? b11 : 0;
assign a10_delayed = (counter == 0) ? a10 : (counter == 1) ? a11 : 0;
always @(posedge clk) begin
    if(reset) begin
 	counter<=0;
    end
    else begin
     counter<=counter+1;
    end
end
wire [W-1:0]a00_to_01, b00_to_10, a10_to_11, b01_to_11;
PE PE00 (.ain(ain00),.bin(bin00),.clk(clk),.reset(reset),.cout(c00),.aout(a00_to_01),.bout(b00_to_10));
PE PE01 (.ain(a00_to_01),.bin(b01_delayed),.clk(clk),.reset(reset),.cout(c01),.bout(b01_to_11));
PE PE10 (.ain(a10_delayed),.bin(b00_to_10),.clk(clk),.reset(reset),.cout(c10),.aout(a10_to_11));
PE PE11 (.ain(a10_to_11),.bin(b01_to_11),.clk(clk),.reset(reset),.cout(c11));
endmodule

