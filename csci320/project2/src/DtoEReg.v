//D to E Register
//Carries values from D stage to E stage on a clock
//Flushes when lwstall or branchstall

module DtoEReg(input wire clk, input wire RegWriteD,
	input wire MemtoRegD, input wire MemWriteD,
	input wire [3:0] ALUControlD, input wire ALUSrcD,
	input wire RegDstD,
	input wire [31:0] RD1, input wire [31:0] RD2,
	input wire [4:0] RsD, input wire [4:0] RtD, input wire [4:0] RdD,
	input wire [31:0] SignImmD, input wire FlushE,
	input wire syscallD,
	output reg RegWriteE, output reg MemtoRegE,
	output reg MemWriteE, output reg [3:0] ALUControlE,
	output reg ALUSrcE, output reg RegDstE,
	output reg [31:0] RD1E, output reg [31:0] RD2E,
	output reg [4:0] RsE, output reg [4:0] RtE,
	output reg [4:0] RdE, output reg [31:0] SignImmE,
	output reg syscallE);

always @(posedge clk)
	begin
	if (FlushE)
		begin
			RegWriteE <= 0;
			MemtoRegE <= 0;
			MemWriteE <= 0;
			ALUControlE <= 3'b0;
			ALUSrcE <= 0;
			RegDstE <= 0;
			RD1E <= 0;
			RD2E <= 0;
			RsE <= 5'b0;
			RtE <= 5'b0;
			RdE <= 5'b0;
			SignImmE <= 0;
			syscallE <= 0;
		end
	else
		begin
			RegWriteE <= RegWriteD;
			MemtoRegE <= MemtoRegD;
			MemWriteE <= MemWriteD;
			ALUControlE <= ALUControlD;
			ALUSrcE <= ALUSrcD;
			RegDstE <= RegDstD;
			RD1E <= RD1;
			RD2E <= RD2;
			RsE <= RsD;
			RtE <= RtD;
			RdE <= RdD;
			SignImmE <= SignImmD;
			syscallE <= syscallD;
		end
end




endmodule
