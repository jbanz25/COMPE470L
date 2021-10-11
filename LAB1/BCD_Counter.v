`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jacob Bananal 
// 
// Create Date: 08/25/2021 10:20:57 AM
// Design Name: 
// Module Name: BCD_Counter
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


module BCD_Counter(input clk, input enable, input load, input clr, input up, input [3:0] D, output reg CO, output reg [3:0] Q);

reg[3:0] count; // counter
reg c; // // carry 

always @ (posedge clk) begin
    if (clr == 1'b1) begin 
        count = 0;
        c = 0;
     end
     else begin
        if (enable == 1'b1) begin // if load and enable is 1, the counter will load D which is the last digit of my red ID 
            if (load == 1'b1) count = D;
            else begin
                if (up == 1'b1) begin // if up is 1, it will increment the counter 
                    count = count + 1;
                    if (count > 9) count = 0; // if counter is greater then 9, then counter is 0 
                    if (count == 9) c = 1'b1; /// if equal to 9, the carry output will be 1 
                    else c = 1'b0; // else it will be 0
             end
             else begin
                count = count - 1; // it will then decrement the counter 
                if ((count == 0) || (count > 9)) begin
                    count = 0;
                    c = 1'b1;
               end 
               else c = 1'b0;
           end
           end
        end
        CO = c; // assigns the counter with register 
        Q = count; //assigns the output Q with the counter since it is incremeting or decrementing 
      end
    end
endmodule
                
          
