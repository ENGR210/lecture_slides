module countdown_moore(
	input clk, rst, 
	output logic trigger
);

enum { ST_0, ST_1, ST_2, ST_3, ST_4 } state, nextState;

always_ff @(posedge clk)  begin
    if (rst) state <= ST_0;
    else     state <= nextState;
end

always_comb begin
    nextState = state; // default
    trigger = 'h0; //default
    
    case(state)

        ST_0: begin
            nextState = ST_1; //rst case handled by always_ff
            trigger = 'h0; //Moore-type's never have an if() guard on outputs
        end

        ST_1: begin
            nextState = ST_2; 
            trigger = 'h0; 
        end

        ST_2: begin
            nextState = ST_3; 
            trigger = 'h0; 
        end

        ST_3: begin
            nextState = ST_4; 
            trigger = 'h0; 
        end

        ST_4: begin
            nextState = ST_4; 
            trigger = 'h1; 
        end
    endcase
end

endmodule

