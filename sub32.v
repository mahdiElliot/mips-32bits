module sub32(a, b, s, cout);
    input  [31:0] a, b;
    output [31:0] s;
    output cout;
    
    wire [31:0] sum;
    reg  [31:0] c;

    integer i;

    always @(*)
    begin
        for(i=0;i<32;i=i+1)
            c[i]=~b[i];
    end
    
    FA32 fa(c, 32'b1, 1'b0, sum, c1);
    FA32 fa1(a, sum, c1, s, cout);
    
endmodule
