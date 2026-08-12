
---

# 2. `stack.v`

```verilog
module stack (
    input        clk,
    input        reset,
    input        push,
    input        pop,
    input  [3:0] data_in,

    output reg [3:0] data_out,
    output            full,
    output            empty
);

    // 8 locations, each 4 bits wide
    reg [3:0] stack_mem [0:7];

    // Stack pointer
    reg [3:0] sp;

    integer i;

    // Status flags
    assign empty = (sp == 0);
    assign full  = (sp == 8);

    always @(posedge clk) begin

        if (reset) begin

            sp = 0;
            data_out = 4'b0000;

            for (i = 0; i < 8; i = i + 1)
                stack_mem[i] = 4'b0000;

        end

        else begin

            // Push operation
            if (push && !full) begin

                stack_mem[sp] = data_in;
                sp = sp + 1;

            end

            // Pop operation
            else if (pop && !empty) begin

                sp = sp - 1;
                data_out = stack_mem[sp - 1];

            end

        end

    end

endmodule