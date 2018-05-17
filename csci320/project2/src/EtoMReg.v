//E to M Register
//Carries values from E stage to M stage on a clock

module EtoMReg(input wire clk, input wire RegWriteE, input wire MemtoRegE,
	input wire MemWriteE, input wire [31:0] ALUOutE, input wire [31:0] WriteDataE,
	input wire [4:0] WriteRegE, input wire syscallE, output reg RegWriteM, output reg MemtoRegM,
	output reg MemWriteM,	output reg [31:0] ALUOutM,	output reg [31:0] WriteDataM,
	output reg [4:0] WriteRegM, output reg syscallM);

always @(posedge clk)
	begin
		RegWriteM <= RegWriteE;
		MemtoRegM <= MemtoRegE;
		MemWriteM <= MemWriteE;
		ALUOutM <= ALUOutE;
		WriteDataM <= WriteDataE;
		WriteRegM <= WriteRegE;
		syscallM <= syscallE;
	end



endmodule
