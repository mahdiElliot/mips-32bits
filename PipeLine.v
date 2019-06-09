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
    reg [1:0] WB;
    reg [2:0] MEM;
    reg [3:0] EXE;

    wire [31:0] pc_next_out_2;
    wire [31:0] readData1Out,readData2Out,extendedOut;
    wire [4:0] instruction1Out,instruction2Out;
    wire [1:0] WBOut;
    wire [2:0] MEMOut;
    wire [3:0] EXEOut;
    
    wire [31:0] result2Out, resultOut, readData2Out_2;
    wire [4:0]  writeRegMuxRegOut;
    wire [4:0] writeReg;
    wire zeroOut;
    wire [1:0] WBOut_2;
    wire [2:0] MEMOut_2;

    wire [31:0] readDataOut,resultOut_2;
    wire [1:0] WBOut_3;

    wire [31:0] pc_next;
    wire [31:0] pc;
    wire [31:0] out;
    wire [31:0] pc_next_out;
    wire [31:0] instruction;
    wire [31:0] instructionOut;
    wire [4:0]  writeRegMux;
    wire [31:0] writeData;
    wire [31:0] extended;
    wire [31:0] aluMuxOut;
    wire [31:0] result;
    wire [31:0] result2;
    wire [31:0] readData;
    wire [31:0] readData1, readData2;
    wire [31:0] shifted;
    wire PCSrc;
    wire zero;
    
    assign pc_next = out + 4;
    mux32 mux4(pc_next, result2Out, pc, PCSrc);
    PC Pc(clock, reset, pc, out);
    instMemory memory(out, instruction);
    

    IF_ID if_id(clock,instruction,pc_next,instructionOut,pc_next_out);
    
    //controller
    always @*
    begin
    if(instructionOut[31:0]==32'b0) //nop
        begin
                 aluOp1   = 0;
                 aluOp2   = 0;
                 branch   = 0;
                 regDst   = 0;
                 regWrite = 0;
                 aluSrc   = 0;
                 memRead  = 0;
                 memWrite = 0;
                 memToReg = 0;
        end
        else if(instructionOut[31:0]!=32'b0)
        begin
            if(instructionOut[31:26] == 6'b000000)
            begin
                if(instructionOut[5:0] == 6'b100000) //add
                begin
                     aluOp1   = 0;
                     aluOp2   = 0;
                     branch   = 0;
                     regDst   = 1;
                     regWrite = 1;
                     aluSrc   = 0;
                     memToReg = 0;
                     memRead  = 0;
                     memWrite = 0;
                end
            else 
                if(instructionOut[5:0] == 6'b100010) //sub
                begin
                     aluOp1   = 0;
                     aluOp2   = 1;
                     branch   = 0;
                     regDst   = 1;
                     regWrite = 1;
                     aluSrc   = 0;
                     memToReg = 0;
                     memRead  = 0;
                     memWrite = 0;
                end
            else
                if(instructionOut[5:0] == 6'b100100) //and
                begin
                     aluOp1   = 1;
                     aluOp2   = 0;
                     branch   = 0;
                     regDst   = 1;
                     regWrite = 1;
                     aluSrc   = 0;
                     memToReg = 0;
                     memRead  = 0;
                     memWrite = 0;
                end
            else
                if(instructionOut[5:0] == 6'b100101) //or
                begin
                     aluOp1   = 1;
                     aluOp2   = 1;
                     branch   = 0;
                     regDst   = 1;
                     regWrite = 1;
                     aluSrc   = 0;
                     memToReg = 0;
                     memRead  = 0;
                     memWrite = 0;
                end
            end
            else
            if(instructionOut[31:26] == 6'b100011) //lw
            begin
                 aluOp1   = 0;
                 aluOp2   = 0;
                 branch   = 0;
                 regDst   = 0;
                 regWrite = 1;
                 aluSrc   = 1;
                 memRead  = 1;
                 memWrite = 0;
                 memToReg = 1;
            end
        else
            if(instructionOut[31:26] == 6'b101011) //sw
            begin
                 aluOp1   = 0;
                 aluOp2   = 0;
                 branch   = 0;
                 regDst   = 0;
                 regWrite = 0;
                 aluSrc   = 1;
                 memRead  = 0;
                 memWrite = 1;
            end

        else //beq
        begin
             aluOp1   = 0;
             aluOp2   = 1;
             branch   = 1; //branch
             regWrite = 0;
             aluSrc   = 0;
             memRead  = 0;
             memWrite = 0;
        end
        end
        
        WB[1]=regWrite;
        WB[0]=memToReg;

        MEM[2]=branch;
        MEM[1]=memRead;
        MEM[0]=memWrite;

        EXE[3]=regDst;
        EXE[2]=aluOp2;
        EXE[1]=aluOp1;
        EXE[0]=aluSrc;

    end   

    //end of controller
    
  
    regFile regfile(clock,instructionOut[25 : 21], instructionOut[20 : 16], writeReg, writeData, WBOut_3[1], readData1, readData2);
    
    comparer compare(readData1, readData2, zero);
    
    assign extended={16'b0, instructionOut[15 : 0]};

    ID_EXE id_exe(clock, pc_next_out, zero, readData1,readData2, extended, instructionOut[20 : 16],
    instructionOut[15:11], WB,MEM,EXE, pc_next_out_2, zeroOut, readData1Out, readData2Out, extendedOut,
    instruction1Out, instruction2Out, WBOut, MEMOut, EXEOut);

        //shift left
    assign shifted = {extendedOut[29 : 0], 2'b00};
    
    assign result2 = shifted + pc_next_out_2;
    
    mux32 mux2(readData2Out, extendedOut, aluMuxOut, EXEOut[0]);
    ALU alu(readData1Out, aluMuxOut, EXEOut[1], EXEOut[2], result);

    mux5 mux1(instruction1Out, instruction2Out, writeRegMux, EXEOut[3]);

    EXE_MEM exe_mem(clock, result2, result, readData2Out, writeRegMux, WBOut, MEMOut,
    result2Out, resultOut, readData2Out_2, writeRegMuxRegOut, WBOut_2, MEMOut_2);

    and(PCSrc, zeroOut, MEMOut[2]);

    dataMemory dataMem(resultOut, readData2Out_2, MEMOut_2[0], MEMOut_2[1], readData);


    MEM_WB mem_wb(clock, readData, resultOut, writeRegMuxRegOut, WBOut_2, readDataOut, 
    resultOut_2, writeReg, WBOut_3);

    mux32 mux3(resultOut_2, readDataOut, writeData, WBOut_3[0]);
    
    
endmodule
