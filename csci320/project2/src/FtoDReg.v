//F to D Register
//Carries values from D stage to E stage on a clock
//Stalls when lwstall ro branchstall
module FtoDReg(input wire clk, input wire [31:0] RD, input wire stallD,
	input wire PCSrcD, input wire [31:0] PCPlus4F, output reg [31:0] instrD,
	output reg [31:0] PCPlus4D);
always @(posedge clk )
begin
	if (!stallD) //not clear not stall, then go to
		begin
			instrD <= RD;
			PCPlus4D <= PCPlus4F;
		end
		#1 //HACK
	if (PCSrcD) //if jumping, clear
		begin
			instrD <= 0;
			PCPlus4D <= 0;
		end
	end
endmodule
