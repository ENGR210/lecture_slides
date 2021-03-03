module prior_encoder_tb(); 

logic [3:0] x; 
wire [1:0] y; 
wire valid; 
prio_encoder pe0(.x(x), .y(y), .valid(valid) ); 

initial begin
    for(int i = 0; i < 16; i++) begin 
        x=i;
        #1;
        if (x == 4'h0)
            assert(valid == 1'h0) else $fatal(1, "ERR"); 
        else
            assert(valid == 1'h1) else $fatal(1, "ERR"); 

        if (x[0] == 1)
            assert(y==2'h0) else $fatal(1, "ERR"); 
        else if (x[1] == 1)	
            assert(y==2'h1) else $fatal(1, "ERR"); 
        else if (x[2] == 1)
            assert(y==2'h2) else $fatal(1, "ERR"); 
        else if (x[3] == 1)
            assert(y==2'h3) else $fatal(1, "ERR"); 
    end 
    $display("@@@Passed");
    $finish;
 end 
endmodule
