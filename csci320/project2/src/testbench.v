`include "ALU.v"
`include "control.v"
`include "instructionMemory.v"
`include "memory.v"
`include "pc.v"
`include "registers.v"
`include "branchJumpController.v"
`include "utilities.v"
`include "FtoDReg.v"
`include "DtoEReg.v"
`include "EtoMReg.v"
`include "MtoWReg.v"
`include "hazardDetection.v"

module testbench;

reg clock = 0;
wire [31:0] jumpTestAddress;
wire ALUZeroTest;
wire branchALUZeroTest;
wire [31:0] branchAddressTest;
wire [31:0] jumpResultTest;

//CONTROL WIRES

//F Control Wires
wire stallF;
wire [31:0] PCPlus4F;
wire [31:0] PCF;
wire [31:0] memTestInstruction;
wire [31:0] nextTestAddress;

//D Control Wires
wire stallD;
wire ForwardAD;
wire ForwardBD;
wire regWriteD;
wire memToRegD;
wire memWriteD;
wire [3:0] ALUControlD;
wire ALUSrcD;
wire regDstD;
wire branchD;
wire jumpD;
wire memReadD;
wire syscallD;
wire linkD;
wire bneD;
wire jrD;
wire [31:0] instrD;
wire [31:0] PCPlus4D;
wire [31:0] PCBranchD;
wire [31:0] jrMuxResult;
wire [31:0] PCD;
wire PCSrcD;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] signImmD;
wire [31:0] a0D;
wire [31:0] v0D;
wire [31:0] forwardMuxADOut;
wire [31:0] forwardMuxBDOut;
wire [3:0] branchJumpType;



//E Control Wires
wire flushE;
wire [1:0] forwardAE;
wire [1:0] forwardBE;
wire [4:0] rsE;
wire [4:0] rtE;
wire [4:0] rdE;
wire regWriteE;
wire memToRegE;
wire memWriteE;
wire [3:0] ALUControlE;
wire ALUSrcE;
wire regDstE;
wire memReadE;
wire [31:0] RD1E; //feeds into mux
wire [31:0] RD2E;
wire [31:0] srcAE;
wire [31:0] srcBE;
wire [31:0] ALUOutE;
wire [31:0] writeDataE;
wire [4:0] writeRegE;
wire [31:0] signImmE;
wire syscallE;
wire [31:0] strAddr;





//M Control Wires
wire regWriteM;
wire memToRegM;
wire memWriteM;
wire [31:0] ALUOutM;
wire [31:0] WD;
wire [31:0] writeDataM;
wire [4:0] writeRegM;
wire [31:0] RDM;
wire syscallM;


//W Control Wires
wire regWriteW;
wire memToRegW;
wire [31:0] readDataW;
wire [31:0] ALUOutW;
wire [4:0] writeRegW;
wire [31:0] resultW;
wire syscallW;




wire [31:0] monitorTemp;

always
  begin                     // inline clock generator
    #20;
    clock = ~clock;
    //if (memTestInstruction == 0)
    //  $finish;
  end
//HAZARD DETECTION
hazardDetection hazardDetection(branchD, instrD[25:21], instrD[20:16], rsE, rtE,
   writeRegE, writeRegM,writeRegW,memToRegE, regWriteE, memToRegM, regWriteM,
   regWriteW, stallF, stallD, ForwardAD, ForwardBD,flushE,forwardAE, forwardBE, forwardM);
//FETCH
//TODO: add muxes for jump/branching possibly

pc programCoutner(clock, nextTestAddress, stallF, PCF);
adder programAdder(PCF, PCPlus4F);
instructionMemory programInstructionMemory(PCF, memTestInstruction);
FtoDReg FtoD(clock, memTestInstruction, stallD, PCSrcD, PCPlus4F, instrD, PCPlus4D);


//DECODE
opCodeControl programOpCodeControler (instrD[31:26], instrD[5:0], regDstD,
  jumpD, branchD, memReadD, memToRegD, ALUControlD, memWriteD,
  ALUSrcD, regWriteD, syscallD, linkD, bneD, jrD, branchJumpType);
registerController programRegisters (clock, instrD[25:21], instrD[20:16],
  writeRegW, resultW, regWriteW, syscallW, linkD, PCPlus4D,
  RD1, RD2, v0D, a0D);
syscall programSyscall (clock, syscallW, v0D, a0D); //TODO: Add string functionality
//Branching jumping stuff
signExtend branchSignExtender (instrD[15:0], signImmD);
jumpShifter programJumpShifter (instrD[25:0], PCPlus4D[31:28], jumpTestAddress);

mux forwardMuxAD(ForwardAD, RD1, ALUOutM, forwardMuxADOut);
mux forwardMuxBD(ForwardBD, RD2, ALUOutM, forwardMuxBDOut);
//ALU branchALU (PCPlus4D, signImmD << 2, 3'b010, PCBranchD, branchALUZeroTest);
//mux jumpMux (jumpD, PCPlus4F, jumpTestAddress, jumpResultTest);
//mux jrMux(jrD, jumpResultTest, forwardMuxADOut, jrMuxResult); //GOES TO F
//mux bneMux(bneD && ~branchALUZeroTest, jrMuxResult, bneMuxResult));
branchJumpController bjController(branchJumpType,  RD1, RD2, forwardMuxADOut, forwardMuxBDOut, PCPlus4F, PCPlus4D,
   jumpTestAddress, signImmD, branchD, PCSrcD, nextTestAddress);

//TODO: UGLY
assign PCSrcD = branchD && (forwardMuxADOut == forwardMuxBDOut);

DtoEReg DtoE(clock, regWriteD, memToRegD, memWriteD, ALUControlD, ALUSrcD,regDstD,
   RD1, RD2, instrD[25:21], instrD[20:16], instrD[15:11], signImmD, flushE, syscallD,
   regWriteE, memToRegE,memWriteE,ALUControlE,ALUSrcE, regDstE, RD1E, RD2E,
   rsE, rtE,rdE,signImmE, syscallE);

//EXECUTE
fiveMux regDstMux(regDstE, rtE, rdE, writeRegE);
tripleMux forwardAETripleMux(forwardAE, RD1E, resultW, ALUOutM, srcAE);
tripleMux forwardBETripleMux(forwardBE, RD2E, resultW, ALUOutM, writeDataE);
mux ALUSrcMux (ALUSrcE, writeDataE, signImmE, srcBE);
ALU programALU (srcAE, srcBE, ALUControlE, ALUOutE, ALUZeroTest);
EtoMReg EtoM(clock, regWriteE, memToRegE, memWriteE, ALUOutE, writeDataE,
  writeRegE, syscallE, regWriteM, memToRegM, memWriteM, ALUOutM, writeDataM,
  writeRegM, syscallM);


//MEMORY
dataMemory programDataMemory(clock, ALUOutM, writeDataM, memWriteM, 1'b1, strAddr, RDM);
MtoWReg MtoW(clock, regWriteM, memToRegM, RDM, ALUOutM, writeRegM, syscallM,
  regWriteW, memToRegW, readDataW, ALUOutW, writeRegW, syscallW);


//WRITE BACK
mux dataMemMux (memToRegW, ALUOutW, readDataW, resultW);


assign monitorTemp = PCF >> 2;

initial begin
  $dumpfile("test.vcd");
  $dumpvars(0,testbench);
  //$monitor ("PC: %x, WA: %x, Instruction: %x", PCF, monitorTemp, memTestInstruction);
end


endmodule
