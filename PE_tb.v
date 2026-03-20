`timescale 1ns/1ps
module PE_tb;
reg [7:0] ain, bin;
reg clk, reset;
wire [7:0]aout, bout;
wire [17:0]  cout;

PE inst(.ain(ain),.bin(bin),.cout(cout),.aout(aout),.bout(bout),.clk(clk),.reset(reset));

always #5 clk = ~clk;

initial begin
	clk = 0;
	reset = 1;#10
	reset=0;
	ain = 3; bin =4 ;#10
	ain = 2; bin = 5;
	#20
$display("cout=%d",cout);
$finish;
end
endmodule
