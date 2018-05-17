//Program Counter
// Kinda like a W to F register
module pc(input wire clk, input wire [31:0] nextPCAddress, input wire stallF,
  output reg [31:0] currentPCAddress);
initial begin
  currentPCAddress = 32'h0400020; //skips header bytes
end
always @(posedge clk) begin
if (!stallF)
    currentPCAddress <= nextPCAddress;
end
endmodule
