module IF_ID(clock,instruction,pc,instructionOut,pcOut);

    input clock;
    input [31:0] instruction;
    input [31:0]  pc;

    output reg [31:0] instructionOut;
    output reg [31:0] pcOut;

    always @(posedge clock)
    begin

        assign pcOut=pc;
        assign instructionOut=instruction;
        
    end

endmodule