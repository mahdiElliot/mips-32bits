module MEM_WB(clock,readData,aluResult,muxInst,WB,readDataOut,aluResultOut,muxInstOut,WBOut);

    input clock;
    input [31:0] readData,aluResult;
    input [4:0] muxInst;
    input [1:0] WB;

    output reg [31:0] readDataOut,aluResultOut;
    output reg [4:0] muxInstOut;
    output reg [1:0] WBOut;

    /*initial
    begin
        readDataOut=32'b0;
        muxInstOut=4'b0;
        WBOut=2'b0;
    end*/

    always @(posedge clock)
    begin
         readDataOut<=readData;
         aluResultOut<=aluResult;
         muxInstOut<=muxInst;
         WBOut<=WB;
    end

endmodule