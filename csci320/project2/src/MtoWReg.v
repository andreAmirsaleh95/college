//M to W Register
//Carries values from M stage to W stage on a clock
module MtoWReg(input wire clk, input wire RegWriteM, input wire MemtoRegM,
	input wire [31:0] ReadDataM, input wire [31:0] ALUOutM,
	input wire [4:0] WriteRegM, input wire syscallM, output reg RegWriteW, output reg MemtoRegW,
	output reg [31:0] ReadDataW, output reg [31:0] ALUOutW,
	output reg [4:0] WriteRegW, output reg syscallW);

always @(posedge clk)
	begin
	RegWriteW <= RegWriteM;
	MemtoRegW <= MemtoRegM;
	ReadDataW <= ReadDataM;
	ALUOutW <= ALUOutM;
	WriteRegW <= WriteRegM;
	syscallW <= syscallM;
	end
endmodule
