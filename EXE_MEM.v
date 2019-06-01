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

    /*initial
    begin
        addPcOut=32'b0;
        aluResultOut=32'b0;
        readData2Out=32'b0;
        muxInstOut=4'b0;
        zeroOut=0;
        WBOut=2'b0;
        MEMOut=3'b0;
    end*/

    always @(posedge clock)
    begin
         addPcOut<=addPc;
         aluResultOut<=aluResult;
         readData2Out<=readData2;
         muxInstOut<=muxInst;
         zeroOut<=zero;
         WBOut<=WB;
         MEMOut<=MEM;
    end

endmodule