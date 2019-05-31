module MEM_WB(clock,readData,aluResult,muxInst,WB,readDataOut,aluResultOut,muxInstOut,WBOut);

    input clock;
    input [31:0] readData,aluResult,muxInst;
    input [1:0] WB;

    output reg [31:0] readDataOut,aluResultOut,muxInstOut;
    output reg [1:0] WBOut;

    always @(posedge clock)
    begin
        readDataOut=readData;
        aluResultOut=aluResult;
        muxInstOut=muxInst;
        WBOut=WB;
    end

endmodule