//Access section of memory that holds instructions
//Used in the F stage
module instructionMemory(input wire [31:0] readAddress, output reg [31:0] memInstruction);
reg [31:0] mem [32'h100000:32'h200000];
initial begin
  //SELECT FILE PATH HERE
  $readmemh("../reqPrograms/fib.v", mem); //load in instructions from file
end
reg [31:0] wordAddress;
always @(readAddress)
begin
  wordAddress <= readAddress >> 2; // shift to word address

  //RUN THIS TO PRINT INSTRUCTIONS WITHOUT NOPS
  if (mem[wordAddress] != 32'b0) begin
    $display("START--Address: %x/%x, Instruction: %x", wordAddress, readAddress, mem[wordAddress]);
  end

  //RUN THIS TO PRINT INSTRUCTIONS WITH NOPS
  //$display("START--Address: %x/%x, Instruction: %x", wordAddress, readAddress, mem[wordAddress]);

  memInstruction <= mem[wordAddress];
end
endmodule
