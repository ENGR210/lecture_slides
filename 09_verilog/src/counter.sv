module counter(
    input 		clk,	//clock 
    input 		rst, 	//reset
    output logic 	out	//output
); 
    logic [3:0] Q;
    logic [3:0] sum;

    always_ff @( posedge clk ) // <- sequential logic
    begin	
        if (rst) Q <= 'h0;
        else     Q <= sum;    //non-blocking
    end
	
    always_comb begin // <- combinational logic
        sum = Q + 4'h1;  //blocking
        out = sum[3];
    end
  
endmodule
