module mux32(a, b, c, sel);
    input sel;
    input [31:0] a, b;
    output reg [31:0] c;
    
    always @(sel or a or b)
    begin
        if(sel == 0)
           c = a;
        else
           c = b;
    end
endmodule