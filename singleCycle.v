module singleCycle(reset, clock);
    input reset, clock;
    
    reg regDst;
    reg aluOp1;
    reg aluOp2;
    reg regWrite;
    reg memToReg;
    reg branch;
    reg memRead;
    reg memWrite;
    reg aluSrc;
    
    wire [31:0] m;
    wire [31:0] in;
    wire [31:0] out;
    wire [31:0] instruction;
    wire [4 :0]  writeReg;
    wire [31:0] writeData;
    wire [31:0] extended;
    wire [31:0] muxOut;
    wire [31:0] result;
    wire [31:0] result2;
    wire [31:0] readData;
    wire [31:0] readData1, readData2;
    wire [31:0] shifted;
    wire Zandbe;
    wire zero;
    
    
    pc pp(clock, reset, in, out);
    instMemory memory(out, instruction);
    
    always @*
    begin
        if(instruction[31:26] == 6'b000000)
        begin
            if(instruction[5:0] == 6'b100000) //add
            begin
                assign aluOp1   = 0;
                assign aluOp2   = 0;
                assign branch   = 0;
                assign regDst   = 1;
                assign regWrite = 1;
                assign aluSrc   = 0;
                assign memToReg = 0;
                assign memRead  = 0;
                assign memWrite = 0;
            end
            else 
                if(instruction[5:0] == 6'b100010) //sub
                begin
                    assign aluOp1   = 0;
                    assign aluOp2   = 1;
                    assign branch   = 0;
                    assign regDst   = 1;
                    assign regWrite = 1;
                    assign aluSrc   = 0;
                    assign memToReg = 0;
                    assign memRead  = 0;
                    assign memWrite = 0;
                end
            else
                if(instruction[5:0] == 6'b100100) //and
                begin
                    assign aluOp1   = 1;
                    assign aluOp2   = 0;
                    assign branch   = 0;
                    assign regDst   = 1;
                    assign regWrite = 1;
                    assign aluSrc   = 0;
                    assign memToReg = 0;
                    assign memRead  = 0;
                    assign memWrite = 0;
                end
            else
                if(instruction[5:0] == 6'b100101) //or
                begin
                    assign aluOp1   = 1;
                    assign aluOp2   = 1;
                    assign branch   = 0;
                    assign regDst   = 1;
                    assign regWrite = 1;
                    assign aluSrc   = 0;
                    assign memToReg = 0;
                    assign memRead  = 0;
                    assign memWrite = 0;
                end
        end
        else
            if(instruction[31:26] == 6'b100011) //lw
            begin
                assign aluOp1   = 0;
                assign aluOp2   = 0;
                assign branch   = 0;
                assign regDst   = 0;
                assign regWrite = 1;
                assign aluSrc   = 1;
                assign memRead  = 1;
                assign memWrite = 0;
                assign memToReg = 1;
            end
        else
            if(instruction[31:26] == 6'b101011) //sw
            begin
                assign aluOp1   = 0;
                assign aluOp2   = 0;
                assign branch   = 0;
                assign regDst   = 0;
                assign regWrite = 0;
                assign aluSrc   = 1;
                assign memRead  = 0;
                assign memWrite = 1;
                assign memToReg = 1;
            end
        
        else //beq
        begin
            assign aluOp1   = 0;
            assign aluOp2   = 1;
            assign branch   = 1; //branch
            assign regDst   = 0;
            assign regWrite = 0;
            assign aluSrc   = 0;
            assign memRead  = 0;
            assign memWrite = 0;
            assign memToReg = 0;
        end
        
end   

    
    
    
    mux5 mux1(instruction[20 : 16], instruction[15 : 11], writeReg, regDst);
  
    regFile regfile(instruction[25 : 21], instruction[20 : 16], writeReg, writeData, regWrite, readData1, readData2);
    
    
    assign extended={16'b0, instruction[15 : 0]};
    
    
    mux32 mux2(readData2, extended, muxOut, aluSrc);
    ALU alu(readData1, muxOut, aluOp1, aluOp2, result, zero);
    
    
    dataMemory dataMem(result, readData2, memWrite, memRead, readData);

    mux32 mux3(result, readData, writeData, memToReg);
    
    
    
    ///shift left
    
    assign shifted = {extended[29 : 0], 2'b00};
    
    assign result2 = shifted + out;
    
    
    and(Zandbe, zero, branch);
    
    assign m = out + 4;
    mux32 mux4(m, result2, in, Zandbe);
    
    
endmodule
