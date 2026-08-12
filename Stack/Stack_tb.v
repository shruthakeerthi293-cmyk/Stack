`timescale 1ns/1ps

module stack_tb;

    reg clk;
    reg reset;
    reg push;
    reg pop;
    reg [3:0] data_in;

    wire [3:0] data_out;
    wire full;
    wire empty;

    // Instantiate Stack
    stack uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        push = 0;
        pop = 0;
        data_in = 0;

        $display("--------------------------------------------");
        $display("             4-BIT STACK");
        $display("--------------------------------------------");
        $display(" Operation | Data | Data Out | Full | Empty");
        $display("--------------------------------------------");

        // Reset
        #10;
        reset = 0;

        // Push 5
        data_in = 4'd5;
        push = 1;
        #10;
        push = 0;

        $display("   PUSH    |  %2d  |    %2d    |  %b   |   %b",
                 data_in, data_out, full, empty);

        // Push 9
        data_in = 4'd9;
        push = 1;
        #10;
        push = 0;

        $display("   PUSH    |  %2d  |    %2d    |  %b   |   %b",
                 data_in, data_out, full, empty);

        // Push 3
        data_in = 4'd3;
        push = 1;
        #10;
        push = 0;

        $display("   PUSH    |  %2d  |    %2d    |  %b   |   %b",
                 data_in, data_out, full, empty);

        // Pop
        pop = 1;
        #10;
        pop = 0;

        $display("   POP     |  --  |    %2d    |  %b   |   %b",
                 data_out, full, empty);

        // Pop
        pop = 1;
        #10;
        pop = 0;

        $display("   POP     |  --  |    %2d    |  %b   |   %b",
                 data_out, full, empty);

        // Push 12
        data_in = 4'd12;
        push = 1;
        #10;
        push = 0;

        $display("   PUSH    |  %2d  |    %2d    |  %b   |   %b",
                 data_in, data_out, full, empty);

        // Pop
        pop = 1;
        #10;
        pop = 0;

        $display("   POP     |  --  |    %2d    |  %b   |   %b",
                 data_out, full, empty);

        $display("--------------------------------------------");

        $finish;

    end

endmodule