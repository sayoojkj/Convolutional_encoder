`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 20:50:03
// Design Name: 
// Module Name: conv_enc_tb
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


module conv_enc_tb;
  reg clk,x,rst;
  wire [1:0] z;
  conv_enc dut(clk,x,rst,z);
  initial begin
    $dumpfile("Convencoder.vcd");
    $dumpvars(0);
    clk=1'b0;
    rst=1'b1;
    #15 rst=1'b0;
  end
  always #5 clk=~clk;
  initial begin
    #12 x=1; #10 x=1; #10 x=0; #10 x=1;
    #10 x=1; #10 x=1; #10 x=0; #10 x=1;
    #10 $finish;
  end
  initial begin
    $monitor("%t,x=%b,z=%b",$time,x,z);
  end
  
endmodule
