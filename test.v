module test;
    reg clock;
    reg reset;
    
    pipeLine pl(reset,clock);
    
    initial
    begin
        clock = 1;
        reset = 1;
        #15;
        reset = 0;
        forever #15 clock =~clock;
    end
endmodule