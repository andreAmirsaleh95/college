//Data memory, based around stack pointer currently. Not with instruction memory.
//Used in the M stage
module dataMemory (input wire clk, input wire [31:0] ALUResultDataAddress, input [31:0] registerWriteData,
  input wire dataMemWrite, input wire printStr, input wire[31:0] strAddr, output reg [31:0] memReadData);

  reg [31:0] dataMem [32'h1d110000:32'h1d11ffff]; //memory downward from stack pointer
  reg [7:0] globalByteMem [32'h00800000:32'h00A00000];

  initial begin
    //persistant storage??
    //../test/programs/hello.vhex.data
    //7444444c;
    $readmemh("../test/programs/hello.vhex.data", globalByteMem); //load in static data from file

  end

  always @(posedge clk) begin
      if (dataMemWrite) begin //WRITE
      //shift to word address
      //HACK: MADE COMBINATIONAL FOR SOME REASON IT WORKS
        dataMem[ALUResultDataAddress >> 2] = registerWriteData;
        //$display("(MEMWRITE) address: %x value: %x, result %x", ALUResultDataAddress >> 2, registerWriteData, dataMem[ALUResultDataAddress >> 2]);
      end
    end
  always @(negedge clk) begin //READ
  //HACK: MADE COMBINATIONAL FOR SOME REASON IT WORKS
      memReadData = dataMem[ALUResultDataAddress >> 2];
      //$display("(MEMREAD) address: %x value: %x", ALUResultDataAddress >> 2, memReadData);
  end

  reg[31:0] strAddrTemp;

  always @(printStr) begin
  	if (printStr) begin
  		strAddrTemp = strAddr;

  		while (globalByteMem[strAddrTemp] != 0) begin
  			$write("%c", globalByteMem[strAddrTemp]);
  			strAddrTemp = strAddrTemp + 1;
  		end
  	end
  end
endmodule

module globalMemory (input wire printStr, input wire[31:0] strAddr);

  reg [7:0] globalByteMem [32'h00800000:32'h00A00000];

  initial begin
    $readmemh("../test/programs/hello.vhex.data", globalByteMem); //load in static data from file

  end

  reg[31:0] strAddrTemp;

  always @(printStr) begin
  	if (printStr) begin
  		strAddrTemp = strAddr;

  		while (globalByteMem[strAddrTemp] != 0) begin
  			$write("%c", globalByteMem[strAddrTemp]);
  			strAddrTemp = strAddrTemp + 1;
  		end
  	end
  end
endmodule
