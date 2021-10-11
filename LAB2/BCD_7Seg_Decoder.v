//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State COMPE-470L Lab 2
// Engineer: Jacob Bananal
// 
// Create Date: 08/31/2021 02:52:56 PM
// Design Name: 
// Module Name: bcd_7segment_decoder
// Project Name: BCD to 7 Segment Decoder 
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


module bcd_7segment_decoder(input[3:0]sw, output reg[6:0]seg);

//input[3:0] sw; // initialize sw (switch) as a 4 bit input signal 
//output reg[0:7] seg; //intialize seg (7segment) as a 8 bit output signal


always @*
    case(sw)
            0: seg = 7'b1000000;	// bcd = 0
			1: seg = 7'b1111001;	// bcd = 1
		    2: seg = 7'b0100100;	// bcd = 2
			3: seg = 7'b0110000;	// bcd = 3
			4: seg = 7'b0011001;	// bcd = 4
			5: seg = 7'b0010010;	// bcd = 5
			6: seg = 7'b0000010;	// bcd = 6
			7: seg = 7'b1111000;	// bcd = 7
			8: seg = 7'b0000000;	// bcd = 8
			9: seg = 7'b0010000;	// bcd = 9
			default: seg=7'b1111111;	//any other  value other the ones listed above 
    endcase


endmodule
