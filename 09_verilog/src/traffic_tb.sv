`timescale 1ns / 1ps

module traffic_tb();

logic clk;
logic rst;
logic x;
wire [2:0] Hryg;
wire [2:0] Cryg;
    
traffic t0( .clk, .rst, .x, .Hryg, .Cryg); 
 
always #10 clk = ~clk;

initial begin
    clk = 0; rst = 1; x=0;
    @(negedge clk);
    @(negedge clk); 
    rst = 0;
    
    @(negedge clk); 
    @(negedge clk); 

    x = 1;
    @(negedge clk); 
    @(negedge clk); 
    @(negedge clk); 

    x = 0; 
    @(negedge clk); 
    @(negedge clk); 
    @(negedge clk); 

    $finish;
end
 endmodule
