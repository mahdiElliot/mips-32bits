module MEM_WB(clock,readData,aluResult,muxInst,WB,readDataOut,aluResultOut,muxInstOut,WBOut);

    input clock;
    input [31:0] readData,aluResult;
    input [4:0] muxInst;
    input [1:0] WB;

    output reg [31:0] readDataOut,aluResultOut;
    output reg [4:0] muxInstOut;
    output reg [1:0] WBOut;

    always @(posedge clock)
    begin
        assign readDataOut=readData;
        assign aluResultOut=aluResult;
        assign muxInstOut=muxInst;
        assign WBOut=WB;
    end

endmodule