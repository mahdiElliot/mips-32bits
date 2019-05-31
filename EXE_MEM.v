module EXE_MEM(clock,addPc,aluResult,zero,readData2,muxInst,WB,MEM,addPcOut,aluResultOut,zeroOut,readData2Out,muxInstOut,WBOut,MEMOut);

    input clock;
    input [6:0] addPc;
    input [31:0] aluResult,readData2,muxInst;
    input zero;
    input [1:0] WB;
    input [2:0] MEM;

    output reg [6:0] addPcOut;
    output reg [31:0] aluResultOut,readData2Out,muxInstOut;
    output reg zeroOut;
    output reg [1:0] WBOut;
    output reg [2:0] MEMOut;

    always @(posedge clock)
    begin
        addPcOut=addPc;
        aluResultOut=aluResult;
        readData2Out=readData2;
        muxInstOut=muxInst;
        zeroOut=zero;
        WBOut=WB;
        MEMOut=MEM;
    end

endmodule