module regFile(readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
    input [4:0]  readReg1, readReg2, writeReg;
    input [31:0] writeData;
    input regWrite;
    
    output [31:0] readData1, readData2;
    
    reg [31:0] readData1, readData2;
    reg [31:0] fileReg [0:31];
    reg [31:0] a;
    
    integer i;
    
    initial
    begin
        a = 32'b0;
        for(i = 0; i < 32; i = i + 1)
        begin
            fileReg[i] = a;
            a = a + 1;
        end
    end
    
    always @(readReg1 or readReg2 or regWrite or writeReg or writeData)
    begin
        readData1 = fileReg[readReg1];
        readData2 = fileReg[readReg2];
        if(regWrite == 1'b1)
        begin
            if(writeReg != 5'b0)
                fileReg[writeReg] <= writeData;
        end
        else
        begin
        fileReg[5'b0]<=32'b0;
        $display("b=%1b",regWrite);
        end
    end
endmodule
