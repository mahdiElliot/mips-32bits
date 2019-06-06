module IF_ID(clock,instruction,pc,instructionOut,pcOut);

    input clock;
    input [31:0] instruction;
    input [31:0]  pc;

    output reg [31:0] instructionOut;
    output reg [31:0] pcOut;

    /*initial
    begin
        instructionOut=32'b0;
        pcOut=32'b0;
    end*/
    
    always @(posedge clock)
    begin

         pcOut<=pc;
         instructionOut<=instruction;
        
    end

endmodule