module PC(clock, reset, pc, pc_next);
    input clock, reset;
    input  [31:0] pc;
    output reg [31:0] pc_next;
    
    
    always @(posedge clock)
    begin
        if(reset == 1)
            pc_next<=32'b0;
        else
            pc_next<=pc;
    end
endmodule
