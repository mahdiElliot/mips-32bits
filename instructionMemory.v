module instMemory(readAddress, instruction);
    input  [31:0] readAddress;
    output reg [31:0] instruction;
    
    reg    [7:0]  instructions [0:19];
    
    integer i;
    integer j;
    integer k;
    integer h;
     
     
    initial
    begin
        //lw  $2,14($0)
        //beq $9,$9,2;
        //add $6,$2,$3;
        //sub $7,$6,$2;
        //add $6,$8,$4;
        instructions[0] = 8'b10001100;

        instructions[1] = 8'b00000010;
    
        instructions[2] = 8'b00000000;
    
        instructions[3] = 8'b00001110;

        /*instructions[4] = 8'b00000000;

        instructions[5] = 8'b00000000;

        instructions[6] = 8'b00000000;

        instructions[7] = 8'b00000000;*/
    
        /*instructions[4] = 8'b01000001;
    
        instructions[5] = 8'b00101001;
    
        instructions[6] = 8'b00000000;
    
        instructions[7] = 8'b00000010;
    
        instructions[8] = 8'b00000000;
    
        instructions[9] = 8'b01100010;
    
        instructions[10] = 8'b00110000;
    
        instructions[11] = 8'b00100000;
    
        instructions[12] = 8'b00000000;
    
        instructions[13] = 8'b11000010;
    
        instructions[14] = 8'b00111000;
    
        instructions[15] = 8'b00100010;
        
        instructions[16] = 8'b00000001;
        
        instructions[17] = 8'b00000100;
        
        instructions[18] = 8'b00110000;
        
        instructions[19] = 8'b00100000;*/
        
    end
     
    always @*
    begin
        for(h = 0; h <= 7; h = h + 1)
            instruction[h] = instructions[readAddress + 3][h];
        
        for(k = 8; k <= 15; k = k + 1)
            instruction[k] = instructions[readAddress + 2][k - 8];

        for(j = 16; j <= 23; j = j + 1)
            instruction[j] = instructions[readAddress + 1][j - 16];
            
        for(i = 24; i < 32; i = i + 1)
            instruction[i] = instructions[readAddress][i - 24];
    end
   
endmodule
