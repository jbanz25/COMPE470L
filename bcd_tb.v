//`timescale 1ns / 1ns
//module bcd_tb;

//reg clk, enable, load, clr, up;
//reg [3:0] D;

//wire CO; 
//wire [3:0] Q;

//BCD_Counter uut(.clk(clk), .enable(enable), .load(load), .clr(clr), .up(up), .D(D),.CO(CO),.Q(Q));

//initial begin

//clr = 0;
//#10;
////wait 100 ns for global resey
//D = 4'b0110;
//clr = 1'b1;
//enable = 1'b1;
//load = 1'b0;
//#10;
//// load 6 from red ID
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b1;
//load = 1'b1;
//#10;
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b1;
//load = 1'b1;
//#10;
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b1;
//load = 1'b1;
//#10;
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b1;
//load = 1'b1;
//#10;
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b1;
//load = 1'b1;
//#10;
//// increment the counter 4 times
//clr = 1'b1;
//enable = 1'b1;
//up = 1'b0;
//load = 1'b1;
//#10;
//clr = 1'b0;
//#10;
////this aboe clears the count 
//end

//initial clk = 0;
//always #50 clk = ~clk;

//endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jacob Bananal 
// 
// Create Date: 08/25/2021 10:20:57 AM
// Design Name: 
// Module Name: BCD_Counter testbench
// Project Name: COMPE-470L LAB 1
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

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


