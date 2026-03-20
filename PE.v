`timescale 1ns/1ps
module PE
#(parameter N=2, parameter W = 8,parameter accum_w = 18) //2*W + log2(N))(
(input clk,
input reset,
input [W-1:0] ain,
input[W-1:0] bin,
output  [W-1:0]aout,
output  [W-1:0]bout,
output reg [accum_w-1:0] cout
);
reg [accum_w-1:0]accum = 0;
reg [$clog2(N):0]counter = 0;
assign aout = ain;
assign bout = bin;
always @(posedge clk) begin
	if(reset) begin
	counter<=0;
	accum<=0;
	end
	else begin

		if(counter<N) begin
			accum <= accum+ ain*bin;
			counter <= counter+1;
		end
		else begin
			cout<=accum;
		end
	end
end
endmodule
