//Register controls, reads when negative clock, writes when positive
//Used in D stage

module registerController (input wire clk, input wire [4:0] readMemOneController,
  input wire [4:0] readMemTwoController, input wire [4:0] writeMemController,
  input wire [31:0] writeDataController, input wire regWriteController,
  input wire syscallController, input wire linkController, input wire [31:0] pcController,
  output reg [31:0] readDataOneController, output reg [31:0] readDataTwoController,
  output wire [31:0] v0, output wire [31:0] a0);

  reg [31:0] regs [0:31]; //all registers
  assign v0 = regs[2]; //for syscall
  assign a0 = regs[4]; //for syscall

  initial begin
    regs[0] = 32'h0; //sets $zero to zero
    regs[1] = 32'h0; //sets $zero to zero

    regs[29] = 32'h7444444c; //stack pointer
  end

    always @(posedge clk) begin
      #1 //HACK: KEEP? MAKE COMBINATIONAL? WHO KNOWS
      if (regWriteController && (writeMemController != 0)) begin //WRITE
        //$display($time, "(write) register: %x value: %x", writeMemController, writeDataController);
        regs[writeMemController] <= writeDataController;
      end
      if (linkController) begin
        regs[31] = pcController + 32'h4;
        //$display($time, "ra set to: %d", regs[31]);
      end
    end

  always @(negedge clk) begin
      //$display($time, "(read 1) register: %x value: %x", readMemOneController, regs[readMemOneController]);
      //$display($time, "(read 2) register: %x value: %x", readMemTwoController, regs[readMemTwoController]);
      readDataOneController <= regs[readMemOneController];
      readDataTwoController <= regs[readMemTwoController];

  end
endmodule

//System calls
//Everything from printing to exiting
//Used in W stage
module syscall (input clk, input wire syscallController, input wire [31:0] v0Syscall,
  input wire [31:0] a0Syscall);
  reg strCntrl;
  wire [31:0] out;
  globalMemory globalMem(strCntrl, a0Syscall);
  always @(negedge clk) begin
  if (syscallController) begin
      //$display("Syscall %d", v0Syscall);
      strCntrl = 0;
      case (v0Syscall)
        32'd1:  begin //print integer
          $display("%d", a0Syscall);
        end
        32'd10: begin //finish program
          $display("---Program Finished---");
          $finish;
        end

        32'd4 :begin
          strCntrl = 1;
        end
        default : begin
          end
      endcase
    end
  end
endmodule
