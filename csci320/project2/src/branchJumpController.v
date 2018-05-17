//All branches and jumps are handled in this module
//There used to be several muxes and control signals that handled this, but it was sloppy
//Handled in the D stage
module branchJumpController(input wire [3:0] branchJumpType, input wire [31:0] RD1,
  input wire [31:0] RD2, input wire [31:0] argOne, input wire [31:0] argTwo,
  input wire [31:0] PCPlus4F, input wire [31:0] PCPlus4D,
  input wire [31:0] jumpAddr, input wire [31:0] signImmD,
  input wire branchD, output reg PCSrcD, output reg [31:0] addrResult);
  always @(PCPlus4F or argOne or argTwo) begin
    case (branchJumpType)
      4'b0000: begin //JUMP
          addrResult <= jumpAddr;
          PCSrcD <= 1;
        end
      4'b0001: begin //JR
          addrResult <= argOne;
          PCSrcD <= 1;
        end
      4'b0010: begin //JAL
          addrResult <= jumpAddr;
          PCSrcD <= 1;
        end
      4'b0011: begin //BEQ
           if (argOne == argTwo) begin
            addrResult <= (signImmD << 2) + PCPlus4D;
            PCSrcD <= 0; //HACK
            //$display("BEQ");
           end
           else begin
            addrResult <= PCPlus4F;
            PCSrcD <= 0;
            //$display("failed BEQ");
           end
        end
      4'b0100: begin //BNE
           if (argOne != argTwo) begin
            addrResult <= (signImmD << 2) + PCPlus4D;
            PCSrcD <= 1;
            //$display("BNE");
           end
           else begin
            addrResult <= PCPlus4F;
            PCSrcD <= 0;
            //$display("failed BNE");
           end
        end
      default: begin //If no jump or branch
          addrResult <= PCPlus4F;
          //$display("Reg");
          PCSrcD <= 0;
      end
    endcase
  end
endmodule
