`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 19:21:10
// Design Name: 
// Module Name: conv_enc
// Project Name: 
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

module conv_enc(input clk,
              input x,
              input rst,
               output reg [1:0] z);
  parameter S0=2'b00, S1=2'b01, S2=2'b010, S3=2'b11;
  reg [1:0] CS,NS;
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) CS<=S0;
      else CS<=NS;
    end
  always @(CS or x)
    case(CS)
      S0:begin
        NS<=x?S2:S0;
        z<=x?S3:S0;
      end
      S1:begin
        NS<=x?S2:S0;
        z<=x?S0:S3;
      end
      S2:begin
        NS<=x?S3:S1;
        z<=x?S2:S1;
      end
      S3:begin
        NS<=x?S3:S1;
        z<=x?S1:S2;
      end
      endcase
endmodule
