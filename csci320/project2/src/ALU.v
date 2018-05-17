//Arithmetic logic unit
//Takes in two operands, a control value to determine the arethmetic, outputs a result and a zero.
//Used in the E stage

module ALU (input wire [31:0] operandOneALU, input wire [31:0] operandTwoALU,
  input wire [3:0] ControlValueALU, output reg [31:0] resultALU, output reg zeroALU);
  initial begin
    zeroALU = 0;
  end

  always @ ( operandOneALU or operandTwoALU or ControlValueALU) begin

    case (ControlValueALU)
      4'b000 : begin //AND
        resultALU <= operandOneALU & operandTwoALU;
      end
      4'b001 : begin //OR
        resultALU <= operandOneALU | operandTwoALU;
      end
      4'b010 : begin //ADD
        resultALU <= operandOneALU + operandTwoALU;
        //$display("%x + %x = %x", operandOneALU, operandTwoALU, resultALU);
      end
      4'b011 : begin

      end
      4'b100 : begin

      end
      4'b101 : begin

      end
      4'b110 : begin //SUB
        resultALU <= operandOneALU - operandTwoALU;
      end
      4'b111 : begin //SLT
        //$display("SLT %d < %d", operandOneALU, operandTwoALU);
        resultALU <= (operandOneALU < operandTwoALU) ? 32'b1 : 31'b0;
      end
      4'b1000: begin
        resultALU <= {operandTwoALU, 16'b0};
      end
      4'b1001 : begin //SLL
        resultALU <= operandOneALU >> operandTwoALU;
      end
      4'b1010 : begin //NOR
        resultALU <= operandOneALU ~| operandTwoALU;
      end
    endcase
    //determines if zero is up if result is zero. Used to be used for branching, now useless
    if (resultALU == 0)
      zeroALU = 1;
    else
      zeroALU = 0;

  end
endmodule
