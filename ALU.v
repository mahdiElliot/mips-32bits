module ALU(a, b, aluOp1, aluOp2, result, zero);
    input  [31:0] a, b;
    output [31:0] result;
    reg    [31:0] result;
    input  aluOp1, aluOp2;
    output zero;

    always @(aluOp1 or aluOp2)
    begin
        if(aluOp1 == 0 && aluOp2 == 0)
            assign result = a + b;
        else 
            if(aluOp1 == 0 && aluOp2 == 1)
                assign result = a - b;
            else 
                if(aluOp1 == 1 && aluOp2 == 0)
                    assign result = a & b;
                else    
                    assign result = a | b;
    end

    assign zero = (result == 32'd0) ? 1'b1: 1'b0; 
endmodule
