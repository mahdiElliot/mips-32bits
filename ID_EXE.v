module ID_EXE(clock,pc,zero,readData1,readData2,sign_extended,instruction1,instruction2,WB,MEM,EXE,
pcOut,zeroOut,readData1Out,readData2Out,sign_extendedOut,instruction1Out,instruction2Out,WBOut,MEMOut,EXEOut);

    input clock;
    input [31:0] pc;
    input [31:0] readData1,readData2,sign_extended;
    input [4:0] instruction1,instruction2;
    input [1:0] WB;
    input [2:0] MEM;
    input [3:0] EXE;
    input zero;

    output reg [31:0] pcOut ;
    output reg [31:0] readData1Out,readData2Out,sign_extendedOut;
    output reg [4:0] instruction1Out,instruction2Out;
    output reg [1:0] WBOut;
    output reg [2:0] MEMOut;
    output reg [3:0] EXEOut;
    output reg zeroOut;

    initial
    begin
        pcOut=32'b0;
        readData1Out=32'b0;
        readData2Out=32'b0;
        sign_extendedOut=32'b0;
        zeroOut=0;
    end

    always @(posedge clock)
    begin
         pcOut<=pc;
         readData1Out<=readData1;
         readData2Out<=readData2;
         sign_extendedOut<=sign_extended;
         instruction1Out<=instruction1;
         instruction2Out<=instruction2;
         WBOut<=WB;
         MEMOut<=MEM;
         EXEOut<=EXE;
         zeroOut<=zero;
    end

endmodule