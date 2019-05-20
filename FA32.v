module FA32(a,b,cin,s,cout);
    input [31:0] a,b;
    input cin;
    output [31:0] s;
    output cout;
    
    wire [31:0] c;
    
    FA f(a[0],b[0],cin,s[0],c[0]);
    
    genvar i;
    
    generate
        for(i=1;i<32;i=i+1)
        begin 
        FA f1(a[i],b[i],c[i-1],s[i],c[i]);
    end
    assign cout=c[31];
    endgenerate
    
    
    
endmodule
