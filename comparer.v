module comparer(data1 , data2 , zero);
    
    input [31:0] data1,data2;
    output reg zero;

    always @*
    begin
        if(data1 - data2 == 32'b0)
            zero = 1;
        else
            zero = 0;
    end
endmodule