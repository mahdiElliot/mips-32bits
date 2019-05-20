module FA(a,b,cin,s,cout);
    input a,b,cin;
    output cout,s;
    
    wire w1,w2,w3,w4;
    
    xor  (w1,a,b);
    xor  (s,w1,cin);
    and  (w2,a,b);
    and  (w3,a,cin);
    and  (w4,b,cin);
    or  (cout,w2,w3,w4);
endmodule