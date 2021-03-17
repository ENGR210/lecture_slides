
module countdown_tb();

logic clk, rst;
wire moore_trigger, mealy_trigger;

countdown_moore mo0( .clk, .rst, .trigger(moore_trigger) );
countdown_mealy me0( .clk, .rst, .trigger(mealy_trigger) );

always #5 clk = ~clk;

task check (
    input moT,
    input meT);
    assert(moore_trigger == moT) else $fatal(1, "Bad Moore");
    assert(mealy_trigger == meT) else $fatal(1, "Bad Mealy");
endtask

initial begin
    clk = 'h0; rst = 'h1;
    @(negedge clk);
    rst = 'h0;
    
    @(negedge clk);
    check('h0, 'h0);
    @(negedge clk);
    check('h0, 'h0);
    @(negedge clk);
    check('h0, 'h0);
    @(negedge clk);
    check('h1, 'h1);
    @(negedge clk);
    check('h1, 'h1);
    
    $display("@@@Passed");
    $finish;
end

endmodule

