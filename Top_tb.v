`timescale 1ns/1ps
module Top_tb;
reg clk, reset;
reg [7:0] a00,a01,a10,a11,b00,b10,b01,b11;
wire [17:0]c00,c01,c11,c10;

top inst(.a00(a00),.a01(a01),.a10(a10),.a11(a11),.b00(b00),.b01(b01),.b10(b10),.b11(b11),.c00(c00),.c01(c01),.c10(c10),.c11(c11),.clk(clk),.reset(reset));

always #5 clk=~clk;

initial begin
	clk = 1;
	reset = 1;#10
	reset = 0;
	a00=1;a01=2;a10 = 3;a11 = 4;b00 = 5;b01=6;b10 = 7;b11 = 8;
	#40
$display("c00 = %d",c00);
$display("c01 = %d",c01);
$display("c10 = %d",c10);
$display("c11 = %d",c11);
$finish;
end

endmodule
