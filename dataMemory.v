module dataMemory(address, dataIn, memWrite, memRead, dataOut);
    input memWrite,memRead;
    input [31:0] address, dataIn;
    output reg [31:0] dataOut;
    
    reg [31:0] memory [0:15];
    reg [31:0] a;
    
    integer i;
    
    initial
    begin
        a=5;
        for(i=0;i<16;i=i+1)
        begin
            memory[i]<=a;
            a=a+5;
        end
    end

    always @(memRead or memWrite or address or dataIn)
    begin
        if(memRead==0 && memWrite==1)
            memory[address]=dataIn;
        else
            if (memRead==1 && memWrite==0)
            begin
                dataOut=memory[address];
            end
    end
endmodule