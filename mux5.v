module mux5(a, b, c, sel);
    input sel;
    input [4:0] a, b;
    output reg [4:0] c;
    
    always @(sel)
    begin
        assign c = (sel == 0) ? a : b;
    end
endmodule
