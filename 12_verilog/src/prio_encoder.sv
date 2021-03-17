`timescale 1ns/1ps

module prio_encoder (
    input   [3:0] x,
    output  [1:0] y,
    output        valid
);

assign valid = x[0] | x[1] | x[2] | x[3]; // or |x

logic [1:0] yR; 
assign y = yR; 
always_comb begin 
    if (x[0]) yR = 2'h0;
    else if (x[1]) yR = 2'h1;
    else if (x[2]) yR = 2'h2;
    else if (x[3]) yR = 2'h3;
end

endmodule 

