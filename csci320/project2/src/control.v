
//Control switches, determined through opcodes and function code
//Case statements to decide which instruction is happening. Then
//  the appropriate control signals are given for that instruction.
//Used in the D stage
module opCodeControl(input wire [5:0] controlOpCode, input wire [5:0] controlFuncCode,
  output reg regDstControlInstruction, output reg jumpControlInstruction,
  output reg branchControlInstruction, output reg memReadControlInstruction,
  output reg memToRegControlInstruction, output reg [3:0] ALUOpControlInstruction,
  output reg memWriteControlInstruction, output reg ALUSrcControlInstruction,
  output reg regWriteControlInstruction, output reg syscallControlInstruction,
  output reg linkControlInstruction, output reg bneControlInstruction,
  output reg jrController, output reg [3:0] branchJumpType);

initial begin
//if adding new control, set in inital and in always block
  regDstControlInstruction = 0;
  jumpControlInstruction = 0;
  branchControlInstruction = 0;
  memReadControlInstruction = 0;
  memToRegControlInstruction = 0;
  ALUOpControlInstruction = 0;
  memWriteControlInstruction = 0;
  ALUSrcControlInstruction = 0;
  regWriteControlInstruction = 0;
  syscallControlInstruction = 0;
  linkControlInstruction = 0;
  bneControlInstruction = 0;
  jrController = 0;
  branchJumpType = 4'hF;
end

always @(*) begin
//Not necesssary for most cases because of x's, but reset to zero for saftey
  regDstControlInstruction <= 0;
  jumpControlInstruction <= 0;
  branchControlInstruction <= 0;
  memReadControlInstruction <= 0;
  memToRegControlInstruction <= 0;
  ALUOpControlInstruction <= 0;
  memWriteControlInstruction <= 0;
  ALUSrcControlInstruction <= 0;
  regWriteControlInstruction <= 0;
  syscallControlInstruction <= 0; //extra syscall controller
  linkControlInstruction <= 0; //extra JAL controller
  bneControlInstruction <= 0; //extra bne controller OBSOLETE
  jrController <= 0; //extra jr controller OBSOLETE
  branchJumpType <= 4'hF; //

  case (controlOpCode)
    6'h0 : begin //R TYPE INSTRUCTION

      case (controlFuncCode)
        6'h20 : begin //ADD
          ALUOpControlInstruction <= 3'b010;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h21: begin //ADDU or move
          ALUOpControlInstruction <= 3'b010;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h22 : begin //SUB
          ALUOpControlInstruction <= 3'b110;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h24 : begin //AND
          ALUOpControlInstruction <= 3'b000;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h00 : begin //SLL
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
          ALUOpControlInstruction <= 4'b1001;
        end
        6'h27 : begin //NOR
          ALUOpControlInstruction <= 4'b1010;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h25 : begin //OR
          ALUOpControlInstruction <= 3'b001;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'h2a : begin //SLT
          ALUOpControlInstruction <= 3'b111;
          regDstControlInstruction <= 1;
          regWriteControlInstruction <= 1;
        end
        6'hc :begin  //SYSCALL
          syscallControlInstruction <= 1;
          end
        6'h8 :begin  //JR
          branchJumpType <= 4'b1;
          jrController <= 1;
          end
        default : begin
          end
        endcase
      end
    //I AND J TYPE
    6'h2 : begin //J
      branchJumpType <= 4'b0;
      jumpControlInstruction <= 1;
      end
    6'h3 : begin //JAL

      branchJumpType <= 4'b10;
      jumpControlInstruction <= 1;
      linkControlInstruction <= 1;
      end
    6'h4 : begin //BEQ OR BEQZ
      branchJumpType <= 4'b11;
      branchControlInstruction <= 1;
      regDstControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b110;
      end


    6'h5 : begin //BNE OR BNEZ
      branchJumpType <= 4'b100;
      branchControlInstruction <= 1;
      regDstControlInstruction <= 1;
      bneControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b110;
      end


    6'h8 : begin //ADDI or LI
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b010;
      end

    6'hc : begin //ANDI

      ALUOpControlInstruction <= 3'b000;
      ALUSrcControlInstruction <= 1;
      regWriteControlInstruction <= 1;
    end

    6'hf : begin //LUI
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      ALUOpControlInstruction <= 4'b1000;
    end

    6'h23 : begin //LW
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      memReadControlInstruction <= 1;
      memToRegControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b010;
      end
    6'hd : begin //ORI
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b001;
      end
    6'ha : begin //SLTI
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b111;

    end
    6'h2b : begin //SW
      ALUSrcControlInstruction <= 1;
      memWriteControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b010;
      end

    6'h9 : begin //ADDIU
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b010;
      end

    6'h24 : begin // LBU
      regWriteControlInstruction <= 1;
      ALUSrcControlInstruction <= 1;
      memReadControlInstruction <= 1;
      memToRegControlInstruction <= 1;
      ALUOpControlInstruction <= 3'b010;
    end

    default begin

      end
  endcase
end
endmodule
