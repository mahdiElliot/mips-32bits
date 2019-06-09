module test;
    reg clock;
    reg reset;
    
    pipeLine pl(reset,clock);
    
    initial
    begin
        clock = 0;
        reset = 1;
        #3; clock = 1;
        #15;
        reset = 0;
        forever #15 clock =~clock;
    end
endmodule