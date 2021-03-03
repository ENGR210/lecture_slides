module countdown_mealy(
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
            if (1) trigger = 'h0; //Mealy-type's can have an if guard with an output. 
        end

        ST_1: begin
            nextState = ST_2; 
        end

        ST_2: begin
            nextState = ST_3; 
        end
        
        ST_3: begin
            nextState = ST_4; 
        end

        ST_4: begin
            nextState = ST_4; 
            if (~rst) trigger = 'h1; //Mealy-type with input as guard
        end
    endcase
end

endmodule

