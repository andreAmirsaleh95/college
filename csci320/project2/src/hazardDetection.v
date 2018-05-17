//Hazard Detection
//Handles full forwarding data hazards and stalling control hazards
module hazardDetection(
		input wire BranchD,
		input wire [4:0] RsD,
		input wire [4:0] RtD,
		input wire [4:0] RsE,
		input wire [4:0] RtE,
 		input wire [4:0] WriteRegE,
 		input wire [4:0] WriteRegM,
		input wire [4:0] WriteRegW,
		input wire MemtoRegE,
		input wire RegWriteE,
		input wire MemtoRegM,
		input wire RegWriteM,
		input wire RegWriteW,
		output reg StallF,
		output reg StallD,
		output reg ForwardAD,
		output reg ForwardBD,
		output reg FlushE,
		output reg [1:0] ForwardAE,
		output reg [1:0] ForwardBE,
		output reg ForwardM);

reg lwstall;
reg branchstall;
initial
	begin
	StallF <= 0;
	StallD <= 0;
	ForwardAD <= 0;
	ForwardBD <= 0;
	FlushE <= 0;
	ForwardAE<= 2'b0;
	ForwardBE<= 2'b0;
	ForwardM <= 0;
	end

always @(*)
begin //reset every time TODO:(may want clock to reset, havent run into bad scenario tho)
	StallF <= 0;
	StallD <= 0;
	ForwardAD <= 0;
	ForwardBD <= 0;
	FlushE <= 0;
	ForwardAE<= 2'b0;
	ForwardBE<= 2'b0;
	// ForwardM <= 0;

	//FORWARDING
	if ((RsE != 4'b0) && (RsE == WriteRegM) && RegWriteM) begin //MEM TO EX
		ForwardAE <= 2'b10;
		//$display("Forwarding AE 10");
	end
	else if ((RsE != 4'b0) && (RsE == WriteRegW) && RegWriteW) begin //EX TO EX
		ForwardAE <= 2'b01;
		//$display("Forwarding AE 01");
	end
	else begin
		ForwardAE <= 2'b00;
	end
	if ((RtE != 4'b0) && (RtE == WriteRegM) && RegWriteM) begin //MEM TO EX
		ForwardBE <= 2'b10;
		//$display("Forwarding BE 10");
	end
	else if ((RtE != 4'b0) && (RtE == WriteRegW) && RegWriteW) begin //EX TO EX
		ForwardBE <= 2'b01;
		//$display("Forwarding BE 01");
	end
	else begin
		ForwardBE <= 2'b00; //No forwarding
	end
	//Forwarding for branching (control hazards)
	ForwardAD <= (RsD != 0) && (RsD == WriteRegM) && RegWriteM;
	ForwardBD <= (RtD != 0) && (RtD == WriteRegM) && RegWriteM;

	//TODO: LEVI
	// ForwardM <= (WriteRegM == WriteRegW) && RegWriteW && (WriteRegW != 4'b0);
	// if (ForwardM)
	// begin
	// 	$display("forward m works write regm is %d, write reg w is %d", WriteRegM, WriteRegW);
	// end

		//load word stall
		lwstall <= (((RsD == RtE) || (RtD == RtE)) && MemtoRegE);

		//branch stall
    branchstall <= ((BranchD && RegWriteE) && ((WriteRegE == RsD) || (WriteRegE == RtD))) || ((BranchD && MemtoRegM) && ((WriteRegM == RsD) || (WriteRegM == RtD)));

		//handle registers in case of stall
    StallD <= lwstall || branchstall;
    StallF <= lwstall || branchstall;
    FlushE <= lwstall || branchstall;




end


endmodule
