//Adds 4 to PC. Modulated to follow flowchart.
//Really shouldn't be its own module
module adder(input wire [31:0] currentAdderAddress, output reg [31:0] nextAdderAddress);
always @(currentAdderAddress) begin
  nextAdderAddress <= currentAdderAddress + 4;
end
endmodule



//32 bit mux
//Decided not to parameterize muxs
module mux (input wire muxSel, input wire [31:0] muxArgZero,
  input wire [31:0] muxArgOne, output reg [31:0] muxOut);
always @(muxSel, muxArgZero, muxArgOne) begin
  muxOut <= muxSel ? muxArgOne : muxArgZero;
  end
endmodule

//5 bit mux
//mux for 5 bit numbers (regDst)
module fiveMux (input wire muxFiveSel, input wire [4:0] muxFiveArgZero,
  input wire [4:0] muxFiveArgOne, output reg [4:0] muxFiveOut);
always @(muxFiveSel, muxFiveArgZero, muxFiveArgOne) begin
  muxFiveOut <= muxFiveSel ? muxFiveArgOne : muxFiveArgZero;
  end
endmodule

//triple mux
//Takes in three 32 bit options, with 2 bit selector. Used in forwarding to Ex
module tripleMux(input wire [1:0] muxSel, input wire [31:0] muxArgZZ,
                input wire [31:0] muxArgZO, input wire [31:0] muxArgOZ,
                output reg [31:0] muxOut );
always @(*)
begin
  if (muxSel == 2'b00)
  begin
    muxOut <= muxArgZZ;
  end
  else if (muxSel == 2'b01)
  begin
    muxOut <= muxArgZO;
  end
  else if (muxSel == 2'b10)
  begin
    muxOut <= muxArgOZ;
  end
  else
  begin
     //nothing
  end

end
endmodule


//shifts jump addresses and adds significant bits from the pc after adding
module jumpShifter (input wire [25:0] jumpInstruction, input [3:0] jumpAdderResult,
  output reg [31:0] jumpInstructionShifted);
  always @(jumpInstruction) begin
    jumpInstructionShifted <= jumpInstruction << 2;
    jumpInstructionShifted[31:28] <= jumpAdderResult;
  end
endmodule


//extends sign for branching and I types
module signExtend (input wire [15:0] inSignExtend, output reg [31:0] outSignExtend);
//logic for whether to expand with 1's or 0's
always @(inSignExtend) begin
  if (inSignExtend[15] == 1'b1)
    outSignExtend <= { {16{1'b1}}, inSignExtend };
  else
    outSignExtend <= { {16{1'b0}}, inSignExtend };
  //$display("Signextend; in: %x, out: %x", inSignExtend, outSignExtend);
end

endmodule




//Single dlatch
//Never used, thoughts of using this is a basemark for registers.
//TODO: paramaterize for various inputs
module latch (input wire data, input wire en, input wire reset, output reg q);

 always @ ( en or reset or data)
 if (~reset) begin
   q <= 1'b0;
 end else if (en) begin
   q <= data;
 end

 endmodule
