module BCD_Counter_testbench;
    reg enable, load, up, clk, clr;
    reg [3:0] D;
    wire CO;
    wire [3:0] Q;
   
    BCD_Counter uut (.enable(enable), .load(load), .up(up), .clk(clk), .clr(clr),
                       .D(D), .CO(CO), .Q(Q));
                       
    always #50 clk = ~clk;
    initial begin
        clk = 0; clr = 1'b0; enable = 1'b0; load = 1'b0; up = 1'b0;
        @ (posedge clk);
        D = 4'b0110;  //last digit of my RED ID is 6... 820416396  
        enable = 1'b1;
        load = 1'b1;
        up = 1'b1;
        @ (posedge clk);
        load = 1'b0;
        repeat(10)
            @ (posedge clk);
        up = 1'b0;
        repeat(2)
            @ (posedge clk);
        clr = 1'b1;
        @ (posedge clk);
        clr = 1'b0;
        repeat(4)
            @ (posedge clk);
        
        $finish;
    end
endmodule
