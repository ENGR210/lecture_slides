`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2021 06:14:16 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );
    
logic clk;
logic rst;
wire  out;
    
//
counter cnt0 ( .clk, .rst, .out);
 
 
always #10 clk = ~clk;

initial begin
    clk = 0; rst = 1;
    @(negedge clk);
    @(negedge clk); 
 
    rst = 0;
    
    for (int i = 0; i < 100; ++i) begin
        @(negedge clk);
    end
    
    $finish;
    
end
 
 endmodule
