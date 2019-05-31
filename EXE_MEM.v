module EXE_MEM(clock,addPc,aluResult,zero,readData2,muxInst,WB,MEM,addPcOut,aluResultOut,
zeroOut,readData2Out,muxInstOut,WBOut,MEMOut);

    input clock;
    input [31:0] addPc;
    input [31:0] aluResult,readData2;
    input [4:0] muxInst;
    input zero;
    input [1:0] WB;
    input [2:0] MEM;

    output reg [31:0] addPcOut;
    output reg [31:0] aluResultOut,readData2Out;
    output reg [4:0] muxInstOut;
    output reg zeroOut;
    output reg [1:0] WBOut;
    output reg [2:0] MEMOut;

    always @(posedge clock)
    begin
        assign addPcOut=addPc;
        assign aluResultOut=aluResult;
        assign readData2Out=readData2;
        assign muxInstOut=muxInst;
        assign zeroOut=zero;
        assign WBOut=WB;
        assign MEMOut=MEM;
    end

endmodule